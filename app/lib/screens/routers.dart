// Routers (Omada / Ruijie / Cudy): list, add / edit, details, provisioning, WiFi names, map
import 'dart:async';

import 'package:flutter/material.dart';

import '../api.dart';
import '../ui.dart';
import 'home.dart';
import 'webview.dart';

IconData brandIcon(String b) => b == 'ruijie'
    ? Icons.cell_tower
    : b == 'cudy'
        ? Icons.satellite_alt_outlined
        : b == 'mikrotik'
            ? Icons.device_hub
            : Icons.wifi;

class RouterTile extends StatelessWidget {
  final Map<String, dynamic> r;
  final Future<void> Function()? onChanged;
  const RouterTile(this.r, {super.key, this.onChanged});
  @override
  Widget build(BuildContext context) {
    final on = r['online'] == true;
    final active = r['is_active'] != false;
    return GlowCard(
      glow: on ? C.green : C.red,
      padding: const EdgeInsets.all(14),
      onTap: () async {
        await Navigator.push(context, MaterialPageRoute(builder: (_) => RouterDetailScreen(toInt(r['id']))));
        await onChanged?.call();
      },
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: C.brand.withValues(alpha: .15), borderRadius: BorderRadius.circular(14)),
          child: Icon(brandIcon(toStr(r['brand'])), color: C.brand),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Dot(on),
              const SizedBox(width: 8),
              Expanded(child: Text(toStr(r['device_name']), maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15))),
            ]),
            const SizedBox(height: 3),
            Text('${toStr(r['model'])} • ${toStr(r['ssid'])}', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: C.muted, fontSize: 12.5)),
            Text(on ? 'Online • ${toInt(r['active_sessions'])} user(s)' : 'Offline • last seen ${ago(r['last_seen'])}',
                style: TextStyle(color: on ? C.green : C.muted, fontSize: 12)),
          ]),
        ),
        if (!active) const StatusChip('blocked', label: 'Stopped'),
        Icon(Icons.chevron_right, color: C.muted),
      ]),
    );
  }
}

class RoutersScreen extends StatefulWidget {
  final bool hotspot; // the website's "Hotspot" page: the same routers, opened to provision & connect
  const RoutersScreen({super.key, this.hotspot = false});
  @override
  State<RoutersScreen> createState() => _RoutersScreenState();
}

class _RoutersScreenState extends State<RoutersScreen> {
  final _k = GlobalKey<AsyncPageState<List<dynamic>>>();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: skyBar(widget.hotspot ? 'Hotspot' : 'Routers', actions: [
          IconButton(
            tooltip: 'Refresh all statuses',
            icon: const Icon(Icons.sync),
            onPressed: () async {
              await runAction(context, 'routers/sync_all', {});
              _k.currentState?.reload();
            },
          ),
        ]),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await Navigator.push(context, MaterialPageRoute(builder: (_) => const RouterFormScreen()));
            _k.currentState?.reload();
          },
          icon: const Icon(Icons.add),
          label: const Text('Add router'),
        ),
        body: AsyncPage<List<dynamic>>(
          key: _k,
          load: () => Api.I.getList('routers'),
          build: (ctx, list, reload) => [
            Padding(
              padding: const EdgeInsets.fromLTRB(2, 0, 2, 12),
              child: Text(
                  widget.hotspot
                      ? 'Open a router to provision & connect it, start or stop its hotspot, and copy its RADIUS settings.'
                      : 'Every router (access point) you install is listed here. Add a router first, then open Hotspot to provision and connect it.',
                  style: TextStyle(color: C.muted, fontSize: 13.5)),
            ),
            if (list.isEmpty) const EmptyView('No routers yet. Tap "Add router".', icon: Icons.router_outlined),
            for (final r in list) Padding(padding: const EdgeInsets.only(bottom: 10), child: RouterTile(toMap(r), onChanged: reload)),
          ],
        ),
      );
}

