// Money: payments, ledger, withdraw, voucher commission, locked account
import 'dart:async';

import 'package:flutter/material.dart';

import '../api.dart';
import '../main.dart';
import '../ui.dart';
import 'auth.dart';
import 'home.dart';
import 'messages.dart';

class MoneyTab extends StatefulWidget {
  const MoneyTab({super.key});
  @override
  State<MoneyTab> createState() => _MoneyTabState();
}

class _MoneyTabState extends State<MoneyTab> with SingleTickerProviderStateMixin {
  late final TabController _tc = TabController(length: 4, vsync: this);
  @override
  void dispose() {
    _tc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(children: [
        TabBar(controller: _tc, isScrollable: true, tabAlignment: TabAlignment.start, tabs: const [
          Tab(text: 'Payments'),
          Tab(text: 'Withdraw'),
          Tab(text: 'Commission'),
          Tab(text: 'Ledger'),
        ]),
        Expanded(child: TabBarView(controller: _tc, children: const [OrdersView(), WithdrawView(), CommissionView(), LedgerView()])),
      ]);
}

// ---------------------------------------------------------------------
// Payments (portal mobile-money orders)
// ---------------------------------------------------------------------
class OrdersView extends StatefulWidget {
  const OrdersView({super.key});
  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> with AutomaticKeepAliveClientMixin {
  String _status = 'all';
  String _q = '';
  final _k = GlobalKey<PagedListState>();
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
        child: Row(children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(hintText: 'Search ref, phone, code', prefixIcon: Icon(Icons.search), isDense: true),
              onSubmitted: (v) => setState(() => _q = v.trim()),
            ),
          ),
          const SizedBox(width: 8),
          IconButton.filledTonal(
            tooltip: 'Check unconfirmed payments now',
            icon: const Icon(Icons.sync),
            onPressed: () async {
              await runAction(context, 'orders/recheck_all', {});
              _k.currentState?.reload();
            },
          ),
        ]),
      ),
      SizedBox(
        height: 48,
        child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), children: [
          for (final s in ['all', 'attention', 'paid', 'pending', 'failed', 'expired', 'cancelled'])
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ChoiceChip(label: Text(s == 'attention' ? 'Needs attention' : cap(s)), selected: _status == s, onSelected: (_) => setState(() => _status = s)),
            ),
        ]),
      ),
      Expanded(
        child: PagedList(
          key: _k,
          route: 'orders',
          query: {'status': _status, 'q': _q},
          empty: 'No payments.',
          item: (ctx, o, reload) => OrderTile(o, onChanged: reload),
        ),
      ),
    ]);
  }
}

class OrderTile extends StatelessWidget {
  final Map<String, dynamic> o;
  final Future<void> Function()? onChanged;
  const OrderTile(this.o, {super.key, this.onChanged});
  @override
  Widget build(BuildContext context) {
    final st = toStr(o['status']);
    return GlowCard(
      glow: statusColor(st),
      padding: const EdgeInsets.all(14),
      onTap: () async {
        await Navigator.push(context, MaterialPageRoute(builder: (_) => OrderDetailScreen(toInt(o['id']))));
        await onChanged?.call();
      },
      child: Row(children: [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('${toStr(o['package_name'], toStr(o['pkg_name'], 'Package'))} • ${toStr(o['phone'])}', style: const TextStyle(fontWeight: FontWeight.w800)),
            Text('${toStr(o['order_ref'])} • ${fmtDate(o['created_at'])}', style: TextStyle(color: C.muted, fontSize: 12)),
            if (toStr(o['code']).isNotEmpty) Text('Voucher ${toStr(o['code'])}', style: const TextStyle(fontFamily: kMono, fontSize: 12.5, color: C.cyan)),
          ]),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text(money(o['amount']), style: const TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          StatusChip(st),
        ]),
      ]),
    );
  }
}

class OrderDetailScreen extends StatefulWidget {
  final int id;
  const OrderDetailScreen(this.id, {super.key});
  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  final _k = GlobalKey<AsyncPageState<Map<String, dynamic>>>();

