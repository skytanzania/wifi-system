// Vouchers: list, generate, details (QR), block / delete, batches + printing
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../api.dart';
import '../ui.dart';
import 'home.dart';
import 'webview.dart';

const _statuses = ['all', 'available', 'sold', 'active', 'expired', 'exhausted', 'blocked', 'cancelled'];

class VouchersTab extends StatefulWidget {
  const VouchersTab({super.key});
  @override
  State<VouchersTab> createState() => _VouchersTabState();
}

/// Like the website's Vouchers page: "Generate Vouchers" card, "Batch" card, then the searchable list.
class _VouchersTabState extends State<VouchersTab> {
  String _status = 'all';
  String _q = '';
  final _k = GlobalKey<PagedListState>();
  final _search = TextEditingController();
  final _qty = TextEditingController(text: '20');
  List<Map<String, dynamic>> _pkgs = [];
  List<Map<String, dynamic>> _batches = [];
  int? _pkg;
  bool _gen = false;

  @override
  void initState() {
    super.initState();
    _loadSide();
  }

  Future<void> _loadSide() async {
    try {
      final p = (await Api.I.getList('packages')).map(toMap).where((p) => toBool(p['is_active'])).toList();
      final b = (await Api.I.getList('vouchers/batches')).map(toMap).toList();
      if (!mounted) return;
      setState(() {
        _pkgs = p;
        _batches = b;
        if (_pkg == null || !_pkgs.any((x) => toInt(x['id']) == _pkg)) _pkg = _pkgs.isEmpty ? null : toInt(_pkgs.first['id']);
      });
    } catch (_) {}
  }

  Future<void> _reload() async {
    await _loadSide();
    await _k.currentState?.reload();
  }

  Future<void> _generate() async {
    if (_pkg == null) {
      showMessage(context, 'Create a package first (menu → Packages).', type: 'warning');
      return;
    }
    setState(() => _gen = true);
    final r = await runAction(context, 'vouchers/generate', {'package_id': _pkg, 'quantity': toInt(_qty.text, 20)}, popup: false);
    if (mounted) setState(() => _gen = false);
    if (r == null || !mounted) return;
    if (!r.ok) {
      showMessage(context, r.message, type: r.type);
      return;
    }
    await _reload();
    if (!mounted) return;
    final batch = toStr(r.params['batch']);
    final doPrint = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.check_circle_rounded, color: C.green, size: 48),
        content: Text(r.message.replaceAll(' — Print', ''), textAlign: TextAlign.center),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Close')),
          FilledButton.icon(onPressed: () => Navigator.pop(ctx, true), icon: const Icon(Icons.print), label: const Text('Print')),
        ],
      ),
    );
    if (doPrint == true && mounted && batch.isNotEmpty) openPrint(context, batch);
  }

  @override
  Widget build(BuildContext context) => PagedList(
        key: _k,
        route: 'vouchers',
        query: {'status': _status == 'all' ? '' : _status, 'q': _q},
        empty: 'No vouchers here.',
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 110),
        header: (ctx, extra, reload) {
          final c = toMap(extra['counts']);
          return [
            WebCard(
              title: 'Generate Vouchers',
              icon: FontAwesomeIcons.ticket,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                    flex: 3,
                    child: labeled(
                      'Package',
                      DropdownButtonFormField<int>(
                        key: ValueKey('pk${_pkgs.length}'),
                        initialValue: _pkg,
                        isExpanded: true,
                        hint: const Text('No package yet'),
                        items: [for (final p in _pkgs) DropdownMenuItem(value: toInt(p['id']), child: Text('${toStr(p['name'])} — ${money(p['price'])}', overflow: TextOverflow.ellipsis))],
                        onChanged: (v) => setState(() => _pkg = v),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(flex: 2, child: labeled('Quantity', TextField(controller: _qty, keyboardType: TextInputType.number))),
                ]),
                GradButton(onPressed: _generate, busy: _gen, green: true, icon: Icons.auto_fix_high, label: 'Generate'),
              ]),
            ),
            if (_batches.isNotEmpty)
              WebCard(
                title: 'Batch',
                icon: FontAwesomeIcons.boxesStacked,
                trailing: TextButton(onPressed: () => push(ctx, const BatchesScreen()), child: const Text('All')),
                padding: const EdgeInsets.fromLTRB(14, 4, 10, 4),
                child: Column(children: [
                  for (final b in _batches.take(4))
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: C.line))),
                      child: Row(children: [
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(toStr(b['batch']), style: mono(size: 12.5, color: const Color(0xFF7FA4FF), weight: FontWeight.w500)),
                            Text('${toInt(b['unused'])}/${toInt(b['n'])} • ${fmtDate(b['created_at'])}', style: TextStyle(color: C.muted, fontSize: 12)),
                          ]),
                        ),
                        IconBtn(FontAwesomeIcons.print, tooltip: 'Print', onTap: () => openPrint(ctx, toStr(b['batch']))),
                        const SizedBox(width: 6),
                        IconBtn(FontAwesomeIcons.solidTrashCan, color: C.red, tooltip: 'Delete unused', onTap: () async {
                          if (!await confirm(ctx, 'Delete batch', 'Delete the unused vouchers of ${toStr(b['batch'])}?', ok: 'Delete', danger: true)) return;
                          await runAction(ctx, 'vouchers/delete_batch', {'batch': toStr(b['batch'])});
                          _reload();
                        }),
                      ]),
                    ),
                ]),
              ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: C.card, borderRadius: BorderRadius.circular(18), border: Border.all(color: C.line)),
              child: Column(children: [
                Row(children: [
                  Expanded(
                    child: TextField(
                      controller: _search,
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        suffixIcon: _q.isEmpty
                            ? null
                            : IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => setState(() {
                                  _search.clear();
                                  _q = '';
                                }),
                              ),
                      ),
                      onSubmitted: (v) => setState(() => _q = v.trim()),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: _status,
                      isExpanded: true,
                      items: [for (final s in _statuses) DropdownMenuItem(value: s, child: Text(s == 'all' ? 'All' : cap(s)))],
                      onChanged: (v) => setState(() => _status = v ?? 'all'),
                    ),
                  ),
                ]),
                if (c.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(spacing: 6, runSpacing: 6, children: [for (final e in c.entries) StatusChip(e.key, label: '${cap(e.key)}: ${toInt(e.value)}')]),
                  ),
                ],
              ]),
            ),
          ];
        },
        item: (ctx, v, reload) => VoucherTile(v, onChanged: _reload),
      );
}

