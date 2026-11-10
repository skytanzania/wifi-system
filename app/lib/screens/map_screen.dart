// Access Point Map — Google Maps (when the app is built with a Google Maps key), otherwise OpenStreetMap.
// Green = online, red = offline. Tap a marker for details, directions and the router page.
// "Set location": choose a router, then tap the map where it is installed.
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart' as fm;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:latlong2/latlong.dart' as ll;

import '../api.dart';
import '../main.dart';
import '../ui.dart';
import 'home.dart';
import 'routers.dart';
import 'webview.dart';

/// Set by the build (GitHub secret GOOGLE_MAPS_API_KEY → --dart-define=MAPS_API_KEY=…).
const kMapsKey = String.fromEnvironment('MAPS_API_KEY');
bool get useGoogleMaps => kMapsKey.isNotEmpty;

const _dar = (-6.7924, 39.2083); // Dar es Salaam — start point when no router has a position yet

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Map<String, dynamic>> _pts = [];
  String _publicUrl = '';
  bool _loading = true;
  Object? _err;
  Map<String, dynamic>? _sel; // selected marker
  Map<String, dynamic>? _placing; // router waiting for a tap on the map
  gm.MapType _type = gm.MapType.normal;
  gm.GoogleMapController? _gc;
  final _mc = fm.MapController();
  bool _osmReady = false;

  List<Map<String, dynamic>> get _onMap => _pts.where((p) => p['lat'] != null && p['lng'] != null).toList();

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final d = await Api.I.getMap('map', Session.isAdmin ? {'seller': 0} : null);
      if (!mounted) return;
      setState(() {
        _pts = toList(d['points']).map(toMap).toList();
        _publicUrl = toStr(d['public_map_url']);
        _loading = false;
        _err = null;
      });
      _fit();
    } catch (e) {
      if (mounted) {
        setState(() {
          _err = e;
          _loading = false;
        });
      }
    }
  }

  // ---------- camera ----------
  void _fit() {
    final pts = _onMap;
    if (pts.isEmpty) return;
    double minLa = 90, maxLa = -90, minLo = 180, maxLo = -180;
    for (final p in pts) {
      final la = toDouble(p['lat']), lo = toDouble(p['lng']);
      if (la < minLa) minLa = la;
      if (la > maxLa) maxLa = la;
      if (lo < minLo) minLo = lo;
      if (lo > maxLo) maxLo = lo;
    }
    if (useGoogleMaps) {
      final c = _gc;
      if (c == null) return;
      if (pts.length == 1 || (maxLa - minLa).abs() < .0005 && (maxLo - minLo).abs() < .0005) {
        c.animateCamera(gm.CameraUpdate.newLatLngZoom(gm.LatLng(minLa, minLo), 16));
      } else {
        c.animateCamera(gm.CameraUpdate.newLatLngBounds(gm.LatLngBounds(southwest: gm.LatLng(minLa, minLo), northeast: gm.LatLng(maxLa, maxLo)), 70));
      }
    } else if (_osmReady) {
      if (pts.length == 1) {
        _mc.move(ll.LatLng(minLa, minLo), 16);
      } else {
        _mc.fitCamera(fm.CameraFit.bounds(bounds: fm.LatLngBounds(ll.LatLng(minLa, minLo), ll.LatLng(maxLa, maxLo)), padding: const EdgeInsets.all(60)));
      }
    }
  }

  void _focus(Map<String, dynamic> p) {
    setState(() => _sel = p);
    if (p['lat'] == null) return;
    final la = toDouble(p['lat']), lo = toDouble(p['lng']);
    if (useGoogleMaps) {
      _gc?.animateCamera(gm.CameraUpdate.newLatLngZoom(gm.LatLng(la, lo), 17));
    } else if (_osmReady) {
      _mc.move(ll.LatLng(la, lo), 17);
    }
  }

  // ---------- set a router's position ----------
  Future<void> _tapMap(double la, double lo) async {
    final r = _placing;
    if (r == null) {
      setState(() => _sel = null);
      return;
    }
    final ok = await confirm(context, 'Set location', 'Put "${toStr(r['name'])}" here?\n${la.toStringAsFixed(6)}, ${lo.toStringAsFixed(6)}', ok: 'Save');
    if (!ok || !mounted) return;
    final res = await runAction(context, 'map/save', {'id': r['id'], 'latitude': la.toStringAsFixed(7), 'longitude': lo.toStringAsFixed(7), 'map_public': r['pub'] == true});
    if (res != null && res.ok) {
      setState(() => _placing = null);
      await _load();
    }
  }

  void _startPlacing(Map<String, dynamic> r) {
    setState(() {
      _placing = r;
      _sel = null;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tap the map where "${toStr(r['name'])}" is installed.'), duration: const Duration(seconds: 4)));
  }

  Future<void> _pickRouter() async {
    if (_pts.isEmpty) return;
    await actionSheet(context, 'Which router?', [
      for (final p in _pts) (p['lat'] == null ? FontAwesomeIcons.locationCrosshairs : FontAwesomeIcons.locationDot, toStr(p['name']), p['on'] == true ? C.green : C.red, () => _startPlacing(p)),
    ]);
  }

  String _directions(Map<String, dynamic> p) => 'https://www.google.com/maps/dir/?api=1&destination=${toStr(p['lat'])},${toStr(p['lng'])}';

  // ---------- maps ----------
  Widget _google() {
    final markers = <gm.Marker>{
      for (final p in _onMap)
        gm.Marker(
          markerId: gm.MarkerId('r${p['id']}'),
          position: gm.LatLng(toDouble(p['lat']), toDouble(p['lng'])),
          icon: gm.BitmapDescriptor.defaultMarkerWithHue(p['on'] == true ? gm.BitmapDescriptor.hueGreen : gm.BitmapDescriptor.hueRed),
          infoWindow: gm.InfoWindow(title: toStr(p['name']), snippet: '${toStr(p['ssid'])} • ${toInt(p['live'])} online • ${money(p['today'])} today'),
          onTap: () => setState(() => _sel = p),
        ),
    };
    final first = _onMap.isNotEmpty ? _onMap.first : null;
    return gm.GoogleMap(
      initialCameraPosition: gm.CameraPosition(target: first == null ? gm.LatLng(_dar.$1, _dar.$2) : gm.LatLng(toDouble(first['lat']), toDouble(first['lng'])), zoom: 13),
      mapType: _type,
      markers: markers,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      mapToolbarEnabled: true,
      compassEnabled: true,
      padding: EdgeInsets.only(bottom: _sel != null ? 200 : 90),
      onMapCreated: (c) {
        _gc = c;
        Future<void>.delayed(const Duration(milliseconds: 400), _fit);
      },
      onTap: (p) => _tapMap(p.latitude, p.longitude),
      onLongPress: (p) {
        if (_placing == null) _pickRouterThen(p.latitude, p.longitude);
      },
    );
  }

  Future<void> _pickRouterThen(double la, double lo) async {
    if (_pts.isEmpty) return;
    await actionSheet(context, 'Put which router here?', [
      for (final p in _pts)
        (FontAwesomeIcons.locationDot, toStr(p['name']), p['on'] == true ? C.green : C.red, () {
          setState(() => _placing = p);
          _tapMap(la, lo);
        }),
    ]);
  }

  Widget _osm() {
    final first = _onMap.isNotEmpty ? _onMap.first : null;
    return fm.FlutterMap(
      mapController: _mc,
      options: fm.MapOptions(
        initialCenter: first == null ? ll.LatLng(_dar.$1, _dar.$2) : ll.LatLng(toDouble(first['lat']), toDouble(first['lng'])),
        initialZoom: 13,
        onMapReady: () {
          _osmReady = true;
          _fit();
        },
        onTap: (_, p) => _tapMap(p.latitude, p.longitude),
        onLongPress: (_, p) {
          if (_placing == null) _pickRouterThen(p.latitude, p.longitude);
        },
      ),
      children: [
        fm.TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', userAgentPackageName: 'tz.co.skytanzania.wifi', maxZoom: 19),
        fm.MarkerLayer(markers: [
          for (final p in _onMap)
            fm.Marker(
              point: ll.LatLng(toDouble(p['lat']), toDouble(p['lng'])),
              width: 44,
              height: 50,
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () => setState(() => _sel = p),
                child: Column(children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: p['on'] == true ? C.green : C.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      boxShadow: const [BoxShadow(color: Color(0x66000000), blurRadius: 8, offset: Offset(0, 3))],
                    ),
                    child: const Center(child: FaIcon(FontAwesomeIcons.wifi, size: 14, color: Colors.white)),
                  ),
                  Container(width: 3, height: 10, color: p['on'] == true ? C.green : C.red),
                ]),
              ),
            ),
        ]),
        const fm.RichAttributionWidget(attributions: [fm.TextSourceAttribution('OpenStreetMap contributors')]),
      ],
    );
  }

  // ---------- page ----------
  @override
  Widget build(BuildContext context) {
    final online = _pts.where((p) => p['on'] == true).length;
    final noPos = _pts.where((p) => p['lat'] == null).toList();
    return Scaffold(
      appBar: skyBar('Access Point Map', actions: [
        if (useGoogleMaps)
          PopupMenuButton<gm.MapType>(
            tooltip: 'Map type',
            icon: const FaIcon(FontAwesomeIcons.layerGroup, size: 18),
            onSelected: (t) => setState(() => _type = t),
            itemBuilder: (_) => const [
              PopupMenuItem(value: gm.MapType.normal, child: Text('Map')),
              PopupMenuItem(value: gm.MapType.satellite, child: Text('Satellite')),
              PopupMenuItem(value: gm.MapType.hybrid, child: Text('Satellite + names')),
              PopupMenuItem(value: gm.MapType.terrain, child: Text('Terrain')),
            ],
          ),
        IconButton(tooltip: 'Show all', icon: const FaIcon(FontAwesomeIcons.expand, size: 18), onPressed: _fit),
        IconButton(tooltip: 'Refresh', icon: const Icon(Icons.refresh), onPressed: _load),
      ]),
      body: _loading
          ? const SkeletonDetail()
          : _err != null
              ? ErrorView(_err!, () {
                  setState(() => _loading = true);
                  _load();
                })
              : Stack(children: [
                  Positioned.fill(child: useGoogleMaps ? _google() : _osm()),
                  // summary chips
                  Positioned(
                    left: 12,
                    right: 12,
                    top: 10,
                    child: Row(children: [
                      _chip(FontAwesomeIcons.towerBroadcast, '${_pts.length} routers'),
                      const SizedBox(width: 8),
                      _chip(FontAwesomeIcons.solidCircle, '$online online', color: C.green),
                      const Spacer(),
                      if (_publicUrl.isNotEmpty)
                        InkWell(
                          onTap: () => push(context, WebPage(title: 'Public WiFi map', url: _publicUrl)),
                          child: _chip(FontAwesomeIcons.earthAfrica, 'Public map'),
                        ),
                    ]),
                  ),
                  if (_placing != null)
                    Positioned(
                      left: 12,
                      right: 12,
                      top: 54,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(14, 10, 6, 10),
                        decoration: BoxDecoration(color: C.brand, borderRadius: BorderRadius.circular(14)),
                        child: Row(children: [
                          const FaIcon(FontAwesomeIcons.handPointer, color: Colors.white, size: 16),
                          const SizedBox(width: 10),
                          Expanded(child: Text('Tap the map where "${toStr(_placing!['name'])}" is installed', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
                          IconButton(icon: const Icon(Icons.close, color: Colors.white), onPressed: () => setState(() => _placing = null)),
                        ]),
                      ),
                    ),
                  // bottom: selected router card, or the router list
                  Positioned(left: 0, right: 0, bottom: 0, child: _sel != null ? _selCard(_sel!) : _listBar(noPos)),
                ]),
    );
  }

  Widget _chip(IconData i, String t, {Color? color}) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(color: C.card, borderRadius: BorderRadius.circular(20), border: Border.all(color: C.line), boxShadow: const [BoxShadow(color: Color(0x33000000), blurRadius: 10)]),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          FaIcon(i, size: 11, color: color ?? C.brand),
          const SizedBox(width: 6),
          Text(t, style: TextStyle(color: C.text, fontWeight: FontWeight.w700, fontSize: 12)),
        ]),
      );

  Widget _selCard(Map<String, dynamic> p) => SafeArea(
        top: false,
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: C.card, borderRadius: BorderRadius.circular(18), border: Border.all(color: C.line), boxShadow: const [BoxShadow(color: Color(0x55000000), blurRadius: 18)]),
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Dot(p['on'] == true),
              const SizedBox(width: 8),
              Expanded(child: Text(toStr(p['name']), style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: C.text))),
              StatusChip(p['on'] == true ? 'online' : 'offline'),
              IconButton(icon: Icon(Icons.close, color: C.muted), onPressed: () => setState(() => _sel = null)),
            ]),
            Text('${toStr(p['ssid'])} • ${toStr(p['model'])}${toStr(p['loc']).isNotEmpty ? ' • ${toStr(p['loc'])}' : ''}', style: TextStyle(color: C.muted, fontSize: 12.5)),
            const SizedBox(height: 6),
            Text('${toInt(p['live'])} online now • today ${money(p['today'])}${p['pub'] == true ? ' • on the public map' : ''}${Session.isAdmin ? ' • @${toStr(p['seller'])}' : ''}',
                style: TextStyle(color: C.body, fontSize: 13)),
            const SizedBox(height: 12),
            Row(children: [
              if (p['lat'] != null)
                Expanded(child: GradButton(onPressed: () => openUrl(context, _directions(p)), icon: Icons.directions, label: 'Directions', green: true)),
              if (p['lat'] != null) const SizedBox(width: 8),
              Expanded(child: GradButton(onPressed: () => push(context, RouterDetailScreen(toInt(p['id']))), icon: Icons.router_outlined, label: 'Router')),
              const SizedBox(width: 8),
              IconBtn(FontAwesomeIcons.locationCrosshairs, tooltip: 'Move', onTap: () => _startPlacing(p)),
            ]),
          ]),
        ),
      );

  Widget _listBar(List<Map<String, dynamic>> noPos) => SafeArea(
        top: false,
        child: Container(
          height: 104,
          margin: const EdgeInsets.only(bottom: 10),
          child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 12), children: [
            for (final p in _pts)
              GestureDetector(
                onTap: () => p['lat'] == null ? _startPlacing(p) : _focus(p),
                child: Container(
                  width: 200,
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: C.card, borderRadius: BorderRadius.circular(16), border: Border.all(color: C.line), boxShadow: const [BoxShadow(color: Color(0x44000000), blurRadius: 12)]),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [
                      Dot(p['on'] == true),
                      const SizedBox(width: 8),
                      Expanded(child: Text(toStr(p['name']), maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w800, color: C.text))),
                    ]),
                    const SizedBox(height: 4),
                    Text(toStr(p['ssid']), maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: C.muted, fontSize: 12)),
                    const Spacer(),
                    p['lat'] == null
                        ? const Text('📍 Tap to set location', style: TextStyle(color: C.amber, fontSize: 12, fontWeight: FontWeight.w700))
                        : Text('${toInt(p['live'])} online • ${money(p['today'])}', style: TextStyle(color: C.body, fontSize: 12)),
                  ]),
                ),
              ),
            if (_pts.isEmpty)
              Container(
                width: 260,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: C.card, borderRadius: BorderRadius.circular(16), border: Border.all(color: C.line)),
                child: Text('No routers yet. Add a router, then set its location here.', style: TextStyle(color: C.muted)),
              ),
            if (noPos.isNotEmpty)
              GestureDetector(
                onTap: _pickRouter,
                child: Container(
                  width: 150,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(gradient: C.grad, borderRadius: BorderRadius.circular(16)),
                  child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    FaIcon(FontAwesomeIcons.locationCrosshairs, color: Colors.white),
                    SizedBox(height: 8),
                    Text('Set a location', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                  ]),
                ),
              ),
          ]),
        ),
      );
}