  Future<void> _op(String op, {Map<String, dynamic> extra = const {}}) async {
    await runAction(context, 'orders/manage', {'id': widget.id, 'op': op, ...extra});
    _k.currentState?.reload();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: skyBar('Payment'),
        body: AsyncPage<Map<String, dynamic>>(
          skeleton: const SkeletonDetail(),
          key: _k,
          load: () => Api.I.getMap('orders/get', {'id': widget.id}),
          build: (ctx, o, reload) {
            final st = toStr(o['status']);
            final ops = toList(o['allowed_ops']).map((e) => '$e').toSet();
            return [
              GlowCard(
                glow: statusColor(st),
                child: Column(children: [
                  Text(money(o['amount']), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 6),
                  StatusChip(st),
                  const SizedBox(height: 12),
                  KV('Package', toStr(o['package_name'], toStr(o['pkg_name']))),
                  KV('Phone', toStr(o['phone']), copy: true),
                  KV('Reference', toStr(o['order_ref']), copy: true),
                  KV('Mobile money ref', toStr(o['gateway_ref']), copy: true),
                  KV('Voucher', toStr(o['code']), copy: true, mono: true),
                  KV('Router', toStr(o['device_name'])),
                  KV('WiFi name', toStr(o['ssid'])),
                  KV('Phone MAC', toStr(o['client_mac']), mono: true),
                  KV('Created', fmtDate(o['created_at'])),
                  KV('Paid', fmtDate(o['paid_at'])),
                  KV('Sonic Pesa', toStr(o['sp_status'])),
                  KV('Note', toStr(o['admin_note'])),
                ]),
              ),
              const SectionTitle('Actions'),
              Wrap(spacing: 10, runSpacing: 10, children: [
                if (ops.contains('recheck') && st != 'paid') OutlinedButton.icon(onPressed: () => _op('recheck'), icon: const Icon(Icons.sync), label: const Text('Ask Sonic Pesa')),
                if (ops.contains('reconnect') && st == 'paid') OutlinedButton.icon(onPressed: () => _op('reconnect'), icon: const Icon(Icons.wifi), label: const Text('Reconnect customer')),
                if (ops.contains('confirm') && st != 'paid')
                  FilledButton.icon(
                    onPressed: () async {
                      final ref = await askText(ctx, 'Confirm payment', label: 'Mobile money reference (optional)');
                      if (ref != null) _op('confirm', extra: {'gateway_ref': ref});
                    },
                    icon: const Icon(Icons.verified),
                    label: const Text('Confirm paid'),
                  ),
                if (ops.contains('fail') && (st == 'pending' || st == 'expired')) OutlinedButton.icon(onPressed: () => _op('fail'), icon: const Icon(Icons.close), label: const Text('Mark failed')),
                if (ops.contains('cancel') && st != 'paid' && st != 'cancelled')
                  OutlinedButton.icon(onPressed: () => _op('cancel'), icon: const Icon(Icons.cancel_outlined, color: C.red), label: const Text('Cancel')),
                if (ops.contains('note'))
                  OutlinedButton.icon(
                    onPressed: () async {
                      final n = await askText(ctx, 'Note', initial: toStr(o['admin_note']), maxLines: 3, ok: 'Save');
                      if (n != null) _op('note', extra: {'note': n});
                    },
                    icon: const Icon(Icons.edit_note),
                    label: const Text('Note'),
                  ),
                if (ops.contains('reverse') && st == 'paid')
                  OutlinedButton.icon(
                    onPressed: () async {
                      if (await confirm(ctx, 'Reverse payment', 'Reverse this paid payment? The voucher is cancelled and the balance corrected.', ok: 'Reverse', danger: true)) _op('reverse');
                    },
                    icon: const Icon(Icons.undo, color: C.red),
                    label: const Text('Reverse'),
                  ),
              ]),
              if (!Session.isAdmin && st != 'paid')
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Text('Only the administrator can mark a payment as paid. Ask Sonic Pesa first; if the customer really paid, send the reference to the administrator.',
                      style: TextStyle(color: C.muted, fontSize: 12.5)),
                ),
              if (toList(o['events']).isNotEmpty) ...[
                const SectionTitle('Payment events'),
                for (final e in toList(o['events']).map(toMap))
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.bolt, color: statusColor(toStr(e['state']))),
                    title: Text('${cap(toStr(e['source']))} • ${toStr(e['state'])}'),
                    subtitle: Text('${toStr(e['message'])}\n${fmtDate(e['created_at'])}'),
                  ),
              ],
            ];
          },
        ),
      );
}