// ---------------------------------------------------------------------
// Add / edit
// ---------------------------------------------------------------------
class RouterFormScreen extends StatefulWidget {
  final Map<String, dynamic>? edit;
  const RouterFormScreen({super.key, this.edit});
  @override
  State<RouterFormScreen> createState() => _RouterFormScreenState();
}

class _RouterFormScreenState extends State<RouterFormScreen> {
  Map<String, dynamic> _brands = {};
  List<Map<String, dynamic>> _models = [];
  List<Map<String, dynamic>> _pkgs = [];
  String? _brand;
  String? _model;
  int? _pkg;
  bool _loading = true;
  bool _active = true;
  bool _public = false;
  Object? _err;
  final _name = TextEditingController();
  final _mac = TextEditingController();
  final _ssid = TextEditingController();
  final _site = TextEditingController();
  final _loc = TextEditingController();
  final _sn = TextEditingController();
  final _devUser = TextEditingController();
  final _devPass = TextEditingController();
  final _exact = TextEditingController();
  final _qty = TextEditingController(text: '20');
  final _lat = TextEditingController();
  final _lng = TextEditingController();
  final _lipa = TextEditingController();

  bool get _isEdit => widget.edit != null;

  @override
  void initState() {
    super.initState();
    final e = widget.edit;
    if (e != null) {
      _brand = toStr(e['brand']);
      _model = toStr(e['model_code']);
      _name.text = toStr(e['device_name']);
      _mac.text = toStr(e['ap_mac']);
      _ssid.text = toStr(e['ssid']);
      _site.text = toStr(e['site_name']);
      _loc.text = toStr(e['location']);
      _sn.text = toStr(e['omada_sn']);
      _lipa.text = toStr(e['lipa_info']);
      _lat.text = toStr(e['latitude']);
      _lng.text = toStr(e['longitude']);
      _active = e['is_active'] != false;
      _public = e['map_public'] == true;
    }
    _load();
  }

  Future<void> _load() async {
    try {
      final m = await Api.I.getMap('routers/models');
      final p = await Api.I.getList('packages');
      setState(() {
        _brands = toMap(m['brands']);
        _models = toList(m['models']).map((e) => toMap(e)).toList();
        _pkgs = p.map((e) => toMap(e)).where((e) => toBool(e['is_active'])).toList();
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _err = e;
        _loading = false;
      });
    }
  }