class VoucherTile extends StatelessWidget {
  final Map<String, dynamic> v;
  final Future<void> Function()? onChanged;
  const VoucherTile(this.v, {super.key, this.onChanged});
  @override
  Widget build(BuildContext context) {
    final st = toStr(v['status']);
    final rem = v['remaining_seconds'];
    return GlowCard(
      glow: statusColor(st),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      onTap: () async {
        await Navigator.push(context, MaterialPageRoute(builder: (_) => VoucherDetailScreen(id: toInt(v['id']))));
        await onChanged?.call();
      },
      child: Row(children: [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(toStr(v['code']), style: const TextStyle(fontFamily: kMono, fontWeight: FontWeight.w900, fontSize: 17, letterSpacing: 1.5)),
            const SizedBox(height: 3),
            Text('${toStr(v['package_name'], fmtMinutes(v['duration_minutes']))} • ${money(v['price'])}${toInt(v['macs']) > 0 ? ' • ${toInt(v['macs'])} device(s)' : ''}',
                style: TextStyle(color: C.muted, fontSize: 12.5)),
            if (rem != null) Text('${fmtSecs(rem)} left', style: const TextStyle(color: C.green, fontSize: 12.5, fontWeight: FontWeight.w700)),
          ]),
        ),
        StatusChip(st),
      ]),
    );
  }
}

/// Generate vouchers for a package (then offer printing).
Future<void> showGenerateDialog(BuildContext context, {Future<void> Function()? then}) async {
  List<Map<String, dynamic>> pkgs;
  try {
    pkgs = (await Api.I.getList('packages')).map(toMap).where((p) => toBool(p['is_active'])).toList();
  } catch (e) {
    if (context.mounted) showError(context, e);
    return;
  }
  if (!context.mounted) return;
  if (pkgs.isEmpty) {
    showMessage(context, 'Create a package first (More → Packages).', type: 'warning');
    return;
  }
  var pkg = toInt(pkgs.first['id']);
  final qty = TextEditingController(text: '20');
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setS) => AlertDialog(
        title: const Text('Generate vouchers'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          DropdownButtonFormField<int>(
            initialValue: pkg,
            isExpanded: true,
            decoration: const InputDecoration(labelText: 'Package'),
            items: [for (final p in pkgs) DropdownMenuItem(value: toInt(p['id']), child: Text('${toStr(p['name'])} — ${money(p['price'])}', overflow: TextOverflow.ellipsis))],
            onChanged: (v) => setS(() => pkg = v ?? pkg),
          ),
          const SizedBox(height: 12),
          TextField(controller: qty, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'How many (1–500)')),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Generate')),
        ],
      ),
    ),
  );
  if (ok != true || !context.mounted) return;
  final r = await runAction(context, 'vouchers/generate', {'package_id': pkg, 'quantity': toInt(qty.text, 20)}, popup: false);
  if (r == null || !context.mounted) return;
  if (!r.ok) {
    await showMessage(context, r.message, type: r.type);
    return;
  }
  final batch = toStr(r.params['batch']);
  await then?.call();
  if (!context.mounted) return;
  final doPrint = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      icon: const Icon(Icons.check_circle_rounded, color: C.green, size: 44),
      content: Text(r.message.replaceAll(' — Print', ''), textAlign: TextAlign.center),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Close')),
        FilledButton.icon(onPressed: () => Navigator.pop(ctx, true), icon: const Icon(Icons.print), label: const Text('Print')),
      ],
    ),
  );
  if (doPrint == true && context.mounted && batch.isNotEmpty) openPrint(context, batch);
}