// ---------------------------------------------------------------------
// Ledger
// ---------------------------------------------------------------------
class LedgerView extends StatefulWidget {
  const LedgerView({super.key});
  @override
  State<LedgerView> createState() => _LedgerViewState();
}

class _LedgerViewState extends State<LedgerView> with AutomaticKeepAliveClientMixin {
  String _type = '';
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(children: [
      SizedBox(
        height: 50,
        child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), children: [
          for (final t in ['', 'purchase', 'commission', 'withdrawal', 'adjustment'])
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ChoiceChip(label: Text(t.isEmpty ? 'All' : cap(t)), selected: _type == t, onSelected: (_) => setState(() => _type = t)),
            ),
        ]),
      ),
      Expanded(
        child: PagedList(
          route: 'transactions',
          query: {'type': _type},
          empty: 'No transactions yet.',
          header: (ctx, x, reload) {
            final e = toMap(x['earnings']);
            if (e.isEmpty) return const <Widget>[];
            return [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(children: [
                  Expanded(child: StatTile(icon: Icons.trending_up, label: 'Earned (net)', value: money(e['total']), color: C.green)),
                  const SizedBox(width: 10),
                  Expanded(child: StatTile(icon: Icons.percent, label: 'Commission', value: money(e['commission']), color: C.amber)),
                ]),
              ),
            ];
          },
          item: (ctx, t, reload) {
            final type = toStr(t['type']);
            final neg = type == 'withdrawal' || type == 'commission';
            return GlowCard(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              glow: neg ? C.amber : C.green,
              child: Row(children: [
                Icon(neg ? Icons.arrow_upward : Icons.arrow_downward, color: neg ? C.amber : C.green),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('${cap(type)} • ${toStr(t['payment_method'])}', style: const TextStyle(fontWeight: FontWeight.w700)),
                    Text('${toStr(t['transaction_ref'])} • ${fmtDate(t['created_at'])}', style: TextStyle(color: C.muted, fontSize: 12)),
                  ]),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text('${neg ? '−' : '+'}${money(t['amount'])}', style: TextStyle(fontWeight: FontWeight.w800, color: neg ? C.amber : C.green)),
                  StatusChip(toStr(t['status'])),
                ]),
              ]),
            );
          },
        ),
      ),
    ]);
  }
}

// ---------------------------------------------------------------------
// Withdraw
// ---------------------------------------------------------------------
class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: skyBar('Withdraw'), body: const WithdrawView());
}

class WithdrawView extends StatefulWidget {
  const WithdrawView({super.key});
  @override
  State<WithdrawView> createState() => _WithdrawViewState();
}