  Future<void> _save() async {
    if (!_isEdit && _model == null) {
      showMessage(context, 'Choose the router brand and model first.', type: 'warning');
      return;
    }
    final body = <String, dynamic>{
      if (_isEdit) 'id': widget.edit!['id'],
      if (!_isEdit || _model != null) 'router_model': _model,
      'device_name': _name.text.trim(),
      'ap_mac': _mac.text.trim(),
      'ssid': _ssid.text.trim(),
      'site_name': _site.text.trim(),
      'location': _loc.text.trim(),
      'lipa_info': _lipa.text.trim(),
      'is_active': _active,
      'map_public': _public,
    };
    if (_brand == 'omada') {
      body['omada_sn'] = _sn.text.trim();
      if (_devUser.text.trim().isNotEmpty) {
        body['dev_user'] = _devUser.text.trim();
        body['dev_pass'] = _devPass.text;
      }
    }
    if (_brand == 'ruijie' || _brand == 'cudy') {
      if (_exact.text.trim().isNotEmpty) body['rj_model'] = _exact.text.trim();
      if (_sn.text.trim().isNotEmpty) body['omada_sn'] = _sn.text.trim();
    }
    if (_lat.text.trim().isNotEmpty && _lng.text.trim().isNotEmpty) {
      body['latitude'] = _lat.text.trim();
      body['longitude'] = _lng.text.trim();
    }
    if (!_isEdit && _pkg != null) {
      body['prov_pkg'] = _pkg;
      body['prov_qty'] = toInt(_qty.text, 20);
    }
    final r = await runAction(context, 'routers/save', body);
    if (r != null && r.ok && mounted) {
      final id = toInt(r.params['id']);
      if (!_isEdit && id > 0) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => RouterDetailScreen(id)));
      } else {
        Navigator.pop(context, true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final models = _models.where((m) => m['brand'] == _brand).toList();
    return Scaffold(
      appBar: skyBar(_isEdit ? 'Edit router' : 'Add router'),
      body: _loading
          ? loader
          : _err != null
              ? ErrorView(_err!, () {
                  setState(() => _loading = true);
                  _load();
                })
              : ListView(padding: const EdgeInsets.fromLTRB(16, 8, 16, 40), children: [
                  if (!_isEdit) ...[
                    const SectionTitle('1. Router type'),
                    Wrap(spacing: 10, runSpacing: 10, children: [
                      for (final b in _brands.entries)
                        ChoiceChip(
                          avatar: Icon(brandIcon(b.key), size: 18),
                          label: Text(toStr(toMap(b.value)['name'], b.key)),
                          selected: _brand == b.key,
                          onSelected: _models.any((m) => m['brand'] == b.key)
                              ? (_) => setState(() {
                                    _brand = b.key;
                                    _model = null;
                                  })
                              : null,
                        ),
                    ]),
                    if (_brand != null) ...[
                      const SectionTitle('2. Model'),
                      for (final m in models)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: GlowCard(
                            glow: _model == m['code'] ? C.brand : C.line,
                            padding: const EdgeInsets.all(12),
                            onTap: () => setState(() => _model = toStr(m['code'])),
                            child: Row(children: [
                              Icon(_model == m['code'] ? Icons.radio_button_checked : Icons.radio_button_off, color: _model == m['code'] ? C.brand : C.muted),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Text(toStr(m['label']), style: const TextStyle(fontWeight: FontWeight.w700)),
                                  Text(toStr(m['description']), style: TextStyle(color: C.muted, fontSize: 12)),
                                ]),
                              ),
                            ]),
                          ),
                        ),
                    ],
                  ],
                  if (_isEdit || _model != null) ...[
                    SectionTitle(_isEdit ? 'Router details' : '3. Router details'),
                    Field(_name, 'Router name (e.g. Shop Kariakoo)', icon: Icons.label_outline),
                    Field(_mac, 'MAC address (on the label, e.g. 3C-52-A1-11-22-33)', icon: Icons.qr_code),
                    Field(_ssid, 'WiFi name (SSID)', icon: Icons.wifi),
                    if (_brand == 'omada') ...[
                      Field(_sn, 'Serial number (S/N on the label)', icon: Icons.numbers),
                      Field(_devUser, 'Router login username (optional)', icon: Icons.person_outline),
                      Field(_devPass, 'Router login password (optional)', icon: Icons.lock_outline, obscure: true),
                    ],
                    if (_brand == 'ruijie' || _brand == 'cudy') ...[
                      Field(_exact, 'Exact model (if not in the list)', icon: Icons.memory),
                      Field(_sn, 'Serial number (optional)', icon: Icons.numbers),
                    ],
                    Field(_site, 'Site / area name (optional)', icon: Icons.apartment),
                    Field(_loc, 'Location (e.g. Kariakoo, Dar es Salaam)', icon: Icons.place_outlined),
                    Field(_lipa, 'Payment info shown on the portal (optional)', icon: Icons.info_outline),
                    Row(children: [
                      Expanded(child: Field(_lat, 'Latitude', keyboard: const TextInputType.numberWithOptions(decimal: true, signed: true))),
                      const SizedBox(width: 10),
                      Expanded(child: Field(_lng, 'Longitude', keyboard: const TextInputType.numberWithOptions(decimal: true, signed: true))),
                    ]),
                    SwitchListTile(value: _public, onChanged: (v) => setState(() => _public = v), title: const Text('Show on the public WiFi map'), contentPadding: EdgeInsets.zero),
                    SwitchListTile(value: _active, onChanged: (v) => setState(() => _active = v), title: const Text('Hotspot active'), contentPadding: EdgeInsets.zero),
                    if (!_isEdit && _pkgs.isNotEmpty) ...[
                      const SectionTitle('First vouchers (optional)'),
                      DropdownButtonFormField<int>(
                        initialValue: _pkg,
                        decoration: const InputDecoration(labelText: 'Package'),
                        items: [
                          const DropdownMenuItem<int>(value: null, child: Text('No vouchers now')),
                          for (final p in _pkgs) DropdownMenuItem<int>(value: toInt(p['id']), child: Text('${toStr(p['name'])} — ${money(p['price'])}')),
                        ],
                        onChanged: (v) => setState(() => _pkg = v),
                      ),
                      const SizedBox(height: 12),
                      if (_pkg != null) Field(_qty, 'How many vouchers', keyboard: TextInputType.number),
                    ],
                    const SizedBox(height: 10),
                    FilledButton.icon(onPressed: _save, icon: const Icon(Icons.save_outlined), label: Text(_isEdit ? 'Save changes' : 'Save router')),
                  ],
                ]),
    );
  }
}

