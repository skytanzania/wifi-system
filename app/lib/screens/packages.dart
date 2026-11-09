// Packages: list, add / edit, delete
import 'package:flutter/material.dart';

import '../api.dart';
import '../ui.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({super.key});
  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  final _k = GlobalKey<AsyncPageState<List<dynamic>>>();

  Future<void> _open([Map<String, dynamic>? p]) async {
    await Navigator.push(context, MaterialPageRoute(builder: (_) => PackageFormScreen(edit: p)));
    _k.currentState?.reload();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Packages')),
        floatingActionButton: FloatingActionButton.extended(onPressed: () => _open(), icon: const Icon(Icons.add), label: const Text('Package')),
        body: AsyncPage<List<dynamic>>(
          key: _k,
          load: () => Api.I.getList('packages'),
          build: (ctx, list, reload) => [
            if (list.isEmpty) const EmptyView('No packages yet. Create one (e.g. 1 hour — TZS 500).', icon: Icons.sell_outlined),
            for (final p in list.map(toMap))
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: GlowCard(
                  glow: toBool(p['is_active']) ? C.brand : C.muted,
                  onTap: () => _open(p),
                  child: Row(children: [
                    Container(
                      width: 58,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(gradient: C.grad, borderRadius: BorderRadius.circular(14)),
                      child: Column(children: [
                        Text(_big(p), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                        Text(_unit(p), style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.w700)),
                      ]),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(toStr(p['name']), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
                        const SizedBox(height: 2),
                        Text(money(p['price']), style: const TextStyle(color: C.amber, fontWeight: FontWeight.w800)),
                        Text(
                            '${toInt(p['data_limit_mb']) > 0 ? '${toInt(p['data_limit_mb'])} MB' : 'Unlimited'} • ${toInt(p['max_devices'])} device(s) • ${toInt(p['unused_vouchers'])} unused voucher(s)',
                            style: const TextStyle(color: C.muted, fontSize: 12)),
                      ]),
                    ),
                    Column(children: [
                      if (!toBool(p['is_active'])) const StatusChip('blocked', label: 'Off'),
                      if (toBool(p['is_active']) && !toBool(p['show_on_portal'])) const StatusChip('info', label: 'Hidden'),
                    ]),
                  ]),
                ),
              ),
          ],
        ),
      );

  static String _big(Map<String, dynamic> p) {
    final m = toInt(p['duration_minutes']);
    if (m >= 1440 && m % 1440 == 0) return '${m ~/ 1440}';
    if (m >= 60 && m % 60 == 0) return '${m ~/ 60}';
    return '$m';
  }

  static String _unit(Map<String, dynamic> p) {
    final m = toInt(p['duration_minutes']);
    if (m >= 1440 && m % 1440 == 0) return m == 1440 ? 'DAY' : 'DAYS';
    if (m >= 60 && m % 60 == 0) return m == 60 ? 'HOUR' : 'HOURS';
    return 'MIN';
  }
}

class PackageFormScreen extends StatefulWidget {
  final Map<String, dynamic>? edit;
  const PackageFormScreen({super.key, this.edit});
  @override
  State<PackageFormScreen> createState() => _PackageFormScreenState();
}

class _PackageFormScreenState extends State<PackageFormScreen> {
  final _name = TextEditingController();
  final _desc = TextEditingController();
  final _price = TextEditingController();
  final _dur = TextEditingController(text: '1');
  String _unit = 'hours';
  String _mode = 'continuous';
  final _data = TextEditingController(text: '0');
  final _down = TextEditingController(text: '0');
  final _up = TextEditingController(text: '0');
  final _devices = TextEditingController(text: '1');
  final _valid = TextEditingController(text: '30');
  final _sort = TextEditingController(text: '0');
  bool _portal = true;
  bool _active = true;
  int _router = 0;
  List<Map<String, dynamic>> _routers = [];

  @override
  void initState() {
    super.initState();
    final p = widget.edit;
    if (p != null) {
      _name.text = toStr(p['name']);
      _desc.text = toStr(p['description']);
      _price.text = '${toDouble(p['price']).round()}';
      final m = toInt(p['duration_minutes']);
      if (m >= 1440 && m % 1440 == 0) {
        _dur.text = '${m ~/ 1440}';
        _unit = 'days';
      } else if (m >= 60 && m % 60 == 0) {
        _dur.text = '${m ~/ 60}';
        _unit = 'hours';
      } else {
        _dur.text = '$m';
        _unit = 'minutes';
      }
      _mode = toStr(p['time_mode'], 'continuous');
      _data.text = '${toInt(p['data_limit_mb'])}';
      _down.text = toStr(p['speed_down_mbps'], '0');
      _up.text = toStr(p['speed_up_mbps'], '0');
      _devices.text = '${toInt(p['max_devices'], 1)}';
      _valid.text = '${toInt(p['validity_days'], 30)}';
      _sort.text = '${toInt(p['sort_order'])}';
      _portal = toBool(p['show_on_portal']);
      _active = toBool(p['is_active']);
      _router = toInt(p['device_id']);
    }
    Api.I.getList('routers').then((l) {
      if (mounted) setState(() => _routers = l.map(toMap).toList());
    }).catchError((_) {});
  }

