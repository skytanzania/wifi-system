// Clients: online users (disconnect / add time / block), blocked devices, customers
import 'dart:async';

import 'package:flutter/material.dart';

import '../api.dart';
import '../ui.dart';
import 'home.dart';

class ClientsTab extends StatefulWidget {
  const ClientsTab({super.key});
  @override
  State<ClientsTab> createState() => _ClientsTabState();
}

class _ClientsTabState extends State<ClientsTab> with SingleTickerProviderStateMixin {
  late final TabController _tc = TabController(length: 3, vsync: this);
  @override
  void dispose() {
    _tc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(children: [
        TabBar(controller: _tc, tabs: const [Tab(text: 'Online now'), Tab(text: 'Customers'), Tab(text: 'Blocked')]),
        Expanded(child: TabBarView(controller: _tc, children: const [SessionsView(), CustomersView(), BlockedView()])),
      ]);
}

class SessionsView extends StatefulWidget {
  const SessionsView({super.key});
  @override
  State<SessionsView> createState() => _SessionsViewState();
}

class _SessionsViewState extends State<SessionsView> with AutomaticKeepAliveClientMixin {
  final _k = GlobalKey<PagedListState>();
  String _q = '';
  Map<String, dynamic> _metrics = {};
  Timer? _t;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _live();
    _t = Timer.periodic(const Duration(seconds: 15), (_) => _live());
  }

  @override
  void dispose() {
    _t?.cancel();
    super.dispose();
  }

  Future<void> _live() async {
    try {
      final j = await Api.I.raw('sessions/metrics');
      if (mounted && j['ok'] == true) setState(() => _metrics = j);
    } catch (_) {}
  }

  Future<void> _menu(Map<String, dynamic> s) async {
    final mac = toStr(s['mac']);
    await actionSheet(context, toStr(s['code'], mac), [
      (Icons.more_time, 'Add / remove time', C.green, () => adjustTime(context, toInt(s['voucher_id']), then: () async => _k.currentState?.reload())),
      if (toInt(s['voucher_id']) > 0)
        (Icons.speed, 'Set speed of this user', C.brand, () => setUserSpeed(context, s, then: () async => _k.currentState?.reload())),
      (Icons.link_off, 'Disconnect', C.amber, () async {
        await runAction(context, 'sessions/disconnect', {'session_id': s['id']});
        _k.currentState?.reload();
      }),
      (Icons.block, 'Block this device', C.red, () async {
        final why = await askText(context, 'Block $mac', label: 'Reason', initial: 'Blocked by seller');
        if (why == null || !mounted) return;
        await runAction(context, 'sessions/block', {'mac': mac, 'reason': why});
        _k.currentState?.reload();
      }),
      if (toStr(s['phone']).isNotEmpty) (Icons.call_outlined, 'Call ${toStr(s['phone'])}', C.cyan, () => openUrl(context, 'tel:${toStr(s['phone'])}')),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final tot = toMap(_metrics['total']);
    final per = toMap(_metrics['sessions']);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 4),
        child: Row(children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(hintText: 'Search code, phone, MAC, router', prefixIcon: Icon(Icons.search), isDense: true),
              onSubmitted: (v) => setState(() => _q = v.trim()),
            ),
          ),
          const SizedBox(width: 8),
          IconBtn(Icons.block, color: C.red, tooltip: 'Blocked devices', onTap: () => push(context, Scaffold(appBar: skyBar('Blocked devices'), body: const BlockedView()))),
        ]),
      ),
      if (tot.isNotEmpty)
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
          child: Row(children: [
            const Icon(Icons.speed, size: 18, color: C.cyan),
            const SizedBox(width: 6),
            Text('↓ ${fmtBytes(tot['down'])}/s   ↑ ${fmtBytes(tot['up'])}/s', style: TextStyle(color: C.muted, fontSize: 12.5)),
            const Spacer(),
            Text('updated ${toStr(_metrics['at'])}', style: TextStyle(color: C.muted, fontSize: 11.5)),
          ]),
        ),
      Expanded(
        child: PagedList(
          key: _k,
          route: 'sessions',
          query: {'q': _q},
          empty: 'Nobody is online right now.',
          item: (ctx, s, reload) {
            final m = toMap(per['${s['id']}']);
            return GlowCard(
              glow: C.green,
              padding: const EdgeInsets.all(14),
              onTap: () => _menu(s),
              child: Row(children: [
                const Icon(Icons.smartphone, color: C.green),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(toStr(s['code'], toStr(s['username'])), style: const TextStyle(fontFamily: kMono, fontWeight: FontWeight.w800)),
                    Text('${toStr(s['package_name'], '—')} • ${toStr(s['device_name'], '')}', style: TextStyle(color: C.muted, fontSize: 12.5)),
                    Text(
                        '${toStr(s['phone']).isNotEmpty ? '${toStr(s['phone'])} • ' : ''}${toStr(s['mac'])}${s['remaining_seconds'] != null ? ' • ${fmtSecs(s['remaining_seconds'])} left' : ''}',
                        style: const TextStyle(fontSize: 12)),
                    if (m.isNotEmpty) Text('↓ ${fmtBytes(m['down'])}/s ↑ ${fmtBytes(m['up'])}/s', style: const TextStyle(color: C.cyan, fontSize: 11.5)),
                    if (s['speed'] is Map)
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Row(children: [
                          Icon(Icons.speed, size: 14, color: _speedColor(toStr(toMap(s['speed'])['source']))),
                          const SizedBox(width: 4),
                          Flexible(child: Text('Speed: ${toStr(toMap(s['speed'])['label'])}', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: _speedColor(toStr(toMap(s['speed'])['source']))))),
                        ]),
                      ),
                  ]),
                ),
                Icon(Icons.more_vert, color: C.muted),
              ]),
            );
          },
        ),
      ),
    ]);
  }
}

