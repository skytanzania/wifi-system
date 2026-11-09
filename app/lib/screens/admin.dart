// Administrator: platform numbers, sellers (lock / unlock / suspend), all routers, withdrawals, commission, visitors, broadcast
import 'package:flutter/material.dart';

import '../api.dart';
import '../ui.dart';
import 'messages.dart';
import 'routers.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> with SingleTickerProviderStateMixin {
  late final TabController _tc = TabController(length: 5, vsync: this);
  @override
  void dispose() {
    _tc.dispose();
    super.dispose();
  }

  Future<void> _broadcast() async {
    final t = TextEditingController();
    final m = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Message to all sellers'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [Field(t, 'Title'), Field(m, 'Message', maxLines: 4)]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Send')),
        ],
      ),
    );
    if (ok == true && mounted) await runAction(context, 'admin/broadcast', {'title': t.text.trim(), 'message': m.text.trim()});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Administrator'),
          actions: [IconButton(tooltip: 'Message all sellers', icon: const Icon(Icons.campaign_outlined), onPressed: _broadcast)],
          bottom: TabBar(controller: _tc, isScrollable: true, tabAlignment: TabAlignment.start, tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Sellers'),
            Tab(text: 'Routers'),
            Tab(text: 'Withdrawals'),
            Tab(text: 'Commission'),
          ]),
        ),
        body: TabBarView(controller: _tc, children: const [_Overview(), _Users(), _AllRouters(), _Withdrawals(), _Commissions()]),
      );
}

class _Overview extends StatelessWidget {
  const _Overview();
  @override
  Widget build(BuildContext context) => AsyncPage<Map<String, dynamic>>(
        load: () => Api.I.getMap('admin/stats'),
        build: (ctx, d, reload) {
          final p = toMap(d['platform']);
          final v = toMap(d['portal_visitors']);
          final cm = toMap(d['commission']);
          return [
            GlowCard(
              gradient: const LinearGradient(colors: [Color(0xFF3B2A0C), Color(0xFF0C1320)], begin: Alignment.topLeft, end: Alignment.bottomRight),
              glow: C.amber,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Platform earnings', style: TextStyle(color: Color(0xFFFDE68A))),
                Text(money(p['total']), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
                Text('This month ${money(p['month'])} • today ${money(p['today'])}', style: const TextStyle(color: C.muted)),
                const SizedBox(height: 8),
                Text('Mobile money ${money(p['mm'])} • vouchers ${money(p['vc'])} • withdrawals ${money(p['wd'])} • SMS ${money(p['sms'])}', style: const TextStyle(fontSize: 12.5)),
              ]),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.6,
              children: [
                StatTile(icon: Icons.people, label: 'Sellers', value: '${toInt(d['sellers_active'])} / ${toInt(d['sellers'])}', color: C.cyan, sub: '${toInt(d['sellers_locked'])} locked'),
                StatTile(icon: Icons.router, label: 'Routers online', value: '${toInt(d['routers_online'])} / ${toInt(d['routers'])}', color: C.green),
                StatTile(icon: Icons.wifi_tethering, label: 'Online users', value: '${toInt(d['active_sessions'])}', color: C.brand),
                StatTile(icon: Icons.receipt_long, label: 'Paid today', value: '${toInt(d['orders_today'])}', color: C.green, sub: '${toInt(d['orders_pending'])} pending'),
                StatTile(icon: Icons.payments_outlined, label: 'Withdrawals to watch', value: '${toInt(d['withdrawals_pending'])}', color: C.amber),
                StatTile(icon: Icons.dns_outlined, label: 'RADIUS server', value: d['radius_server_online'] == true ? 'Online' : 'Offline', color: d['radius_server_online'] == true ? C.green : C.red),
              ],
            ),
            if (v.isNotEmpty) ...[
              const SectionTitle('Captive portal visitors'),
              GlowCard(
                child: Wrap(spacing: 22, runSpacing: 10, children: [
                  _k('Unique', '${toInt(v['unique'])}'),
                  _k('Today', '${toInt(v['today'])}'),
                  _k('New today', '${toInt(v['new_today'])}'),
                  _k('7 days', '${toInt(v['d7'])}'),
                  _k('Online now', '${toInt(v['now'])}'),
                  _k('Paid', '${toInt(v['paid'])}'),
                  _k('Conversion', '${toDouble(v['conv']).toStringAsFixed(1)}%'),
                ]),
              ),
            ],
            if (cm.isNotEmpty) ...[
              const SectionTitle('Voucher commission'),
              GlowCard(
                child: Wrap(spacing: 22, runSpacing: 10, children: [
                  _k('Unpaid', money(cm['unpaid'])),
                  _k('Overdue', money(cm['overdue'])),
                  _k('Paid this month', money(cm['paid_month'])),
                  _k('Locked sellers', '${toInt(cm['locked'])}'),
                ]),
              ),
            ],
          ];
        },
      );

  static Widget _k(String k, String v) => Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
        Text(k, style: const TextStyle(color: C.muted, fontSize: 12)),
        Text(v, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
      ]);
}

