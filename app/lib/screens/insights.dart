// Insights (goal, tips, best packages), top sellers and reports
import 'package:flutter/material.dart';

import '../api.dart';
import '../main.dart';
import '../ui.dart';
import 'home.dart';
import 'report_pdf.dart';

class InsightsScreen extends StatefulWidget {
  const InsightsScreen({super.key});
  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  final _k = GlobalKey<AsyncPageState<Map<String, dynamic>>>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: skyBar('Insights'),
        body: AsyncPage<Map<String, dynamic>>(
          skeleton: const SkeletonDashboard(),
          key: _k,
          load: () => Api.I.getMap('insights'),
          build: (ctx, d, reload) {
            final g = toMap(d['goal']);
            final p = toMap(d['periods']);
            final th = toMap(p['this']);
            final la = toMap(p['last']);
            final pct = toDouble(g['pct']).clamp(0, 100).toDouble();
            final pk = toList(d['top_packages']).map(toMap).toList();
            final rt = toList(d['routers']).map(toMap).toList();
            final cu = toMap(d['customers']);
            final rank = toMap(d['rank']);
            final tips = toList(d['tips']);
            final change = d['periods'] is Map ? p['change'] : null;
            return [
              GlowCard(
                glow: C.amber,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    const Expanded(child: Text('Monthly goal', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16))),
                    if (d['can_set_goal'] == true)
                      TextButton(
                        onPressed: () async {
                          final v = await askText(ctx, 'Monthly sales goal', label: 'Goal ($currency)', initial: '${toDouble(g['goal']).round()}', keyboard: TextInputType.number, ok: 'Save');
                          if (v == null) return;
                          if (!ctx.mounted) return;
                          await runAction(ctx, 'insights/goal', {'goal': toDouble(v)});
                          reload();
                        },
                        child: const Text('Change'),
                      ),
                  ]),
                  Text('${money(g['net'])} of ${money(g['goal'])}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(value: pct / 100, minHeight: 12, backgroundColor: C.card2, color: pct >= 100 ? C.green : C.amber),
                  ),
                  const SizedBox(height: 8),
                  Text('${pct.toStringAsFixed(0)}% • day ${toInt(g['day'])} of ${toInt(g['days'])} • at this pace ${money(g['projected'])}', style: TextStyle(color: C.muted, fontSize: 12.5)),
                  if (toDouble(g['need_per_day']) > 0) Text('Sell about ${money(g['need_per_day'])} per day to reach it.', style: const TextStyle(color: C.amber, fontSize: 12.5)),
                ]),
              ),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(child: StatTile(icon: Icons.calendar_month, label: toStr(p['this_label'], 'This month'), value: money(th['net']), color: C.green,
                    sub: change == null ? null : '${toDouble(change) >= 0 ? '+' : ''}${toDouble(change).toStringAsFixed(1)}% vs last month')),
                const SizedBox(width: 10),
                Expanded(child: StatTile(icon: Icons.history, label: toStr(p['last_label'], 'Last month'), value: money(la['net']), color: C.brand)),
              ]),
              const SizedBox(height: 10),
              Row(children: [
                Expanded(child: StatTile(icon: Icons.people_alt_outlined, label: 'Customers', value: '${toInt(cu['total'])}', color: C.cyan, sub: '${toInt(cu['new'])} new • ${toInt(cu['returning'])} came back')),
                const SizedBox(width: 10),
                Expanded(child: StatTile(icon: Icons.emoji_events_outlined, label: 'Your rank', value: rank.isEmpty ? '—' : '#${toInt(rank['rank'])}', color: C.amber, sub: rank.isEmpty ? null : 'of ${toInt(rank['of'])} sellers')),
              ]),
              if (tips.isNotEmpty) ...[
                const SectionTitle('Tips for you'),
                for (final t in tips)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: GlowCard(
                      glow: C.cyan,
                      padding: const EdgeInsets.all(14),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        const Icon(Icons.lightbulb_outline, color: C.amber),
                        const SizedBox(width: 10),
                        Expanded(child: Text(t is List && t.length > 2 ? toStr(t[2]) : toStr(t))),
                      ]),
                    ),
                  ),
              ],
              if (pk.isNotEmpty) ...[
                const SectionTitle('Best packages this month'),
                GlowCard(child: Bars([for (final x in pk) (toStr(x['name']), toDouble(x['total']))], color: C.brand2, height: 110)),
                const SizedBox(height: 8),
                for (final x in pk)
                  ListTile(contentPadding: EdgeInsets.zero, dense: true, title: Text(toStr(x['name'])), subtitle: Text('${toInt(x['n'])} sold'), trailing: Text(money(x['total']), style: const TextStyle(fontWeight: FontWeight.w800))),
              ],
              if (rt.isNotEmpty) ...[
                const SectionTitle('Routers (30 days)'),
                for (final r in rt)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: GlowCard(
                      padding: const EdgeInsets.all(12),
                      glow: r['online'] == true ? C.green : C.red,
                      child: Row(children: [
                        Dot(r['online'] == true),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(toStr(r['device_name']), style: const TextStyle(fontWeight: FontWeight.w800)),
                            Text('Uptime ${toDouble(r['uptime']).toStringAsFixed(1)}% • ${toInt(r['customers'])} customers • ${fmtBytes(r['bytes'])}', style: TextStyle(color: C.muted, fontSize: 12)),
                          ]),
                        ),
                        Text(money(r['sales']), style: const TextStyle(fontWeight: FontWeight.w800)),
                      ]),
                    ),
                  ),
              ],
            ];
          },
        ),
      );
}