class _WithdrawViewState extends State<WithdrawView> with AutomaticKeepAliveClientMixin {
  final _k = GlobalKey<AsyncPageState<PageResult>>();
  final _amount = TextEditingController();
  final _acc = TextEditingController();
  final _name = TextEditingController();
  String _method = 'mpesa';
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _acc.text = toStr(Session.me['phone']);
    _name.text = Session.name;
    _amount.addListener(() => setState(() {}));
  }

  Future<void> _go(double minimum, double balance) async {
    final a = toDouble(_amount.text);
    if (a < minimum) {
      showMessage(context, 'The minimum withdrawal is ${money(minimum)}.', type: 'warning');
      return;
    }
    if (a > balance) {
      showMessage(context, 'Your balance is ${money(balance)}.', type: 'warning');
      return;
    }
    if (!await confirm(context, 'Withdraw ${money(a)}', 'Send to ${_acc.text.trim()} (${_method.toUpperCase()})?', ok: 'Withdraw')) return;
    if (!mounted) return;
    showDialog<void>(context: context, barrierDismissible: false, builder: (_) => const Center(child: CircularProgressIndicator()));
    try {
      final d = await Api.I.postData('withdraw', {'amount': a, 'method': _method, 'account_number': _acc.text.trim(), 'account_name': _name.text.trim()});
      if (mounted) Navigator.of(context, rootNavigator: true).pop();
      _amount.clear();
      if (mounted) await showMessage(context, '${toStr(d['message'])}\n\nYou receive ${money(d['net_amount'])} (fee ${money(d['fee'])}).', title: 'Withdrawal sent');
    } catch (e) {
      if (mounted) Navigator.of(context, rootNavigator: true).pop();
      if (mounted) showError(context, e);
    }
    _k.currentState?.reload();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AsyncPage<PageResult>(
      skeleton: const SkeletonDetail(),
      key: _k,
      load: () => Api.I.page('withdrawals', 1),
      build: (ctx, r, reload) {
        final x = r.extra;
        final rules = toMap(x['rules']);
        final methods = toMap(x['methods']);
        final bal = toDouble(x['balance']);
        final minW = toDouble(rules['minimum']);
        final pf = toDouble(rules['platform_fee_percent']);
        final sf = toDouble(rules['sonic_fee_percent']);
        final a = toDouble(_amount.text);
        final toSonic = a - a * pf / 100;
        final net = toSonic - toSonic * sf / 100;
        if (!methods.containsKey(_method) && methods.isNotEmpty) _method = methods.keys.first;
        return [
          GlowCard(
            gradient: const LinearGradient(colors: [Color(0xFF0F3D2E), Color(0xFF0C1320)], begin: Alignment.topLeft, end: Alignment.bottomRight),
            glow: C.green,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Available to withdraw', style: TextStyle(color: Color(0xFFA7F3D0))),
              Text(money(bal), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
              const SizedBox(height: 4),
              Text('Minimum ${money(minW)} • fee ${toDouble(rules['fee_percent_shown']).toStringAsFixed(1)}%', style: TextStyle(color: C.muted, fontSize: 12.5)),
              Text('Only mobile money sales can be withdrawn — voucher cash is already in your shop.', style: TextStyle(color: C.muted, fontSize: 12)),
            ]),
          ),
          const SectionTitle('Request withdrawal'),
          if (x['payout_ready'] == false) const Text('Withdrawals are not available yet — the administrator must finish the Sonic Pesa setup.', style: TextStyle(color: C.amber)),
          Field(_amount, 'Amount ($currency)', keyboard: TextInputType.number, icon: Icons.payments_outlined),
          DropdownButtonFormField<String>(
            initialValue: methods.containsKey(_method) ? _method : null,
            decoration: const InputDecoration(labelText: 'Send to'),
            items: [for (final m in methods.entries) DropdownMenuItem(value: m.key, child: Text('${m.value}'))],
            onChanged: (v) => setState(() => _method = v ?? _method),
          ),
          const SizedBox(height: 12),
          Field(_acc, 'Phone / account number', keyboard: TextInputType.phone, icon: Icons.phone_android),
          Field(_name, 'Account name', icon: Icons.person_outline),
          if (a > 0) Text('You receive about ${money(net)} after fees.', style: const TextStyle(color: C.green, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          FilledButton.icon(onPressed: () => _go(minW, bal), icon: const Icon(Icons.send), label: const Text('Withdraw')),
          const SectionTitle('History'),
          if (r.items.isEmpty) const EmptyView('No withdrawals yet.'),
          for (final w in r.items.map(toMap))
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: GlowCard(
                padding: const EdgeInsets.all(12),
                glow: statusColor(toStr(w['status'])),
                child: Row(children: [
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('${money(w['amount'])} → ${toStr(w['account_number'])}', style: const TextStyle(fontWeight: FontWeight.w700)),
                      Text('${toStr(w['method']).toUpperCase()} • net ${money(w['net_amount'])} • ${fmtDate(w['created_at'])}', style: TextStyle(color: C.muted, fontSize: 12)),
                      if (toStr(w['admin_notes']).isNotEmpty) Text(toStr(w['admin_notes']), style: const TextStyle(color: C.amber, fontSize: 12)),
                    ]),
                  ),
                  StatusChip(toStr(w['status'])),
                ]),
              ),
            ),
        ];
      },
    );
  }
}

// ---------------------------------------------------------------------
// Voucher commission (also the screen of a locked account)
// ---------------------------------------------------------------------
class CommissionScreen extends StatelessWidget {
  const CommissionScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: skyBar('Voucher commission'), body: const CommissionView());
}

class CommissionView extends StatefulWidget {
  final bool locked;
  const CommissionView({super.key, this.locked = false});
  @override
  State<CommissionView> createState() => _CommissionViewState();
}

