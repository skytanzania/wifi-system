// Vouchers: list, generate, details (QR), block / delete, batches + printing
import 'package:flutter/material.dart';
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

class _VouchersTabState extends State<VouchersTab> {
  String _status = 'all';
  String _q = '';
  final _k = GlobalKey<PagedListState>();
  final _search = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          heroTag: 'genv',
          onPressed: () => showGenerateDialog(context, then: () async => _k.currentState?.reload()),
          icon: const Icon(Icons.add_card),
          label: const Text('Generate'),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Row(children: [
              Expanded(
                child: TextField(
                  controller: _search,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    hintText: 'Search code',
                    prefixIcon: const Icon(Icons.search),
                    isDense: true,
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
              const SizedBox(width: 8),
              IconButton.filledTonal(
                tooltip: 'Batches & printing',
                icon: const Icon(Icons.print_outlined),
                onPressed: () => push(context, const BatchesScreen()),
              ),
            ]),
          ),
          SizedBox(
            height: 46,
            child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), children: [
              for (final s in _statuses)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(label: Text(cap(s)), selected: _status == s, onSelected: (_) => setState(() => _status = s)),
                ),
            ]),
          ),
          Expanded(
            child: PagedList(
              key: _k,
              route: 'vouchers',
              query: {'status': _status == 'all' ? '' : _status, 'q': _q},
              empty: 'No vouchers. Tap "Generate".',
              header: (ctx, extra, reload) {
                final c = toMap(extra['counts']);
                if (c.isEmpty) return const <Widget>[];
                return [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Wrap(spacing: 8, runSpacing: 6, children: [
                      for (final e in c.entries) StatusChip(e.key, label: '${cap(e.key)}: ${toInt(e.value)}'),
                    ]),
                  ),
                ];
              },
              item: (ctx, v, reload) => VoucherTile(v, onChanged: reload),
            ),
          ),
        ]),
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
            Text(toStr(v['code']), style: const TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.w900, fontSize: 17, letterSpacing: 1.5)),
            const SizedBox(height: 3),
            Text('${toStr(v['package_name'], fmtMinutes(v['duration_minutes']))} • ${money(v['price'])}${toInt(v['macs']) > 0 ? ' • ${toInt(v['macs'])} device(s)' : ''}',
                style: const TextStyle(color: C.muted, fontSize: 12.5)),
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
        appBar: AppBar(title: const Text('Voucher')),
        body: AsyncPage<Map<String, dynamic>>(
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
                  SelectableText(code, style: const TextStyle(fontFamily: 'monospace', fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: 3)),
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
                  ListTile(leading: const Icon(Icons.smartphone), title: Text(toStr(m['mac']), style: const TextStyle(fontFamily: 'monospace')), subtitle: Text('Last seen ${fmtDate(m['last_seen'])}')),
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
        appBar: AppBar(title: const Text('Batches & printing'), actions: [
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
            const Text('Printed vouchers are in Kiswahili. To print on paper or save as PDF, open the page and tap "Open in browser".', style: TextStyle(color: C.muted, fontSize: 12.5)),
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
                        Text(toStr(b['batch']), style: const TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.w800)),
                        Text('${toStr(b['package_name'], '—')} • ${money(b['price'])}', style: const TextStyle(color: C.muted, fontSize: 12.5)),
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