class TopSellersScreen extends StatefulWidget {
  const TopSellersScreen({super.key});
  @override
  State<TopSellersScreen> createState() => _TopSellersScreenState();
}

class _TopSellersScreenState extends State<TopSellersScreen> {
  String _period = '30d';
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: skyBar('Top sellers'),
        body: AsyncPage<Map<String, dynamic>>(
          key: ValueKey(_period),
          load: () => Api.I.getMap('top_sellers', {'period': _period}),
          build: (ctx, d, reload) {
            final periods = toMap(d['periods']);
            final me = toMap(d['my_position']);
            final list = toList(d['list']).map(toMap).toList();
            return [
              Wrap(spacing: 8, runSpacing: 8, children: [
                for (final e in periods.entries) ChoiceChip(label: Text(toStr(e.value)), selected: _period == e.key, onSelected: (_) => setState(() => _period = e.key)),
              ]),
              const SizedBox(height: 12),
              if (me.isNotEmpty)
                GlowCard(
                  glow: C.amber,
                  child: Row(children: [
                    const Icon(Icons.emoji_events, color: C.amber, size: 36),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        toInt(me['rank']) > 0
                            ? 'You are #${toInt(me['rank'])} of ${toInt(d['sellers'])} with ${money(me['total'])}${toDouble(me['need']) > 0 ? '. Sell ${money(me['need'])} more to move up.' : '.'}'
                            : 'No sales in this period yet — your first sale puts you on the list.',
                      ),
                    ),
                  ]),
                ),
              const SizedBox(height: 10),
              for (final s in list)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: GlowCard(
                    glow: s['me'] == true ? C.brand : (toInt(s['rank']) <= 3 ? C.amber : C.line),
                    padding: const EdgeInsets.all(12),
                    child: Row(children: [
                      SizedBox(
                        width: 38,
                        child: Text(toInt(s['rank']) == 1 ? '🥇' : toInt(s['rank']) == 2 ? '🥈' : toInt(s['rank']) == 3 ? '🥉' : '#${toInt(s['rank'])}',
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                      ),
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text('${toStr(s['name'])}${s['me'] == true ? ' (you)' : ''}', style: const TextStyle(fontWeight: FontWeight.w800)),
                          Text('${toInt(s['sales'])} sales • ${toInt(s['routers'])} routers • ${toInt(s['customers'])} customers', style: TextStyle(color: C.muted, fontSize: 12)),
                        ]),
                      ),
                      if (s['total'] != null) Text(money(s['total']), style: const TextStyle(fontWeight: FontWeight.w800)),
                    ]),
                  ),
                ),
            ];
          },
        ),
      );
}

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});
  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  String _type = 'seller';
  String _period = 'month';
  int _id = 0;
  List<Map<String, dynamic>> _routers = [];

  @override
  void initState() {
    super.initState();
    Api.I.getList('routers').then((l) {
      if (mounted) setState(() => _routers = l.map(toMap).toList());
    }).catchError((_) {});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: skyBar('Reports'),
        body: AsyncPage<Map<String, dynamic>>(
          skeleton: const SkeletonDashboard(),
          key: ValueKey('$_type|$_period|$_id'),
          load: () => Api.I.getMap('reports', {'type': _type, 'period': _period, if (_type == 'router' && _id > 0) 'id': _id}),
          build: (ctx, d, reload) {
            final rep = toMap(d['report']);
            final sum = toMap(rep['sum']);
            final daily = toMap(rep['daily']);
            final stats = toMap(rep['stats']);
            final peak = toList(rep['peak']);
            final periods = toMap(d['periods']);
            final routers = toList(rep['routers']).map(toMap).toList();
            return [
              SegmentedButton<String>(
                segments: const [ButtonSegment(value: 'seller', label: Text('My account'), icon: Icon(Icons.person)), ButtonSegment(value: 'router', label: Text('One router'), icon: Icon(Icons.router))],
                selected: {_type},
                onSelectionChanged: (s) => setState(() => _type = s.first),
              ),
              const SizedBox(height: 10),
              Row(children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: periods.containsKey(_period) ? _period : null,
                    decoration: const InputDecoration(labelText: 'Period', isDense: true),
                    items: [for (final e in periods.entries) if (e.key != 'custom') DropdownMenuItem(value: e.key, child: Text(toStr(e.value)))],
                    onChanged: (v) => setState(() => _period = v ?? 'month'),
                  ),
                ),
                if (_type == 'router') ...[
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      initialValue: _routers.any((r) => toInt(r['id']) == toInt(d['id'])) ? toInt(d['id']) : null,
                      isExpanded: true,
                      decoration: const InputDecoration(labelText: 'Router', isDense: true),
                      items: [for (final r in _routers) DropdownMenuItem(value: toInt(r['id']), child: Text(toStr(r['device_name']), overflow: TextOverflow.ellipsis))],
                      onChanged: (v) => setState(() => _id = v ?? 0),
                    ),
                  ),
                ],
              ]),
              const SizedBox(height: 6),
              Text(toStr(d['label']), style: TextStyle(color: C.muted)),
              const SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.7,
                children: [
                  StatTile(icon: Icons.trending_up, label: 'Net earnings', value: money(sum['net'] ?? rep['gross']), color: C.green),
                  StatTile(icon: Icons.payments_outlined, label: 'Gross sales', value: money(sum['gross'] ?? rep['gross']), color: C.brand),
                  StatTile(icon: Icons.phone_android, label: 'Mobile money', value: money(sum['mobile'] ?? rep['mobile']), color: C.cyan, sub: '${toInt(sum['payments'] ?? rep['payments'])} payments'),
                  StatTile(icon: Icons.confirmation_number_outlined, label: 'Vouchers', value: money(sum['vouchers'] ?? rep['vouchers']), color: C.brand2, sub: '${toInt(sum['vouchers_used'])} used'),
                  StatTile(icon: Icons.people_alt_outlined, label: 'Customers', value: '${toInt(stats['customers'] ?? sum['customers'])}', color: C.amber, sub: '${toInt(stats['sessions'] ?? sum['sessions'])} sessions'),
                  StatTile(icon: Icons.data_usage, label: 'Data used', value: fmtBytes(stats['bytes'] ?? sum['bytes']), color: C.green, sub: '${toDouble(stats['hours'] ?? sum['hours']).toStringAsFixed(0)} hours online'),
                ],
              ),
              if (daily.isNotEmpty) ...[
                const SectionTitle('Sales per day'),
                GlowCard(
                  child: Bars([
                    for (final e in daily.entries) (e.key.length >= 10 ? e.key.substring(8, 10) : e.key, toDouble(toMap(e.value)['mm']) + toDouble(toMap(e.value)['vc'])),
                  ], color: C.green),
                ),
              ],
              if (peak.length == 24) ...[
                const SectionTitle('Busy hours'),
                GlowCard(child: Bars([for (var i = 0; i < 24; i++) ('$i', toDouble(peak[i]))], color: C.cyan, height: 80)),
              ],
              if (routers.isNotEmpty) ...[
                const SectionTitle('Routers'),
                for (final r in routers)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(toStr(toMap(r['d'])['device_name'], toStr(r['device_name']))),
                    subtitle: Text('${toInt(r['outages'])} outage(s) • offline ${fmtSecs(r['down'])}'),
                    trailing: Text(money(toDouble(r['mm']) + toDouble(r['vc'])), style: const TextStyle(fontWeight: FontWeight.w800)),
                  ),
              ],
              const SizedBox(height: 14),
              GradButton(
                onPressed: () => push(ctx, ReportPdfScreen(type: _type, period: _period, id: toInt(d['id']), label: toStr(d['label']))),
                icon: Icons.picture_as_pdf,
                label: 'Download / print PDF',
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () => copyText(ctx, toStr(d['summary_text']), what: 'Report copied — paste it in WhatsApp or SMS'),
                icon: const Icon(Icons.copy_all),
                label: const Text('Copy report as text'),
              ),
              if (Session.isAdmin) const SizedBox(height: 4),
            ];
          },
        ),
      );
}
