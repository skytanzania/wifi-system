// SMS to WiFi clients: balance, buy bundles, send, auto-SMS, history
import 'dart:async';

import 'package:flutter/material.dart';

import '../api.dart';
import '../main.dart';
import '../ui.dart';
import 'home.dart';

class SmsScreen extends StatefulWidget {
  const SmsScreen({super.key});
  @override
  State<SmsScreen> createState() => _SmsScreenState();
}

class _SmsScreenState extends State<SmsScreen> {
  final _k = GlobalKey<AsyncPageState<PageResult>>();
  final _text = TextEditingController();
  final _numbers = TextEditingController();
  String _scope = 'all';
  Timer? _poll;

  @override
  void initState() {
    super.initState();
    _text.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _poll?.cancel();
    super.dispose();
  }

  Future<void> _buy(Map<String, dynamic> b, bool fromBalance) async {
    Map<String, dynamic> body = {'bundle': b['key']};
    if (fromBalance) {
      if (!await confirm(context, 'Buy ${toInt(b['sms'])} SMS', 'Pay ${money(b['price'])} from your balance?', ok: 'Buy')) return;
      body['pay'] = 'balance';
    } else {
      final phone = await askText(context, 'Buy ${toInt(b['sms'])} SMS — ${money(b['price'])}',
          label: 'Phone that pays', initial: toStr(Session.me['phone']), keyboard: TextInputType.phone, ok: 'Send payment request');
      if (phone == null || phone.isEmpty) return;
      body['phone'] = phone;
    }
    if (!mounted) return;
    final r = await runAction(context, 'sms/buy', body);
    _k.currentState?.reload();
    if (r != null && r.ok && !fromBalance) _watch();
  }

  void _watch() {
    var n = 0;
    _poll?.cancel();
    _poll = Timer.periodic(const Duration(seconds: 6), (t) async {
      n++;
      try {
        final d = await Api.I.getMap('sms', {'per_page': 1});
        final p = toMap(d['pending_purchase']);
        if (p.isEmpty || n > 30) {
          t.cancel();
          _k.currentState?.reload();
          return;
        }
        final j = await Api.I.raw('sms/status', {'ref': p['ref']});
        if (toStr(j['status']) == 'paid') {
          t.cancel();
          if (mounted) showMessage(context, 'SMS bought. New balance: ${toInt(j['balance'])} SMS.', title: 'Payment received');
          _k.currentState?.reload();
        }
      } catch (_) {}
    });
  }

  Future<void> _send() async {
    if (_text.text.trim().isEmpty) {
      showMessage(context, 'Write the message first.', type: 'warning');
      return;
    }
    if (!await confirm(context, 'Send SMS', 'Send this message now?', ok: 'Send')) return;
    if (!mounted) return;
    final r = await runAction(context, 'sms/send', {'scope': _scope, 'numbers': _numbers.text, 'text': _text.text.trim()});
    if (r != null && r.ok) _text.clear();
    _k.currentState?.reload();
  }