// ---------------------------------------------------------------------
// Details
// ---------------------------------------------------------------------
class RouterDetailScreen extends StatefulWidget {
  final int id;
  const RouterDetailScreen(this.id, {super.key});
  @override
  State<RouterDetailScreen> createState() => _RouterDetailScreenState();
}

class _RouterDetailScreenState extends State<RouterDetailScreen> {
  final _k = GlobalKey<AsyncPageState<Map<String, dynamic>>>();
  Map<String, dynamic> _d = {};

  Future<void> _reload() async => _k.currentState?.reload();

  Future<void> _act(String route, {Map<String, dynamic> extra = const {}}) async {
    await runAction(context, route, {'id': widget.id, ...extra});
    _reload();
  }

  void _menu() {
    final brand = toStr(_d['brand']);
    final active = _d['is_active'] != false;
    actionSheet(context, toStr(_d['device_name']), [
      (Icons.edit_outlined, 'Edit router', C.brand, () async {
        await Navigator.push(context, MaterialPageRoute(builder: (_) => RouterFormScreen(edit: _d)));
        _reload();
      }),
      (active ? Icons.stop_circle_outlined : Icons.play_circle_outline, active ? 'Stop hotspot' : 'Start hotspot', active ? C.amber : C.green, () async {
        if (active && !await confirm(context, 'Stop hotspot', 'New logins are refused and connected users are disconnected.', ok: 'Stop', danger: true)) return;
        _act('routers/toggle');
      }),
      if (brand == 'omada') (Icons.rocket_launch_outlined, 'Provision & connect', C.cyan, () => _provision()),
      if (brand == 'omada') (Icons.restart_alt, 'Reboot router', C.amber, () => _act('routers/command', extra: {'cmd': 'reboot'})),
      if (brand == 'omada') (Icons.lightbulb_outline, 'Locate (blink LED)', C.brand, () => _act('routers/command', extra: {'cmd': 'locate'})),
      if (brand == 'ruijie') (Icons.sync, 'Sync with Ruijie Cloud', C.cyan, () => _act('routers/ruijie_sync')),
      (Icons.health_and_safety_outlined, 'Health check', C.green, () => _act('routers/link_check')),
      (Icons.key_outlined, 'New RADIUS passwords', C.amber, () async {
        if (!await confirm(context, 'New RADIUS passwords', 'The router must get the new passwords (Omada is updated automatically; Ruijie / Cudy: copy the new settings).', ok: 'Create')) return;
        _act('routers/regen_secrets');
      }),
      (Icons.delete_outline, 'Delete router', C.red, () async {
        if (!await confirm(context, 'Delete router', 'Delete ${toStr(_d['device_name'])}? This cannot be undone.', ok: 'Delete', danger: true)) return;
        final r = await runAction(context, 'routers/delete', {'id': widget.id});
        if (r != null && r.ok && mounted) Navigator.pop(context);
      }),
    ]);
  }