class _CommissionViewState extends State<CommissionView> with AutomaticKeepAliveClientMixin {
  final _k = GlobalKey<AsyncPageState<Map<String, dynamic>>>();
  Timer? _poll;
  String _pollRef = '';
  int _tries = 0;
  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _poll?.cancel();
    super.dispose();
  }

  Future<void> _pay({int? invoice}) async {
    final phone = await askText(context, invoice == null ? 'Pay all commission now' : 'Pay invoice',
        label: 'Phone that pays (M-Pesa, Mixx by Yas, Airtel Money, HaloPesa)', initial: toStr(Session.me['phone']), keyboard: TextInputType.phone, ok: 'Send payment request');
    if (phone == null || phone.isEmpty || !mounted) return;
    final r = await runAction(context, invoice == null ? 'commission/pay_now' : 'commission/pay', {'phone': phone, if (invoice != null) 'id': invoice},
        popup: false);
    if (r == null || !mounted) return;
    if (!r.ok) {
      showMessage(context, r.message, type: r.type);
      return;
    }
    showMessage(context, '${r.message}\n\nEnter your PIN on the phone to complete the payment.', type: 'info', title: 'Check your phone');
    _k.currentState?.reload();
  }

  void _watch(String ref) {
    if (ref.isEmpty || ref == _pollRef) return;
    _pollRef = ref;
    _tries = 0;
    _poll?.cancel();
    _poll = Timer.periodic(const Duration(seconds: 5), (t) async {
      _tries++;
      if (_tries > 36) {
        t.cancel();
        return;
      }
      try {
        final j = await Api.I.raw('commission/status', {'ref': ref});
        final st = toStr(j['status']);
        if (st == 'paid') {
          t.cancel();
          if (!mounted) return;
          await showMessage(context, 'Commission paid. Thank you!', title: 'Payment received');
          final me = await Session.refresh();
          if (widget.locked && me['restricted'] != true) {
            enterApp(me);
          } else {
            _k.currentState?.reload();
          }
        } else if (st == 'failed' || st == 'cancelled' || st == 'expired') {
          t.cancel();
          if (mounted) showMessage(context, 'The payment was not completed ($st). Try again.', type: 'warning');
          _k.currentState?.reload();
        }
      } catch (_) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AsyncPage<Map<String, dynamic>>(
      skeleton: const SkeletonDetail(),
      key: _k,
      load: () => Api.I.getMap('commission'),
      build: (ctx, d, reload) {
        if (d['ready'] == false) return [EmptyView(toStr(d['message'], 'Commission is not set up.'))];
        final owed = toDouble(d['owed_total']);
        final run = toMap(d['running']);
        final pend = toMap(d['pending_payment']);
        if (pend.isNotEmpty) WidgetsBinding.instance.addPostFrameCallback((_) => _watch(toStr(pend['ref'])));
        final open = toList(d['open_invoices']).map(toMap).toList();
        final inv = toList(d['invoices']).map(toMap).toList();
        final days = toList(d['days']).map(toMap).toList().reversed.toList();
        return [
          GlowCard(
            glow: owed > 0 ? C.amber : C.green,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(owed > 0 ? 'Commission to pay' : 'Nothing to pay', style: TextStyle(color: C.muted)),
              Text(money(owed), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
              const SizedBox(height: 4),
              Text('${toDouble(d['percent']).toStringAsFixed(toDouble(d['percent']) % 1 == 0 ? 0 : 1)}% of voucher sales • paid so far ${money(d['paid_total'])}',
                  style: TextStyle(color: C.muted, fontSize: 12.5)),
              if (d['locked'] == true || d['admin_locked'] == true)
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text('Your account is locked until the commission is paid.', style: TextStyle(color: C.red, fontWeight: FontWeight.w700)),
                ),
              if (pend.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(children: [
                    const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)),
                    const SizedBox(width: 10),
                    Expanded(child: Text('Waiting for payment of ${money(pend['amount'])} from ${toStr(pend['phone'])}…', style: const TextStyle(color: C.cyan))),
                  ]),
                ),
              if (owed > 0) ...[
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(onPressed: () => _pay(), icon: const Icon(Icons.phone_android), label: Text('Pay ${money(owed)} now')),
                ),
              ],
            ]),
          ),
          if (run.isNotEmpty) ...[
            const SectionTitle('This period (not invoiced yet)'),
            GlowCard(
              child: Column(children: [
                KV('Since', fmtDate(run['from'])),
                KV('Vouchers used', '${toInt(run['n'])}'),
                KV('Voucher sales', money(run['sales'])),
                KV('Commission', money(run['amount'])),
              ]),
            ),
          ],
          if (open.isNotEmpty) ...[
            const SectionTitle('Unpaid invoices'),
            for (final i in open)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: GlowCard(
                  glow: statusColor(toStr(i['status'])),
                  padding: const EdgeInsets.all(14),
                  child: Row(children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(toStr(i['period_label']), style: const TextStyle(fontWeight: FontWeight.w800)),
                        Text('${money(i['amount'])} • due ${fmtDate(i['due_at'], time: false)}', style: TextStyle(color: C.muted, fontSize: 12.5)),
                      ]),
                    ),
                    FilledButton(onPressed: () => _pay(invoice: toInt(i['id'])), child: const Text('Pay')),
                  ]),
                ),
              ),
          ],
          if (days.isNotEmpty) ...[
            const SectionTitle('Last 30 days'),
            GlowCard(child: Bars([for (final x in days) (toStr(x['day']).length >= 10 ? toStr(x['day']).substring(8, 10) : toStr(x['day']), toDouble(x['amount']))], color: C.brand2)),
          ],
          if (inv.isNotEmpty) ...[
            const SectionTitle('All invoices'),
            for (final i in inv)
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(toStr(i['period_label'])),
                subtitle: Text('${toInt(i['vouchers_n'])} voucher(s) • sales ${money(i['sales_amount'])}'),
                trailing: Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(money(i['amount']), style: const TextStyle(fontWeight: FontWeight.w800)),
                  StatusChip(toStr(i['status'])),
                ]),
              ),
          ],
        ];
      },
    );
  }
}