Future<void> openPrint(BuildContext context, String batch) async {
  try {
    final d = await Api.I.getMap('vouchers/print_link', {'batch': batch});
    if (context.mounted) push(context, WebPage(title: 'Vocha $batch', url: toStr(d['print_url'])));
  } catch (e) {
    if (context.mounted) showError(context, e);
  }
}

class VoucherDetailScreen extends StatefulWidget {
  final int id;
  const VoucherDetailScreen({super.key, required this.id});
  @override
  State<VoucherDetailScreen> createState() => _VoucherDetailScreenState();
}

class _VoucherDetailScreenState extends State<VoucherDetailScreen> {
  final _k = GlobalKey<AsyncPageState<Map<String, dynamic>>>();

  Future<void> _status(String to) async {
    await runAction(context, 'vouchers/status', {'id': widget.id, 'to': to});
    _k.currentState?.reload();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: skyBar('Voucher'),
        body: AsyncPage<Map<String, dynamic>>(
          skeleton: const SkeletonDetail(),
          key: _k,
          load: () => Api.I.getMap('vouchers/get', {'id': widget.id}),
          build: (ctx, v, reload) {
            final st = toStr(v['status']);
            final code = toStr(v['code']);
            return [
              GlowCard(
                glow: statusColor(st),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                    child: QrImageView(data: toStr(v['qr_url'], code), size: 180, backgroundColor: Colors.white),
                  ),
                  const SizedBox(height: 14),
                  SelectableText(code, style: const TextStyle(fontFamily: kMono, fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: 3)),
                  const SizedBox(height: 6),
                  StatusChip(st),
                  const SizedBox(height: 12),
                  Row(children: [
                    Expanded(child: OutlinedButton.icon(onPressed: () => copyText(ctx, code, what: 'Code copied'), icon: const Icon(Icons.copy), label: const Text('Copy'))),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => copyText(ctx, 'Vocha ya WiFi: $code\n${toStr(v['package_name'])} — ${money(v['price'])}\nIngiza: ${toStr(v['qr_url'])}', what: 'Message copied'),
                        icon: const Icon(Icons.share_outlined),
                        label: const Text('Message'),
                      ),
                    ),
                  ]),
                ]),
              ),
              const SectionTitle('Details'),
              GlowCard(
                child: Column(children: [
                  KV('Package', toStr(v['package_name'])),
                  KV('Price', money(v['price'])),
                  KV('Duration', fmtMinutes(v['duration_minutes'])),
                  KV('Time counts', cap(toStr(v['time_mode']))),
                  KV('Data limit', toInt(v['data_limit_mb']) > 0 ? '${toInt(v['data_limit_mb'])} MB' : 'Unlimited'),
                  KV('Data used', fmtBytes(v['data_used_bytes'])),
                  KV('Devices', '${toInt(v['max_devices'])}'),
                  KV('Time left', st == 'active' ? fmtSecs(v['remaining_seconds']) : '—'),
                  KV('First used', fmtDate(v['first_used_at'])),
                  KV('Expires', fmtDate(v['expires_at'])),
                  KV('Valid until', fmtDate(v['valid_until'])),
                  KV('Batch', toStr(v['batch'])),
                  KV('Sold to', toStr(v['sold_to_phone'])),
                  KV('Created', fmtDate(v['created_at'])),
                ]),
              ),
              const SizedBox(height: 12),
              Row(children: [
                if (st == 'blocked' || st == 'cancelled')
                  Expanded(child: FilledButton.icon(onPressed: () => _status('unblock'), icon: const Icon(Icons.lock_open), label: const Text('Unblock')))
                else
                  Expanded(
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(backgroundColor: C.amber),
                      onPressed: () async {
                        if (await confirm(ctx, 'Block voucher', 'Phones using $code are disconnected and cannot log in again.', ok: 'Block', danger: true)) _status('blocked');
                      },
                      icon: const Icon(Icons.block),
                      label: const Text('Block'),
                    ),
                  ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(backgroundColor: C.red),
                    onPressed: () async {
                      if (!await confirm(ctx, 'Delete voucher', 'Delete $code? Phones using it are disconnected.', ok: 'Delete', danger: true)) return;
                      final r = await runAction(ctx, 'vouchers/delete', {'id': widget.id});
                      if (r != null && r.ok && ctx.mounted) Navigator.pop(ctx);
                    },
                    icon: const Icon(Icons.delete_outline),
                    label: const Text('Delete'),
                  ),
                ),
              ]),
              if (toList(v['devices']).isNotEmpty) ...[
                const SectionTitle('Devices'),
                for (final m in toList(v['devices']).map(toMap))
                  ListTile(leading: const Icon(Icons.smartphone), title: Text(toStr(m['mac']), style: const TextStyle(fontFamily: kMono)), subtitle: Text('Last seen ${fmtDate(m['last_seen'])}')),
              ],
              if (toList(v['sessions']).isNotEmpty) ...[
                const SectionTitle('Sessions'),
                for (final s in toList(v['sessions']).map(toMap))
                  ListTile(
                    leading: Icon(Icons.wifi, color: statusColor(toStr(s['status']))),
                    title: Text('${toStr(s['device_name'], 'Router')} • ${fmtSecs(s['session_time'])}'),
                    subtitle: Text('${fmtDate(s['started_at'])} • ↓${fmtBytes(s['bytes_out'])} ↑${fmtBytes(s['bytes_in'])}'),
                  ),
              ],
              if (toList(v['adjustments']).isNotEmpty) ...[
                const SectionTitle('Time changes'),
                for (final a in toList(v['adjustments']).map(toMap))
                  ListTile(
                    leading: Icon(toInt(a['minutes']) >= 0 ? Icons.add_circle_outline : Icons.remove_circle_outline, color: toInt(a['minutes']) >= 0 ? C.green : C.red),
                    title: Text('${toInt(a['minutes']) >= 0 ? '+' : ''}${toInt(a['minutes'])} min'),
                    subtitle: Text('${toStr(a['reason'])} • ${fmtDate(a['created_at'])}'),
                  ),
              ],
            ];
          },
        ),
      );
}