  Future<void> _provision() async {
    await showDialog<void>(context: context, barrierDismissible: false, builder: (_) => ProvisionDialog(widget.id));
    _reload();
  }

  Future<void> _addSsid() async {
    final name = TextEditingController();
    final psk = TextEditingController();
    var type = 'hotspot';
    var band = 3;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setS) => AlertDialog(
          title: const Text('Add WiFi name'),
          content: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Field(name, 'WiFi name (max 32)'),
              DropdownButtonFormField<String>(
                initialValue: type,
                decoration: const InputDecoration(labelText: 'Type'),
                items: const [
                  DropdownMenuItem(value: 'hotspot', child: Text('Hotspot (vouchers / payment)')),
                  DropdownMenuItem(value: 'private', child: Text('Private (password)')),
                  DropdownMenuItem(value: 'radius', child: Text('RADIUS')),
                  DropdownMenuItem(value: 'enterprise', child: Text('Enterprise')),
                ],
                onChanged: (v) => setS(() => type = v ?? 'hotspot'),
              ),
              const SizedBox(height: 12),
              if (type == 'private') Field(psk, 'WiFi password (8–63)'),
              DropdownButtonFormField<int>(
                initialValue: band,
                decoration: const InputDecoration(labelText: 'Band'),
                items: const [
                  DropdownMenuItem(value: 3, child: Text('2.4 GHz + 5 GHz')),
                  DropdownMenuItem(value: 1, child: Text('2.4 GHz')),
                  DropdownMenuItem(value: 2, child: Text('5 GHz')),
                ],
                onChanged: (v) => setS(() => band = v ?? 3),
              ),
            ]),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
            FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Create')),
          ],
        ),
      ),
    );
    if (ok != true || name.text.trim().isEmpty) return;
    _act('routers/ssid_create', extra: {'name': name.text.trim(), 'type': type, 'psk': psk.text, 'band': band});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: skyBar(_d.isEmpty ? 'Router' : toStr(_d['device_name']), actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: _d.isEmpty ? null : _menu),
        ]),
        body: AsyncPage<Map<String, dynamic>>(
          skeleton: const SkeletonDetail(),
          key: _k,
          load: () async {
            final d = await Api.I.getMap('routers/get', {'id': widget.id});
            if (mounted) setState(() => _d = d);
            return d;
          },
          build: (ctx, d, reload) {
            final on = d['online'] == true;
            final brand = toStr(d['brand']);
            final rad = toMap(d['radius']);
            final ssids = toList(d['extra_ssids']);
            final health = toList(d['health']);
            final hist = toList(d['history']);
            final outages = toList(d['outages']);
            final sheet = toStr(d['setup_sheet']);
            return [
              GlowCard(
                glow: on ? C.green : C.red,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Icon(brandIcon(brand), color: C.brand, size: 30),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(toStr(d['model']), style: const TextStyle(fontWeight: FontWeight.w800)),
                        Text(toStr(d['ap_mac']), style: TextStyle(color: C.muted, fontFamily: kMono)),
                      ]),
                    ),
                    StatusChip(on ? 'online' : 'offline'),
                  ]),
                  const SizedBox(height: 12),
                  Row(children: [
                    Expanded(child: _num('Online users', '${toInt(d['active_sessions'])}')),
                    Expanded(child: _num('Hotspot', d['is_active'] != false ? 'Running' : 'Stopped')),
                    Expanded(child: _num('Last RADIUS', ago(d['radius_last_auth']))),
                  ]),
                ]),
              ),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () => _act('routers/toggle'),
                    style: FilledButton.styleFrom(backgroundColor: d['is_active'] != false ? C.amber : C.green),
                    icon: Icon(d['is_active'] != false ? Icons.stop_circle_outlined : Icons.play_arrow),
                    label: Text(d['is_active'] != false ? 'Stop' : 'Start'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: brand == 'omada'
                      ? FilledButton.icon(onPressed: _provision, icon: const Icon(Icons.rocket_launch_outlined), label: const Text('Provision'))
                      : FilledButton.icon(onPressed: () => _act('routers/link_check'), icon: const Icon(Icons.health_and_safety_outlined), label: const Text('Check')),
                ),
              ]),
              const SectionTitle('Information'),
              GlowCard(
                child: Column(children: [
                  KV('WiFi name', toStr(d['ssid'])),
                  KV('Location', toStr(d['location'])),
                  KV('Site', toStr(d['site_name'])),
                  if (brand == 'omada') KV('Omada status', cap(toStr(d['omada_status'], 'unknown'))),
                  if (toStr(d['omada_sn']).isNotEmpty) KV('Serial number', toStr(d['omada_sn'])),
                  if (toStr(d['omada_ip']).isNotEmpty) KV('IP address', toStr(d['omada_ip'])),
                  KV('Provisioning', cap(toStr(d['prov_state'], '—'))),
                  KV('Last seen', fmtDate(d['last_seen'])),
                  KV('Portal visit', fmtDate(d['portal_seen_at'])),
                  KV('Hotspot key', toStr(d['nas_key']), copy: true, mono: true),
                  KV('Portal URL', toStr(d['portal_url']), copy: true),
                ]),
              ),
              if (health.isNotEmpty) ...[
                const SectionTitle('Health'),
                GlowCard(
                  child: Column(children: [
                    for (final h in health.map(toMap))
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(toStr(h['status']) == 'ok' ? Icons.check_circle : Icons.error_outline, color: toStr(h['status']) == 'ok' ? C.green : C.amber),
                        title: Text(toStr(h['msg'], toStr(h['key']))),
                        subtitle: toStr(h['fix']).isEmpty ? null : Text(toStr(h['fix']), style: TextStyle(color: C.muted)),
                      ),
                  ]),
                ),
              ],
              SectionTitle('WiFi names', trailing: TextButton.icon(onPressed: _addSsid, icon: const Icon(Icons.add, size: 18), label: const Text('Add'))),
              GlowCard(
                child: Column(children: [
                  ListTile(contentPadding: EdgeInsets.zero, leading: const Icon(Icons.wifi, color: C.cyan), title: Text(toStr(d['ssid'])), subtitle: const Text('Main WiFi name')),
                  for (final s in ssids.map(toMap))
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.wifi_tethering, color: C.brand),
                      title: Text(toStr(s['name'])),
                      subtitle: Text('${cap(toStr(s['type']))} • ${toInt(s['band']) == 1 ? '2.4 GHz' : toInt(s['band']) == 2 ? '5 GHz' : '2.4 + 5 GHz'}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline, color: C.red),
                        onPressed: () async {
                          if (!await confirm(ctx, 'Delete WiFi name', 'Delete ${toStr(s['name'])}?', ok: 'Delete', danger: true)) return;
                          _act('routers/ssid_delete', extra: {'ssid': toStr(s['id'])});
                        },
                      ),
                    ),
                ]),
              ),
              if (sheet.isNotEmpty) ...[
                SectionTitle('Router settings to copy', trailing: TextButton.icon(onPressed: () => copyText(ctx, sheet, what: 'Settings copied'), icon: const Icon(Icons.copy, size: 18), label: const Text('Copy'))),
                GlowCard(child: SelectableText(sheet, style: const TextStyle(fontFamily: kMono, fontSize: 12.5, height: 1.45))),
              ],
              if (rad.isNotEmpty) ...[
                const SectionTitle('RADIUS settings'),
                GlowCard(
                  child: Column(children: [
                    KV('Server IP', toStr(rad['server_ip']), copy: true),
                    KV('Auth port', toStr(rad['auth_port'])),
                    KV('Auth password', toStr(rad['auth_secret']), copy: true, mono: true),
                    KV('Accounting IP', toStr(rad['acct_ip']), copy: true),
                    KV('Accounting port', toStr(rad['acct_port'])),
                    KV('Accounting password', toStr(rad['accounting_secret']), copy: true, mono: true),
                    KV('NAS ID', toStr(rad['nas_id'], toStr(rad['key'])), copy: true, mono: true),
                    KV('Interim update', '${toStr(rad['interim'])} s'),
                  ]),
                ),
              ],
              if (outages.isNotEmpty) ...[
                const SectionTitle('Outages (time given back to customers)'),
                for (final o in outages.map(toMap))
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: GlowCard(
                      glow: C.amber,
                      padding: const EdgeInsets.all(12),
                      child: Row(children: [
                        const Icon(Icons.power_off_outlined, color: C.amber),
                        const SizedBox(width: 10),
                        Expanded(child: Text('${fmtDate(o['started_at'])} • ${fmtSecs(o['duration_sec'])} • ${toInt(o['users'])} user(s)')),
                        StatusChip(toStr(o['status'])),
                      ]),
                    ),
                  ),
              ],
              if (hist.isNotEmpty) ...[
                const SectionTitle('History'),
                GlowCard(
                  child: Column(children: [
                    for (final h in hist.map(toMap))
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          const Icon(Icons.circle, size: 8, color: C.brand),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text('${cap(toStr(h['action']))}${toStr(h['message']).isNotEmpty ? ' — ${toStr(h['message'])}' : ''}', style: const TextStyle(fontSize: 13)),
                          ),
                          Text(fmtDate(h['created_at']), style: TextStyle(color: C.muted, fontSize: 11.5)),
                        ]),
                      ),
                  ]),
                ),
              ],
            ];
          },
        ),
      );

  Widget _num(String k, String v) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(k, style: TextStyle(color: C.muted, fontSize: 11.5)),
        Text(v, style: const TextStyle(fontWeight: FontWeight.w800)),
      ]);
}