/// Account locked (by the administrator or for unpaid commission): only paying the commission works.
class LockedScreen extends StatefulWidget {
  static bool open = false;
  const LockedScreen({super.key});
  @override
  State<LockedScreen> createState() => _LockedScreenState();
}

class _LockedScreenState extends State<LockedScreen> {
  @override
  void initState() {
    super.initState();
    LockedScreen.open = true;
  }

  @override
  void dispose() {
    LockedScreen.open = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: skyBar('Account locked',
          actions: [
            IconButton(tooltip: 'Messages', icon: const Icon(Icons.chat_bubble_outline), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatScreen()))),
            IconButton(
              tooltip: 'Check again',
              icon: const Icon(Icons.refresh),
              onPressed: () async {
                try {
                  final me = await Session.refresh();
                  if (me['restricted'] != true) enterApp(me);
                } catch (_) {}
              },
            ),
            IconButton(
              tooltip: 'Sign out',
              icon: const Icon(Icons.logout),
              onPressed: () async {
                try {
                  await Api.I.post('auth/logout');
                } catch (_) {}
                await Api.I.saveToken(null);
                goTo(const LoginScreen());
              },
            ),
          ],
        ),
        body: Column(children: [
          FutureBuilder<Map<String, dynamic>>(
            future: Api.I.getMap('locked'),
            builder: (ctx, s) {
              final d = s.data ?? {};
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: C.red.withValues(alpha: .12), borderRadius: BorderRadius.circular(18)),
                child: Row(children: [
                  const Icon(Icons.lock_outline, color: C.red, size: 32),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Text('Every menu is disabled except paying the voucher commission.', style: TextStyle(fontWeight: FontWeight.w700)),
                      if (toStr(d['reason']).isNotEmpty) Text('Reason: ${toStr(d['reason'])}', style: TextStyle(color: C.muted)),
                      if (d['hotspot_stopped'] == true) const Text('Your hotspot is stopped until the account is reactivated.', style: TextStyle(color: C.amber, fontSize: 12.5)),
                      if (d['admin_locked'] == true && d['unlocks_when_paid'] != true)
                        Text('After paying, ask the administrator to reactivate the account (Messages).', style: TextStyle(color: C.muted, fontSize: 12.5)),
                    ]),
                  ),
                ]),
              );
            },
          ),
          const Expanded(child: CommissionView(locked: true)),
        ]),
      );
}

/// The website's Transactions page.
class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: skyBar('Transactions'), body: const LedgerView());
}