class _Users extends StatefulWidget {
  const _Users();
  @override
  State<_Users> createState() => _UsersState();
}

class _UsersState extends State<_Users> with AutomaticKeepAliveClientMixin {
  String _q = '';
  final _k = GlobalKey<PagedListState>();
  @override
  bool get wantKeepAlive => true;

  Future<void> _menu(Map<String, dynamic> u) async {
    final id = u['id'];
    final locked = toBool(u['admin_locked']);
    final active = toStr(u['status']) == 'active';
    if (toStr(u['user_type']) == 'admin') return;
    await actionSheet(context, '${toStr(u['full_name'])} (@${toStr(u['username'])})', [
      (Icons.chat_bubble_outline, 'Message', C.cyan, () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatThread(seller: toInt(id), title: toStr(u['full_name']))))),
      if (!locked)
        (Icons.lock_outline, 'Lock account', C.red, () async {
          final why = await askText(context, 'Lock ${toStr(u['username'])}', label: 'Reason (shown to the seller)');
          if (why == null || !mounted) return;
          final stop = await confirm(context, 'Stop the hotspot too?', 'Stop the seller\'s hotspot (customers disconnected) while locked?', ok: 'Stop hotspot');
          if (!mounted) return;
          final auto = await confirm(context, 'Unlock automatically?', 'Reactivate automatically when the outstanding voucher commission is paid?', ok: 'Yes');
          if (!mounted) return;
          await runAction(context, 'admin/users/lock', {'id': id, 'reason': why, if (stop) 'stop_hotspot': 1, if (auto) 'autopay': 1});
          _k.currentState?.reload();
        })
      else
        (Icons.lock_open, 'Unlock account', C.green, () async {
          await runAction(context, 'admin/users/unlock', {'id': id});
          _k.currentState?.reload();
        }),
      (active ? Icons.pause_circle_outline : Icons.play_circle_outline, active ? 'Suspend (cannot sign in)' : 'Activate', active ? C.amber : C.green, () async {
        await runAction(context, 'admin/users/status', {'id': id, 'status': active ? 'suspended' : 'active'});
        _k.currentState?.reload();
      }),
      (Icons.sms_outlined, 'Give free SMS', C.brand, () async {
        final n = await askText(context, 'Free SMS for ${toStr(u['username'])}', label: 'Number of SMS (e.g. 100 or -50)', keyboard: const TextInputType.numberWithOptions(signed: true));
        if (n == null || !mounted) return;
        await runAction(context, 'admin/sms_credit', {'seller': id, 'n': toInt(n), 'note': 'app'});
      }),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
        child: TextField(
          decoration: const InputDecoration(hintText: 'Search name, phone, e-mail', prefixIcon: Icon(Icons.search), isDense: true),
          onSubmitted: (v) => setState(() => _q = v.trim()),
        ),
      ),
      Expanded(
        child: PagedList(
          key: _k,
          route: 'admin/users',
          query: {'q': _q},
          item: (ctx, u, reload) {
            final locked = toBool(u['admin_locked']) || toBool(u['billing_locked']);
            return GlowCard(
              padding: const EdgeInsets.all(14),
              glow: locked ? C.red : (toStr(u['status']) == 'active' ? C.brand : C.amber),
              onTap: () => _menu(u),
              child: Row(children: [
                CircleAvatar(
                  backgroundColor: C.brand.withValues(alpha: .2),
                  child: Icon(toStr(u['user_type']) == 'admin' ? Icons.admin_panel_settings : Icons.person, color: C.brand),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('${toStr(u['full_name'])} • @${toStr(u['username'])}', style: const TextStyle(fontWeight: FontWeight.w800)),
                    Text('${toStr(u['phone'])} • ${toInt(u['devs'])} router(s) • ${toInt(u['active_sessions'])} online', style: const TextStyle(color: C.muted, fontSize: 12)),
                    Text('Balance ${money(u['balance'])} • SMS ${toInt(u['sms_balance'])} • seen ${ago(u['last_seen_at'])}', style: const TextStyle(fontSize: 12)),
                  ]),
                ),
                Column(children: [
                  if (locked) const StatusChip('blocked', label: 'Locked'),
                  if (toStr(u['status']) != 'active') StatusChip('warning', label: cap(toStr(u['status']))),
                ]),
              ]),
            );
          },
        ),
      ),
    ]);
  }
}