/// "Provision & connect" for Omada: one step every 4 s until the router is connected.
class ProvisionDialog extends StatefulWidget {
  final int id;
  const ProvisionDialog(this.id, {super.key});
  @override
  State<ProvisionDialog> createState() => _ProvisionDialogState();
}

class _ProvisionDialogState extends State<ProvisionDialog> {
  final List<String> _lines = [];
  bool _done = false;
  bool _ok = false;
  Timer? _t;
  int _n = 0;

  @override
  void initState() {
    super.initState();
    _step();
  }

  @override
  void dispose() {
    _t?.cancel();
    super.dispose();
  }

  Future<void> _step() async {
    if (!mounted || _done) return;
    _n++;
    try {
      final j = await Api.I.postRaw('routers/provision_step', {'id': widget.id});
      final msg = toStr(j['msg'], toStr(j['message']));
      if (!mounted) return;
      setState(() {
        if (msg.isNotEmpty && (_lines.isEmpty || _lines.last != msg)) _lines.add(msg);
        _done = j['done'] == true || _n > 60;
        _ok = j['ok'] == true && j['done'] == true;
      });
    } catch (e) {
      if (mounted) setState(() => _lines.add('$e'));
    }
    if (!_done) _t = Timer(const Duration(seconds: 4), _step);
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Row(children: [
          if (!_done) const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2.4)) else Icon(_ok ? Icons.check_circle : Icons.info, color: _ok ? C.green : C.amber),
          const SizedBox(width: 12),
          Expanded(child: Text(_done ? (_ok ? 'Router connected' : 'Provisioning stopped') : 'Provisioning…')),
        ]),
        content: SizedBox(
          width: 400,
          height: 260,
          child: ListView(children: [for (final l in _lines) Padding(padding: const EdgeInsets.only(bottom: 8), child: Text('• $l', style: const TextStyle(fontSize: 13)))]),
        ),
        actions: [FilledButton(onPressed: () => Navigator.pop(context), child: Text(_done ? 'Close' : 'Run in background'))],
      );
}