  int get _minutes {
    final n = toInt(_dur.text, 1);
    return _unit == 'days' ? n * 1440 : (_unit == 'hours' ? n * 60 : n);
  }

  Future<void> _save() async {
    if (_name.text.trim().isEmpty) {
      showMessage(context, 'Enter the package name.', type: 'warning');
      return;
    }
    final r = await runAction(context, 'packages/save', {
      if (widget.edit != null) 'id': widget.edit!['id'],
      'name': _name.text.trim(),
      'description': _desc.text.trim(),
      'price': toDouble(_price.text),
      'duration_minutes': _minutes,
      'time_mode': _mode,
      'data_limit_mb': toInt(_data.text),
      'speed_down_mbps': toDouble(_down.text),
      'speed_up_mbps': toDouble(_up.text),
      'max_devices': toInt(_devices.text, 1),
      'validity_days': toInt(_valid.text, 30),
      'sort_order': toInt(_sort.text),
      'show_on_portal': _portal,
      'is_active': _active,
      'device_id': _router,
    });
    if (r != null && r.ok && mounted) Navigator.pop(context, true);
  }

  Future<void> _delete() async {
    if (!await confirm(context, 'Delete package', 'Delete ${_name.text}? Vouchers already made keep working.', ok: 'Delete', danger: true)) return;
    final r = await runAction(context, 'packages/delete', {'id': widget.edit!['id']});
    if (r != null && r.ok && mounted) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(widget.edit == null ? 'New package' : 'Edit package'), actions: [
          if (widget.edit != null) IconButton(icon: const Icon(Icons.delete_outline, color: C.red), onPressed: _delete),
        ]),
        body: ListView(padding: const EdgeInsets.fromLTRB(16, 8, 16, 40), children: [
          Field(_name, 'Name (e.g. Saa 1, Siku 1, Wiki 1)', icon: Icons.label_outline),
          Field(_price, 'Price ($currency)', icon: Icons.payments_outlined, keyboard: TextInputType.number),
          Row(children: [
            Expanded(child: Field(_dur, 'Duration', keyboard: TextInputType.number)),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: DropdownButtonFormField<String>(
                  initialValue: _unit,
                  decoration: const InputDecoration(labelText: 'Unit'),
                  items: const [
                    DropdownMenuItem(value: 'minutes', child: Text('Minutes')),
                    DropdownMenuItem(value: 'hours', child: Text('Hours')),
                    DropdownMenuItem(value: 'days', child: Text('Days')),
                  ],
                  onChanged: (v) => setState(() => _unit = v ?? 'hours'),
                ),
              ),
            ),
          ]),
          DropdownButtonFormField<String>(
            initialValue: _mode,
            decoration: const InputDecoration(labelText: 'Time counts', helperText: 'Continuous: from first login. Online: only while connected.'),
            items: const [
              DropdownMenuItem(value: 'continuous', child: Text('Continuous (clock time)')),
              DropdownMenuItem(value: 'online', child: Text('Online time only')),
            ],
            onChanged: (v) => setState(() => _mode = v ?? 'continuous'),
          ),
          const SizedBox(height: 12),
          Field(_data, 'Data limit in MB (0 = unlimited)', keyboard: TextInputType.number, icon: Icons.data_usage),
          Row(children: [
            Expanded(child: Field(_down, 'Download Mbps (0 = no limit)', keyboard: const TextInputType.numberWithOptions(decimal: true))),
            const SizedBox(width: 10),
            Expanded(child: Field(_up, 'Upload Mbps', keyboard: const TextInputType.numberWithOptions(decimal: true))),
          ]),
          Row(children: [
            Expanded(child: Field(_devices, 'Devices per voucher (1–10)', keyboard: TextInputType.number)),
            const SizedBox(width: 10),
            Expanded(child: Field(_valid, 'Voucher valid (days)', keyboard: TextInputType.number)),
          ]),
          DropdownButtonFormField<int>(
            key: ValueKey('routers${_routers.length}'),
            initialValue: _routers.any((r) => toInt(r['id']) == _router) ? _router : 0,
            decoration: const InputDecoration(labelText: 'Router'),
            items: [
              const DropdownMenuItem(value: 0, child: Text('All my routers')),
              for (final r in _routers) DropdownMenuItem(value: toInt(r['id']), child: Text(toStr(r['device_name']))),
            ],
            onChanged: (v) => setState(() => _router = v ?? 0),
          ),
          const SizedBox(height: 12),
          Field(_desc, 'Description (optional)', maxLines: 2),
          Field(_sort, 'Order on the portal (small first)', keyboard: TextInputType.number),
          SwitchListTile(value: _portal, onChanged: (v) => setState(() => _portal = v), title: const Text('Show on the captive portal'), contentPadding: EdgeInsets.zero),
          SwitchListTile(value: _active, onChanged: (v) => setState(() => _active = v), title: const Text('Active'), contentPadding: EdgeInsets.zero),
          const SizedBox(height: 10),
          FilledButton.icon(onPressed: _save, icon: const Icon(Icons.save_outlined), label: const Text('Save package')),
        ]),
      );
}