Color _speedColor(String source) => source == 'fup' ? C.amber : (source == 'custom' ? C.brand : C.muted);

String _mbps(dynamic v) {
  final d = toDouble(v);
  if (d <= 0) return '0';
  return d == d.roundToDouble() ? d.toStringAsFixed(0) : d.toString();
}

/// Speed of ONE user (voucher): set download / upload in Mbps (0 = no limit) or go back to the package speed.
/// The phone is reconnected by the server and logs in again with the new speed.
Future<void> setUserSpeed(BuildContext context, Map<String, dynamic> s, {Future<void> Function()? then}) async {
  final sp = toMap(s['speed']);
  final down = TextEditingController(text: _mbps(sp['down'] ?? s['speed_down_mbps']));
  final up = TextEditingController(text: _mbps(sp['up'] ?? s['speed_up_mbps']));
  final res = await showDialog<String>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text('Speed — ${toStr(s['code'], toStr(s['username']))}'),
      content: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (sp.isNotEmpty) Text('Now: ${toStr(sp['label'])}', style: TextStyle(color: _speedColor(toStr(sp['source'])), fontWeight: FontWeight.w700)),
        const SizedBox(height: 10),
        Row(children: [
          Expanded(child: TextField(controller: down, keyboardType: const TextInputType.numberWithOptions(decimal: true), decoration: const InputDecoration(labelText: 'Download (Mbps)'))),
          const SizedBox(width: 10),
          Expanded(child: TextField(controller: up, keyboardType: const TextInputType.numberWithOptions(decimal: true), decoration: const InputDecoration(labelText: 'Upload (Mbps)'))),
        ]),
        const SizedBox(height: 8),
        Wrap(spacing: 6, runSpacing: 6, children: [
          for (final q in const [(1, 0.5), (2, 1), (5, 2), (10, 5)])
            ActionChip(
              label: Text('${q.$1}/${q.$2}'),
              onPressed: () {
                down.text = '${q.$1}';
                up.text = '${q.$2}';
              },
            ),
        ]),
        const SizedBox(height: 8),
        Text('0 = no limit. The phone reconnects by itself with the new speed.', style: TextStyle(color: C.muted, fontSize: 12)),
      ]),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
        TextButton(onPressed: () => Navigator.pop(ctx, 'reset'), child: const Text('Package speed')),
        FilledButton(onPressed: () => Navigator.pop(ctx, 'set'), child: const Text('Apply')),
      ],
    ),
  );
  if (res == null || !context.mounted) return;
  await runAction(context, 'sessions/speed', {
    'voucher_id': toInt(s['voucher_id']),
    if (res == 'reset') 'reset': true else ...{'down': toDouble(down.text.replaceAll(',', '.')), 'up': toDouble(up.text.replaceAll(',', '.'))},
  });
  await then?.call();
}

Future<void> adjustTime(BuildContext context, int voucherId, {Future<void> Function()? then}) async {
  if (voucherId <= 0) {
    showMessage(context, 'This session has no voucher.', type: 'warning');
    return;
  }
  final mins = TextEditingController(text: '30');
  final why = TextEditingController();
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Add / remove time'),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        TextField(
          controller: mins,
          keyboardType: const TextInputType.numberWithOptions(signed: true),
          decoration: const InputDecoration(labelText: 'Minutes (e.g. 30 or -15)'),
        ),
        const SizedBox(height: 12),
        TextField(controller: why, decoration: const InputDecoration(labelText: 'Reason')),
      ]),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
        FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Save')),
      ],
    ),
  );
  if (ok != true || !context.mounted) return;
  await runAction(context, 'sessions/adjust', {'voucher_id': voucherId, 'minutes': toInt(mins.text), 'reason': why.text.trim()});
  await then?.call();
}