class _AllRouters extends StatefulWidget {
  const _AllRouters();
  @override
  State<_AllRouters> createState() => _AllRoutersState();
}

class _AllRoutersState extends State<_AllRouters> with AutomaticKeepAliveClientMixin {
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
          decoration: const InputDecoration(hintText: 'Search router, MAC, seller', prefixIcon: Icon(Icons.search), isDense: true),
          onSubmitted: (v) => setState(() => _q = v.trim()),
        ),
      ),
      Expanded(
        child: PagedList(
          route: 'admin/routers',
          query: {'q': _q},
          item: (ctx, r, reload) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(padding: const EdgeInsets.only(left: 6, bottom: 4), child: Text('Seller: ${toStr(r['seller'])}', style: const TextStyle(color: C.muted, fontSize: 12))),
            RouterTile(r, onChanged: reload),
          ]),
        ),
      ),
    ]);
  }
}

class _Withdrawals extends StatelessWidget {
  const _Withdrawals();
  @override
  Widget build(BuildContext context) => PagedList(
        route: 'admin/withdrawals',
        empty: 'No withdrawals.',
        item: (ctx, w, reload) => GlowCard(
          padding: const EdgeInsets.all(14),
          glow: statusColor(toStr(w['status'])),
          child: Row(children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('@${toStr(w['username'])} • ${money(w['amount'])}', style: const TextStyle(fontWeight: FontWeight.w800)),
                Text('${toStr(w['method']).toUpperCase()} ${toStr(w['account_number'])} • net ${money(w['net_amount'])}', style: const TextStyle(color: C.muted, fontSize: 12)),
                Text(fmtDate(w['created_at']), style: const TextStyle(fontSize: 12)),
              ]),
            ),
            StatusChip(toStr(w['status'])),
          ]),
        ),
      );
}

class _Commissions extends StatefulWidget {
  const _Commissions();
  @override
  State<_Commissions> createState() => _CommissionsState();
}

class _CommissionsState extends State<_Commissions> with AutomaticKeepAliveClientMixin {
  String _st = '';
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(children: [
      SizedBox(
        height: 50,
        child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), children: [
          for (final s in ['', 'unpaid', 'overdue', 'paid', 'waived'])
            Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: ChoiceChip(label: Text(s.isEmpty ? 'All' : cap(s)), selected: _st == s, onSelected: (_) => setState(() => _st = s))),
        ]),
      ),
      Expanded(
        child: PagedList(
          route: 'admin/commissions',
          query: {'status': _st},
          empty: 'No invoices.',
          item: (ctx, i, reload) => GlowCard(
            padding: const EdgeInsets.all(14),
            glow: statusColor(toStr(i['status'])),
            child: Row(children: [
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('@${toStr(i['username'])} • ${toStr(i['period_label'])}', style: const TextStyle(fontWeight: FontWeight.w800)),
                  Text('Sales ${money(i['sales_amount'])} • ${toDouble(i['percent']).toStringAsFixed(0)}% • due ${fmtDate(i['due_at'], time: false)}', style: const TextStyle(color: C.muted, fontSize: 12)),
                ]),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(money(i['amount']), style: const TextStyle(fontWeight: FontWeight.w800)),
                StatusChip(toStr(i['status'])),
              ]),
            ]),
          ),
        ),
      ),
    ]);
  }
}