// ---------------------------------------------------------------------
// WiFi names of all routers
// ---------------------------------------------------------------------
class WifiNamesScreen extends StatefulWidget {
  const WifiNamesScreen({super.key});
  @override
  State<WifiNamesScreen> createState() => _WifiNamesScreenState();
}

class _WifiNamesScreenState extends State<WifiNamesScreen> {
  final _k = GlobalKey<AsyncPageState<List<dynamic>>>();
  List<dynamic> _routers = [];

  Future<void> _add() async {
    if (_routers.isEmpty) return;
    final name = TextEditingController();
    final psk = TextEditingController();
    var router = 'all';
    var type = 'hotspot';
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setS) => AlertDialog(
          title: const Text('Add WiFi name'),
          content: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              DropdownButtonFormField<String>(
                initialValue: router,
                decoration: const InputDecoration(labelText: 'Router'),
                items: [
                  const DropdownMenuItem(value: 'all', child: Text('All my routers')),
                  for (final r in _routers.map(toMap)) DropdownMenuItem(value: '${toInt(r['router_id'])}', child: Text(toStr(r['device_name']))),
                ],
                onChanged: (v) => setS(() => router = v ?? 'all'),
              ),
              const SizedBox(height: 12),
              Field(name, 'WiFi name (max 32)'),
              DropdownButtonFormField<String>(
                initialValue: type,
                decoration: const InputDecoration(labelText: 'Type'),
                items: const [
                  DropdownMenuItem(value: 'hotspot', child: Text('Hotspot (vouchers / payment)')),
                  DropdownMenuItem(value: 'private', child: Text('Private (password)')),
                ],
                onChanged: (v) => setS(() => type = v ?? 'hotspot'),
              ),
              const SizedBox(height: 12),
              if (type == 'private') Field(psk, 'WiFi password (8–63)'),
            ]),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
            FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Create')),
          ],
        ),
      ),
    );
    if (ok != true || name.text.trim().isEmpty || !mounted) return;
    await runAction(context, 'wifi_names/add', {'router': router, 'name': name.text.trim(), 'type': type, 'psk': psk.text, 'band': 3});
    _k.currentState?.reload();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: skyBar('WiFi names'),
        floatingActionButton: FloatingActionButton.extended(onPressed: _add, icon: const Icon(Icons.add), label: const Text('WiFi name')),
        body: AsyncPage<List<dynamic>>(
          key: _k,
          load: () async {
            final l = await Api.I.getList('wifi_names');
            _routers = l;
            return l;
          },
          build: (ctx, list, reload) => [
            if (list.isEmpty) const EmptyView('Add a router first.', icon: Icons.wifi_off),
            for (final r in list.map(toMap))
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: GlowCard(
                  onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => RouterDetailScreen(toInt(r['router_id'])))),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [Dot(r['online'] == true), const SizedBox(width: 8), Text(toStr(r['device_name']), style: const TextStyle(fontWeight: FontWeight.w800))]),
                    const SizedBox(height: 8),
                    Wrap(spacing: 8, runSpacing: 8, children: [
                      Chip(avatar: const Icon(Icons.wifi, size: 16), label: Text(toStr(r['main_ssid']))),
                      for (final s in toList(r['extra_ssids']).map(toMap)) Chip(avatar: const Icon(Icons.wifi_tethering, size: 16), label: Text(toStr(s['name']))),
                    ]),
                  ]),
                ),
              ),
          ],
        ),
      );
}