class CustomersView extends StatefulWidget {
  const CustomersView({super.key});
  @override
  State<CustomersView> createState() => _CustomersViewState();
}

class _CustomersViewState extends State<CustomersView> with AutomaticKeepAliveClientMixin {
  String _q = '';
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
        child: TextField(
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(hintText: 'Search phone', prefixIcon: Icon(Icons.search), isDense: true),
          onSubmitted: (v) => setState(() => _q = v.trim()),
        ),
      ),
      Expanded(
        child: PagedList(
          route: 'customers',
          query: {'q': _q},
          empty: 'Customers who paid by mobile money appear here.',
          header: (ctx, x, reload) => x.isEmpty
              ? const <Widget>[]
              : [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(children: [
                      Expanded(child: StatTile(icon: Icons.people, label: 'Customers', value: '${toInt(x['customers'])}', color: C.cyan)),
                      const SizedBox(width: 10),
                      Expanded(child: StatTile(icon: Icons.replay, label: 'Came back', value: '${toInt(x['repeat_customers'])}', color: C.green)),
                    ]),
                  ),
                ],
          item: (ctx, c, reload) => GlowCard(
            padding: const EdgeInsets.all(14),
            onTap: () => actionSheet(ctx, toStr(c['phone']), [
              (Icons.call, 'Call', C.green, () => openUrl(ctx, 'tel:${toStr(c['phone'])}')),
              (Icons.sms_outlined, 'SMS', C.cyan, () => openUrl(ctx, 'sms:${toStr(c['phone'])}')),
              (Icons.copy, 'Copy number', C.brand, () => copyText(ctx, toStr(c['phone']))),
            ]),
            child: Row(children: [
              CircleAvatar(backgroundColor: C.brand.withValues(alpha: .2), child: const Icon(Icons.person, color: C.brand)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(toStr(c['phone']), style: const TextStyle(fontWeight: FontWeight.w800)),
                  Text('${toInt(c['n'])} purchase(s) • last ${fmtDate(c['last_at'])}', style: TextStyle(color: C.muted, fontSize: 12.5)),
                  Text(toStr(c['last_package']), style: const TextStyle(fontSize: 12)),
                ]),
              ),
              Text(money(c['total']), style: const TextStyle(fontWeight: FontWeight.w800, color: C.green)),
            ]),
          ),
        ),
      ),
    ]);
  }
}

class BlockedView extends StatelessWidget {
  const BlockedView({super.key});
  @override
  Widget build(BuildContext context) => AsyncPage<List<dynamic>>(
        load: () => Api.I.getList('sessions/blocked'),
        build: (ctx, list, reload) => [
          if (list.isEmpty) const EmptyView('No blocked devices.', icon: Icons.verified_user_outlined),
          for (final b in list.map(toMap))
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GlowCard(
                glow: C.red,
                padding: const EdgeInsets.all(14),
                child: Row(children: [
                  const Icon(Icons.block, color: C.red),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(toStr(b['mac']), style: const TextStyle(fontFamily: kMono, fontWeight: FontWeight.w800)),
                      Text('${toStr(b['reason'])} • ${fmtDate(b['created_at'])}${toBool(b['platform_wide']) ? ' • whole platform' : ''}',
                          style: TextStyle(color: C.muted, fontSize: 12.5)),
                    ]),
                  ),
                  if (!toBool(b['platform_wide']))
                    TextButton(
                      onPressed: () async {
                        await runAction(ctx, 'sessions/unblock', {'id': b['id']});
                        reload();
                      },
                      child: const Text('Unblock'),
                    ),
                ]),
              ),
            ),
        ],
      );
}

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: skyBar('Customers'), body: const CustomersView());
}


/// The website's Time Adjustments page (time added to / removed from vouchers).
class AdjustmentsScreen extends StatelessWidget {
  const AdjustmentsScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: skyBar('Time Adjustments'),
        body: PagedList(
          route: 'adjustments',
          empty: 'No time changes yet.',
          item: (ctx, a, reload) {
            final m = toInt(a['minutes']);
            return GlowCard(
              padding: const EdgeInsets.all(14),
              child: Row(children: [
                Icon(m >= 0 ? Icons.add_circle_outline : Icons.remove_circle_outline, color: m >= 0 ? C.green : C.red),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(toStr(a['code']), style: mono(size: 14.5, weight: FontWeight.w800)),
                    Text('${toStr(a['reason'], '—')} • ${fmtDate(a['created_at'])}', style: TextStyle(color: C.muted, fontSize: 12.5)),
                  ]),
                ),
                Text('${m >= 0 ? '+' : ''}$m min', style: TextStyle(fontWeight: FontWeight.w800, color: m >= 0 ? C.green : C.red)),
              ]),
            );
          },
        ),
      );
}