class BatchesScreen extends StatefulWidget {
  const BatchesScreen({super.key});
  @override
  State<BatchesScreen> createState() => _BatchesScreenState();
}

class _BatchesScreenState extends State<BatchesScreen> {
  final _k = GlobalKey<AsyncPageState<List<dynamic>>>();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: skyBar('Batches & printing', actions: [
          IconButton(
            tooltip: 'WiFi posters',
            icon: const Icon(Icons.image_outlined),
            onPressed: () async {
              try {
                final d = await Api.I.getMap('vouchers/print_link');
                if (context.mounted) push(context, WebPage(title: 'WiFi posters', url: toStr(d['posters_url'])));
              } catch (e) {
                if (context.mounted) showError(context, e);
              }
            },
          ),
        ]),
        body: AsyncPage<List<dynamic>>(
          key: _k,
          load: () => Api.I.getList('vouchers/batches'),
          build: (ctx, list, reload) => [
            Text('Printed vouchers are in Kiswahili. To print on paper or save as PDF, open the page and tap "Open in browser".', style: TextStyle(color: C.muted, fontSize: 12.5)),
            const SizedBox(height: 12),
            if (list.isEmpty) const EmptyView('No batches yet.'),
            for (final b in list.map(toMap))
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: GlowCard(
                  padding: const EdgeInsets.all(14),
                  child: Row(children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(toStr(b['batch']), style: const TextStyle(fontFamily: kMono, fontWeight: FontWeight.w800)),
                        Text('${toStr(b['package_name'], '—')} • ${money(b['price'])}', style: TextStyle(color: C.muted, fontSize: 12.5)),
                        Text('${toInt(b['unused'])} unused of ${toInt(b['n'])} • ${fmtDate(b['created_at'])}', style: const TextStyle(fontSize: 12.5)),
                      ]),
                    ),
                    IconButton(tooltip: 'Print', icon: const Icon(Icons.print, color: C.cyan), onPressed: () => openPrint(ctx, toStr(b['batch']))),
                    IconButton(
                      tooltip: 'Delete unused',
                      icon: const Icon(Icons.delete_sweep_outlined, color: C.red),
                      onPressed: () async {
                        if (!await confirm(ctx, 'Delete batch', 'Delete the unused vouchers of ${toStr(b['batch'])}?', ok: 'Delete', danger: true)) return;
                        await runAction(ctx, 'vouchers/delete_batch', {'batch': toStr(b['batch'])});
                        reload();
                      },
                    ),
                  ]),
                ),
              ),
          ],
        ),
      );
}