  Future<void> _auto(Map<String, dynamic> x) async {
    var on = x['auto_voucher_sms'] == true;
    final tpl = TextEditingController(text: toStr(x['auto_template']));
    final opt = TextEditingController(text: toStr(x['opt_out']));
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setS) => AlertDialog(
          title: const Text('Automatic SMS'),
          content: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SwitchListTile(value: on, onChanged: (v) => setS(() => on = v), title: const Text('Send the voucher by SMS after payment'), contentPadding: EdgeInsets.zero),
              Field(tpl, 'Message template', maxLines: 4),
              Field(opt, 'Never SMS these numbers (comma separated)', maxLines: 2),
            ]),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
            FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Save')),
          ],
        ),
      ),
    );
    if (ok != true || !mounted) return;
    await runAction(context, 'sms/auto', {if (on) 'auto': 1, 'tpl': tpl.text, 'optout': opt.text});
    _k.currentState?.reload();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: skyBar('SMS'),
        body: AsyncPage<PageResult>(
          skeleton: const SkeletonDetail(),
          key: _k,
          load: () => Api.I.page('sms', 1),
          build: (ctx, r, reload) {
            final x = r.extra;
            if (x['ready'] == false) return [EmptyView(toStr(x['message'], 'SMS is not available yet.'), icon: Icons.sms_failed_outlined)];
            final bundles = toList(x['bundles']).map(toMap).toList();
            final cl = toMap(x['clients']);
            final pend = toMap(x['pending_purchase']);
            final parts = (_text.text.length / 160).ceil();
            return [
              GlowCard(
                glow: C.green,
                child: Row(children: [
                  const Icon(Icons.sms, color: C.green, size: 34),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(x['free'] == true ? 'Free SMS (administrator)' : 'SMS balance', style: TextStyle(color: C.muted)),
                      Text(x['free'] == true ? 'Unlimited' : '${thousands(toInt(x['balance']))} SMS', style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900)),
                      if (x['enabled'] == false) const Text('Sending is switched off by the administrator.', style: TextStyle(color: C.amber, fontSize: 12.5)),
                    ]),
                  ),
                  IconButton(tooltip: 'Automatic SMS', icon: const Icon(Icons.settings_outlined), onPressed: () => _auto(x)),
                ]),
              ),
              if (pend.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('Waiting for payment of ${money(pend['amount'])} (${toInt(pend['sms'])} SMS) from ${toStr(pend['phone'])}…', style: const TextStyle(color: C.cyan)),
                ),
              if (x['free'] != true) ...[
                const SectionTitle('Buy SMS'),
                SizedBox(
                  height: 132,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    for (final b in bundles)
                      Container(
                        width: 140,
                        margin: const EdgeInsets.only(right: 10),
                        child: GlowCard(
                          glow: C.brand2,
                          padding: const EdgeInsets.all(12),
                          onTap: () => actionSheet(ctx, '${toInt(b['sms'])} SMS — ${money(b['price'])}', [
                            (Icons.phone_android, 'Pay with mobile money', C.green, () => _buy(b, false)),
                            (Icons.account_balance_wallet_outlined, 'Pay from my balance', C.brand, () => _buy(b, true)),
                          ]),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text('${thousands(toInt(b['sms']))} SMS', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17)),
                            const SizedBox(height: 4),
                            Text(money(b['price']), style: const TextStyle(color: C.amber, fontWeight: FontWeight.w800)),
                            const Spacer(),
                            Text('${toDouble(b['unit']).toStringAsFixed(0)} per SMS', style: TextStyle(color: C.muted, fontSize: 11.5)),
                          ]),
                        ),
                      ),
                  ]),
                ),
              ],
              const SectionTitle('Send SMS to your clients'),
              DropdownButtonFormField<String>(
                initialValue: _scope,
                decoration: const InputDecoration(labelText: 'To'),
                items: [
                  DropdownMenuItem(value: 'all', child: Text('All my clients (${toInt(cl['all'])})')),
                  DropdownMenuItem(value: '30', child: Text('Last 30 days (${toInt(cl['last_30_days'])})')),
                  DropdownMenuItem(value: '7', child: Text('Last 7 days (${toInt(cl['last_7_days'])})')),
                  const DropdownMenuItem(value: 'list', child: Text('Numbers I type')),
                ],
                onChanged: (v) => setState(() => _scope = v ?? 'all'),
              ),
              const SizedBox(height: 12),
              if (_scope == 'list') Field(_numbers, 'Phone numbers (07XXXXXXXX, comma separated)', maxLines: 3, keyboard: TextInputType.phone),
              Field(_text, 'Message', maxLines: 4, helper: '${_text.text.length} characters • $parts SMS per number'),
              FilledButton.icon(onPressed: _send, icon: const Icon(Icons.send), label: const Text('Send')),
              const SectionTitle('Sent messages'),
              if (r.items.isEmpty) const EmptyView('No SMS sent yet.'),
              for (final m in r.items.map(toMap))
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.sms_outlined, color: statusColor(toStr(m['status']))),
                  title: Text(toStr(m['to_phone'])),
                  subtitle: Text('${toStr(m['text'])}\n${fmtDate(m['created_at'])}', maxLines: 3, overflow: TextOverflow.ellipsis),
                  trailing: StatusChip(toStr(m['status'])),
                ),
            ];
          },
        ),
      );
}
