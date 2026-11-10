// Home shell exactly like the website: top bar (☰ · title · ◐ · chat · bell), side menu, bottom menu, Home page
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../api.dart';
import '../main.dart';
import '../ui.dart';
import 'admin.dart';
import 'auth.dart';
import 'clients.dart';
import 'insights.dart';
import 'messages.dart';
import 'money.dart';
import 'packages.dart';
import 'profile.dart';
import 'routers.dart';
import 'sms.dart';
import 'vouchers.dart';
import 'webview.dart';

void push(BuildContext context, Widget w) => Navigator.push(context, MaterialPageRoute(builder: (_) => w));

/// The website's top bar on pushed pages: small "SKY WIFI TANZANIA" above the page title.
AppBar skyBar(String title, {List<Widget>? actions, PreferredSizeWidget? bottom}) => AppBar(
      toolbarHeight: 62,
      titleSpacing: 4,
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('SKY WIFI TANZANIA', style: TextStyle(fontSize: 10.5, letterSpacing: 1.6, fontWeight: FontWeight.w800, color: C.muted)),
        const SizedBox(height: 1),
        Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: C.text)),
      ]),
      actions: actions == null ? null : [...actions, const SizedBox(width: 8)],
      bottom: bottom,
    );

/// One entry of the side menu (same names, icons and order as the website).
class MenuItem {
  final IconData icon;
  final String label;
  final int? tab; // bottom-menu tab, or null for a page
  final Widget Function()? page;
  const MenuItem(this.icon, this.label, {this.tab, this.page});
}

List<(String, List<MenuItem>)> sideMenu() => [
      ('Main', [
        const MenuItem(FontAwesomeIcons.house, 'Home', tab: 0),
        MenuItem(FontAwesomeIcons.lightbulb, 'Business Insights', page: () => const InsightsScreen()),
        MenuItem(FontAwesomeIcons.trophy, 'Top Sellers', page: () => const TopSellersScreen()),
        MenuItem(FontAwesomeIcons.commentDots, 'Messages', page: () => const ChatScreen()),
        MenuItem(FontAwesomeIcons.chartColumn, 'Reports', page: () => const ReportsScreen()),
      ]),
      ('Network', [
        MenuItem(FontAwesomeIcons.towerBroadcast, 'Routers', page: () => const RoutersScreen()),
        MenuItem(FontAwesomeIcons.wifi, 'Hotspot', page: () => const RoutersScreen(hotspot: true)),
        MenuItem(FontAwesomeIcons.towerCell, 'WiFi Names', page: () => const WifiNamesScreen()),
        MenuItem(FontAwesomeIcons.image, 'WiFi Posters', page: () => const PostersScreen()),
        MenuItem(FontAwesomeIcons.mapLocationDot, 'Access Point Map', page: () => const MapScreen()),
      ]),
      ('WiFi sales', [
        MenuItem(FontAwesomeIcons.box, 'Packages', page: () => const PackagesScreen()),
        const MenuItem(FontAwesomeIcons.ticket, 'Vouchers', tab: 2),
        const MenuItem(FontAwesomeIcons.signal, 'Live Sessions', tab: 1),
        MenuItem(FontAwesomeIcons.commentSms, 'SMS to Clients', page: () => const SmsScreen()),
      ]),
      ('Money', [
        const MenuItem(FontAwesomeIcons.cartShopping, 'Orders', tab: 3),
        MenuItem(FontAwesomeIcons.receipt, 'Transactions', page: () => const TransactionsScreen()),
        MenuItem(FontAwesomeIcons.addressBook, 'Customers', page: () => const CustomersScreen()),
        const MenuItem(FontAwesomeIcons.moneyBillWave, 'Withdraw', tab: 4),
        MenuItem(FontAwesomeIcons.percent, 'Commission', page: () => const CommissionScreen()),
        MenuItem(FontAwesomeIcons.clockRotateLeft, 'Time Adjustments', page: () => const AdjustmentsScreen()),
      ]),
      ('Account', [
        MenuItem(FontAwesomeIcons.user, 'Profile', page: () => const ProfileScreen()),
        MenuItem(FontAwesomeIcons.gear, 'Settings', page: () => const SettingsScreen()),
        MenuItem(FontAwesomeIcons.bell, 'Notifications', page: () => const NotificationsScreen()),
        MenuItem(FontAwesomeIcons.userShield, 'Privacy Policy', page: () => const PrivacyScreen()),
      ]),
      if (Session.isAdmin)
        ('Administrator', [
          MenuItem(FontAwesomeIcons.screwdriverWrench, 'Admin panel', page: () => const AdminScreen()),
        ]),
    ];

const _tabs = [
  (FontAwesomeIcons.house, 'Home'),
  (FontAwesomeIcons.signal, 'Live Sessions'),
  (FontAwesomeIcons.ticket, 'Vouchers'),
  (FontAwesomeIcons.cartShopping, 'Orders'),
  (FontAwesomeIcons.moneyBillWave, 'Withdraw'),
];

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});
  @override
  State<HomeShell> createState() => HomeShellState();
}

class HomeShellState extends State<HomeShell> {
  final _sk = GlobalKey<ScaffoldState>();
  int _tab = 0;
  int _chat = 0;
  int _bell = 0;
  Timer? _t;
  final _seen = <int>{0};

  @override
  void initState() {
    super.initState();
    _chat = toInt(Session.me['unread_messages']);
    _bell = toInt(Session.me['unread_notifications']);
    _poll();
    _t = Timer.periodic(const Duration(seconds: 20), (_) => _poll());
  }

  @override
  void dispose() {
    _t?.cancel();
    super.dispose();
  }

  Future<void> _poll() async {
    try {
      final j = await Api.I.raw('badges');
      if (!mounted || j['ok'] != true) return;
      setState(() {
        _chat = toInt(j['chat']);
        _bell = toInt(j['notif']);
      });
    } catch (_) {}
  }

  void setTab(int i) => setState(() {
        _tab = i;
        _seen.add(i);
      });

  Future<void> _open(Widget w) async {
    await Navigator.push(context, MaterialPageRoute(builder: (_) => w));
    _poll();
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      DashboardTab(onTab: setTab, onOpen: _open),
      _seen.contains(1) ? const SessionsView() : const SizedBox(),
      _seen.contains(2) ? const VouchersTab() : const SizedBox(),
      _seen.contains(3) ? const OrdersView() : const SizedBox(),
      _seen.contains(4) ? const WithdrawView() : const SizedBox(),
    ];
    return Scaffold(
      key: _sk,
      extendBody: true,
      drawer: SideMenu(current: _tab, onTab: setTab, onOpen: _open),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 66,
        titleSpacing: 14,
        title: Row(children: [
          IconBtn(FontAwesomeIcons.bars, onTap: () => _sk.currentState?.openDrawer(), tooltip: 'Menu'),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('SKY WIFI TANZANIA', style: TextStyle(fontSize: 10.5, letterSpacing: 1.6, fontWeight: FontWeight.w800, color: C.muted)),
              const SizedBox(height: 1),
              Text(_tabs[_tab].$2, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: C.text)),
            ]),
          ),
        ]),
        actions: [
          IconBtn(FontAwesomeIcons.circleHalfStroke, tooltip: 'Dark / light', onTap: () => ThemeCtl.toggle(context)),
          const SizedBox(width: 8),
          IconBtn(FontAwesomeIcons.solidCommentDots, color: const Color(0xFF3B82F6), tooltip: 'Messages', badge: _chat, onTap: () => _open(const ChatScreen())),
          const SizedBox(width: 8),
          IconBtn(FontAwesomeIcons.solidBell, tooltip: 'Notifications', badge: _bell, onTap: () => _open(const NotificationsScreen())),
          const SizedBox(width: 14),
        ],
      ),
      body: IndexedStack(index: _tab, children: pages),
      bottomNavigationBar: BottomMenu(current: _tab, onTab: setTab),
    );
  }
}

/// The website's bottom menu (phones): Home · Live Sessions · Vouchers · Orders · Withdraw.
class BottomMenu extends StatelessWidget {
  final int current;
  final void Function(int) onTab;
  const BottomMenu({super.key, required this.current, required this.onTab});
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: C.dark ? const Color(0xF20A101C) : const Color(0xF7FFFFFF),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
          border: Border(top: BorderSide(color: C.line)),
          boxShadow: const [BoxShadow(color: Color(0x66000000), blurRadius: 30, spreadRadius: -18, offset: Offset(0, -10))],
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
            child: SizedBox(
              height: 56,
              child: Row(children: [
                for (var i = 0; i < _tabs.length; i++)
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () => onTab(i),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: current == i ? C.soft : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          border: current == i ? Border.all(color: C.brand.withValues(alpha: .35)) : null,
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                          FaIcon(_tabs[i].$1, size: 17, color: current == i ? C.brand : C.muted),
                          const SizedBox(height: 5),
                          Text(_tabs[i].$2,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: current == i ? C.brand : C.muted)),
                        ]),
                      ),
                    ),
                  ),
              ]),
            ),
          ),
        ),
      );
}

/// The website's side menu: brand, user + balance, sections, sign out.
class SideMenu extends StatelessWidget {
  final int current;
  final void Function(int) onTab;
  final Future<void> Function(Widget) onOpen;
  const SideMenu({super.key, required this.current, required this.onTab, required this.onOpen});
  @override
  Widget build(BuildContext context) {
    final me = Session.me;
    return Drawer(
      shape: const RoundedRectangleBorder(),
      child: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 8, 10),
            child: Row(children: [
              const LogoMark(size: 38),
              const SizedBox(width: 10),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('SKY WIFI TANZANIA', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14.5, color: C.text)),
                  Text('OMADA · RADIUS', style: TextStyle(fontSize: 10, letterSpacing: 1.2, fontWeight: FontWeight.w700, color: C.muted)),
                ]),
              ),
              IconButton(icon: Icon(Icons.close, color: C.muted), onPressed: () => Navigator.pop(context)),
            ]),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(12, 4, 12, 6),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: C.card, borderRadius: BorderRadius.circular(14), border: Border.all(color: C.line)),
            child: Row(children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(gradient: C.grad, borderRadius: BorderRadius.circular(11)),
                child: Center(
                  child: Text(Session.name.isEmpty ? '?' : Session.name[0].toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(Session.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w700, color: C.text)),
                  Text(money(me['balance']), style: const TextStyle(color: C.green, fontWeight: FontWeight.w800, fontSize: 12.5)),
                ]),
              ),
            ]),
          ),
          Expanded(
            child: ListView(padding: const EdgeInsets.fromLTRB(10, 0, 10, 10), children: [
              for (final sec in sideMenu()) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 14, 12, 6),
                  child: Text(sec.$1.toUpperCase(), style: TextStyle(fontSize: 10.5, letterSpacing: 1.4, fontWeight: FontWeight.w800, color: C.muted)),
                ),
                for (final it in sec.$2) _item(context, it),
              ],
              const SizedBox(height: 8),
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () async {
                  Navigator.pop(context);
                  if (!await confirm(context, 'Logout', 'Sign out of SKY WIFI on this phone?', ok: 'Logout', danger: true)) return;
                  try {
                    await Api.I.post('auth/logout');
                  } catch (_) {}
                  await Api.I.saveToken(null);
                  goTo(const LoginScreen());
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(color: C.red.withValues(alpha: .08), borderRadius: BorderRadius.circular(12), border: Border.all(color: C.red.withValues(alpha: .25))),
                  child: const Row(children: [
                    FaIcon(FontAwesomeIcons.rightFromBracket, size: 15, color: C.red),
                    SizedBox(width: 12),
                    Text('Logout', style: TextStyle(color: C.red, fontWeight: FontWeight.w700)),
                  ]),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget _item(BuildContext context, MenuItem it) {
    final active = it.tab != null && it.tab == current;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.pop(context);
        if (it.tab != null) {
          onTab(it.tab!);
        } else if (it.page != null) {
          onOpen(it.page!());
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 2),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        decoration: BoxDecoration(color: active ? C.soft : Colors.transparent, borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          SizedBox(width: 22, child: Center(child: FaIcon(it.icon, size: 15, color: active ? C.brand : C.muted))),
          const SizedBox(width: 12),
          Expanded(child: Text(it.label, style: TextStyle(fontWeight: active ? FontWeight.w700 : FontWeight.w500, color: active ? C.brand : C.body, fontSize: 14))),
        ]),
      ),
    );
  }
}

// =====================================================================
// HOME (the same blocks, order and colours as the website's Home page)
// =====================================================================
class DashboardTab extends StatelessWidget {
  final void Function(int) onTab;
  final Future<void> Function(Widget) onOpen;
  const DashboardTab({super.key, required this.onTab, required this.onOpen});

  @override
  Widget build(BuildContext context) => AsyncPage<Map<String, dynamic>>(
        skeleton: const SkeletonDashboard(),
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 110),
        load: () async {
          final d = await Api.I.getMap('dashboard');
          try {
            await Session.refresh();
          } catch (_) {}
          return d;
        },
        build: (ctx, d, reload) {
          final st = toMap(d['stats']);
          final e = toMap(d['earnings']);
          final routers = toList(d['routers']).map(toMap).toList();
          final pending = toList(d['pending_orders']).map(toMap).toList();
          final recent = toList(d['recent_sales']).map(toMap).toList();
          final plat = toMap(d['platform']);
          final qs = toList(d['quick_start']).map(toMap).toList();
          final qsDone = qs.where((x) => x['done'] == true).length;
          final chart = toList(d['chart']).map(toMap).toList();
          final goal = toMap(d['goal']);
          final per = toMap(d['periods']);
          final top = toList(d['top_sellers']).map(toMap).toList();
          final online = routers.where((r) => r['online'] == true).length;
          return [
            if (Session.me['privacy_accepted'] == false)
              _note(
                ctx,
                FontAwesomeIcons.userShield,
                'Our Privacy Policy was published / updated. Please read it and confirm that you agree.',
                action: ('Read & accept', () => onOpen(const PrivacyScreen(askAccept: true))),
              ),
            if (d['radius_server_online'] == false)
              _note(ctx, FontAwesomeIcons.triangleExclamation, 'The RADIUS server is not answering — hotspots cannot log customers in. Contact the administrator.', warn: true),
            const SizedBox(height: 4),
            Text('Welcome back, ${Session.name.split(' ').first} 👋', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800, color: C.text, letterSpacing: -.3)),
            const SizedBox(height: 2),
            Text(longToday(), style: TextStyle(color: C.muted, fontSize: 13)),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                decoration: BoxDecoration(color: C.dark ? const Color(0xFF0F1626) : C.card, borderRadius: BorderRadius.circular(10), border: Border.all(color: C.line2)),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  FaIcon(FontAwesomeIcons.wallet, size: 15, color: C.text),
                  const SizedBox(width: 10),
                  Text('Available Balance: ${money(e['balance'])}', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: C.text)),
                ]),
              ),
            ),
            const SizedBox(height: 16),
            _grid([
              StatCard(variant: 's2', icon: FontAwesomeIcons.mobileScreen, label: 'Earnings from Mobile Money', value: money(e['mobile_net'] ?? e['mobile']), sub: 'Today: ${money(e['mobile_today'])}'),
              StatCard(variant: 's3', icon: FontAwesomeIcons.ticket, label: 'Earnings from Vouchers', value: money(e['vouchers_net'] ?? e['vouchers']), sub: 'Today: ${money(e['vouchers_today'])} • cash in shop'),
              StatCard(variant: 's1', icon: FontAwesomeIcons.sackDollar, label: 'Total Earnings', value: money(e['total']), sub: 'Platform commission: −${money(e['commission'])}'),
              StatCard(variant: 's5', icon: FontAwesomeIcons.moneyBillTransfer, label: 'Withdrawn', value: '−${money(e['withdrawn'])}', sub: 'Withdraw →', onTap: () => onTab(4)),
            ]),
            const SizedBox(height: 12),
            StatCard(variant: 's6', icon: FontAwesomeIcons.wallet, label: 'Available Balance', value: money(e['balance']), sub: 'Sonic Pesa − withdrawn', onTap: () => onTab(4)),
            if (plat.isNotEmpty) ...[
              const SizedBox(height: 12),
              StatCard(variant: 's4', icon: FontAwesomeIcons.buildingColumns, label: 'Platform earnings (admin)', value: money(plat['total']), sub: 'Month ${money(plat['month'])} • today ${money(plat['today'])}', onTap: () => onOpen(const AdminScreen())),
            ],
            const SizedBox(height: 14),
            if (qs.isNotEmpty && qsDone < qs.length)
              WebCard(
                title: 'Quick start',
                icon: FontAwesomeIcons.flagCheckered,
                trailing: _badge('$qsDone/${qs.length}'),
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(value: qsDone / qs.length, minHeight: 6, backgroundColor: C.card3, color: C.brand),
                  ),
                  const SizedBox(height: 12),
                  for (var i = 0; i < qs.length; i++) _qsRow(ctx, i, qs[i], routers),
                ]),
              ),
            _grid([
              StatCard(variant: 's1', icon: FontAwesomeIcons.coins, label: "Today's earnings", value: money(st['today_revenue']), onTap: () => onTab(3)),
              StatCard(variant: 's2', icon: FontAwesomeIcons.signal, label: 'Active sessions', value: '${toInt(st['active_sessions'])}', onTap: () => onTab(1)),
              StatCard(variant: 's3', icon: FontAwesomeIcons.bolt, label: 'Vouchers started today', value: '${toInt(st['used_today'])}', onTap: () => onTab(2)),
              StatCard(variant: 's4', icon: FontAwesomeIcons.ticket, label: 'Unused vouchers', value: '${toInt(st['available'])}', onTap: () => onTab(2)),
            ]),
            const SizedBox(height: 14),
            if (chart.isNotEmpty)
              WebCard(
                title: 'Earnings — last 14 days',
                icon: FontAwesomeIcons.chartColumn,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    _legend(C.green, 'Mobile money'),
                    const SizedBox(width: 14),
                    _legend(C.cyan, 'Vouchers'),
                    const Spacer(),
                    Text('14-day total: ', style: TextStyle(color: C.muted, fontSize: 12.5)),
                    Text(money(chart.fold<double>(0, (a, x) => a + toDouble(x['mm']) + toDouble(x['vc']))), style: TextStyle(color: C.text, fontWeight: FontWeight.w800, fontSize: 12.5)),
                  ]),
                  const SizedBox(height: 14),
                  Bars([for (final x in chart) (toStr(x['day']).length >= 10 ? toStr(x['day']).substring(8, 10) : '', toDouble(x['mm']))],
                      data2: [for (final x in chart) toDouble(x['vc'])], color: C.green, color2: C.cyan, height: 110),
                ]),
              ),
            WebCard(
              title: 'Routers ($online/${routers.length} Online)',
              icon: FontAwesomeIcons.towerBroadcast,
              trailing: TextButton(onPressed: () => onOpen(const RoutersScreen()), child: const Text('View all')),
              padding: const EdgeInsets.fromLTRB(16, 6, 16, 10),
              child: routers.isEmpty
                  ? Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: Text('Nothing here yet.', style: TextStyle(color: C.muted)))
                  : Column(children: [
                      for (final r in routers)
                        InkWell(
                          onTap: () => onOpen(RouterDetailScreen(toInt(r['id']))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(children: [
                              Dot(r['online'] == true),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Text.rich(TextSpan(children: [
                                    TextSpan(text: '${toStr(r['device_name'])} ', style: TextStyle(fontWeight: FontWeight.w700, color: C.text)),
                                    TextSpan(text: toStr(r['ap_mac']).replaceAll('-', ':'), style: TextStyle(fontFamily: kMono, fontSize: 11.5, color: C.muted)),
                                  ])),
                                  Text(toStr(r['ssid']), style: TextStyle(color: C.muted, fontSize: 12)),
                                ]),
                              ),
                              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                                StatusChip(r['online'] == true ? 'online' : 'offline'),
                                const SizedBox(height: 4),
                                Text('${toInt(r['active_sessions'])} 👤', style: TextStyle(color: C.muted, fontSize: 12)),
                              ]),
                            ]),
                          ),
                        ),
                    ]),
            ),
            WebCard(
              title: 'Pending Payments (${pending.length})',
              icon: FontAwesomeIcons.hourglassHalf,
              trailing: TextButton(onPressed: () => onTab(3), child: const Text('View all')),
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 4),
              child: pending.isEmpty
                  ? Padding(padding: const EdgeInsets.fromLTRB(4, 0, 4, 8), child: Text('Nothing here yet.', style: TextStyle(color: C.muted)))
                  : Column(children: [for (final o in pending) Padding(padding: const EdgeInsets.only(bottom: 8), child: OrderTile(o, onChanged: reload))]),
            ),
            if (goal.isNotEmpty) _goalCard(ctx, goal),
            if (per.isNotEmpty) _periods(ctx, per),
            if (top.isNotEmpty)
              WebCard(
                title: 'Top sellers this month',
                icon: FontAwesomeIcons.trophy,
                trailing: TextButton(onPressed: () => onOpen(const TopSellersScreen()), child: const Text('Full ranking')),
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
                child: Column(children: [
                  for (final s in top)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(children: [
                        SizedBox(width: 30, child: Text(toInt(s['rank']) == 1 ? '🥇' : toInt(s['rank']) == 2 ? '🥈' : toInt(s['rank']) == 3 ? '🥉' : '#${toInt(s['rank'])}', style: const TextStyle(fontSize: 18))),
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Row(children: [
                              Flexible(child: Text(toStr(s['name']), overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w700, color: C.text))),
                              if (s['me'] == true) ...[const SizedBox(width: 6), _badge('You')],
                            ]),
                            Text('${toInt(s['sales'])} Sales • ${toInt(s['routers'])} Routers', style: TextStyle(color: C.muted, fontSize: 12)),
                          ]),
                        ),
                        if (s['total'] != null) Text(money(s['total']), style: TextStyle(fontWeight: FontWeight.w800, color: C.text)),
                      ]),
                    ),
                ]),
              ),
            WebCard(
              title: 'Recent Orders',
              icon: FontAwesomeIcons.receipt,
              trailing: TextButton(onPressed: () => onTab(3), child: const Text('All')),
              padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
              child: recent.isEmpty
                  ? Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: Text('Nothing here yet.', style: TextStyle(color: C.muted)))
                  : Column(children: [
                      for (final o in recent)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(children: [
                            const FaIcon(FontAwesomeIcons.circleCheck, size: 16, color: C.green),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Text(toStr(o['package_name'], 'Package'), style: TextStyle(fontWeight: FontWeight.w700, color: C.text)),
                                Text('${toStr(o['phone'])} • ${fmtDate(o['paid_at'])}${toStr(o['code']).isNotEmpty ? ' • ${toStr(o['code'])}' : ''}', style: TextStyle(color: C.muted, fontSize: 12)),
                              ]),
                            ),
                            Text(money(o['amount']), style: TextStyle(fontWeight: FontWeight.w800, color: C.text)),
                          ]),
                        ),
                    ]),
            ),
          ];
        },
      );

  static Widget _grid(List<Widget> cards) => Column(children: [
        for (var i = 0; i < cards.length; i += 2) ...[
          if (i > 0) const SizedBox(height: 12),
          IntrinsicHeight(
            child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(child: cards[i]),
              const SizedBox(width: 12),
              Expanded(child: i + 1 < cards.length ? cards[i + 1] : const SizedBox()),
            ]),
          ),
        ],
      ]);

  static Widget _badge(String t) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(color: C.soft, borderRadius: BorderRadius.circular(8), border: Border.all(color: C.brand.withValues(alpha: .4))),
        child: Text(t, style: const TextStyle(color: C.brand, fontWeight: FontWeight.w800, fontSize: 11.5)),
      );

  static Widget _legend(Color c, String t) => Row(mainAxisSize: MainAxisSize.min, children: [
        Container(width: 9, height: 9, decoration: BoxDecoration(color: c, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(t, style: TextStyle(color: C.body, fontSize: 12.5)),
      ]);

  Widget _note(BuildContext ctx, IconData icon, String text, {(String, VoidCallback)? action, bool warn = false}) => Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: warn ? (C.dark ? const Color(0xFF1A1508) : const Color(0xFFFFF7E6)) : (C.dark ? const Color(0xFF0E1A33) : const Color(0xFFEEF3FF)),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: (warn ? C.amber : C.brand).withValues(alpha: .22)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(padding: const EdgeInsets.only(top: 3), child: FaIcon(icon, size: 15, color: warn ? C.amber : C.text)),
            const SizedBox(width: 10),
            Expanded(child: Text(text, style: TextStyle(color: C.text, fontSize: 14.5, height: 1.45))),
          ]),
          if (action != null) ...[
            const SizedBox(height: 12),
            GradButton(onPressed: action.$2, label: action.$1, expand: false),
          ],
        ]),
      );

  Widget _qsRow(BuildContext ctx, int i, Map<String, dynamic> q, List<Map<String, dynamic>> routers) {
    final done = q['done'] == true;
    final key = toStr(q['key']);
    void go() {
      if (key == 'router') {
        onOpen(const RouterFormScreen());
      } else if (key == 'provision' || key == 'live') {
        onOpen(routers.isEmpty ? const RouterFormScreen() : RouterDetailScreen(toInt(routers.first['id'])));
      } else if (key == 'package') {
        onOpen(const PackagesScreen());
      } else {
        onTab(2);
      }
    }

    return InkWell(
      onTap: done ? null : go,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
        decoration: BoxDecoration(color: done ? Colors.transparent : C.card2, borderRadius: BorderRadius.circular(12), border: Border.all(color: C.line)),
        child: Row(children: [
          done
              ? const FaIcon(FontAwesomeIcons.solidCircleCheck, size: 17, color: C.green)
              : Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(color: C.card3, shape: BoxShape.circle),
                  child: Center(child: Text('${i + 1}', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: C.text))),
                ),
          const SizedBox(width: 12),
          Expanded(
            child: Text('${i + 1}. ${toStr(q['label'])}',
                style: TextStyle(color: done ? C.muted : C.text, decoration: done ? TextDecoration.lineThrough : null, fontWeight: done ? FontWeight.w500 : FontWeight.w600)),
          ),
          if (!done) Icon(Icons.chevron_right, color: C.muted),
        ]),
      ),
    );
  }

  Widget _goalCard(BuildContext ctx, Map<String, dynamic> g) {
    final pct = toDouble(g['pct']).clamp(0, 100).toDouble();
    return WebCard(
      title: 'Monthly goal: ${money(g['goal'])}',
      icon: FontAwesomeIcons.bullseye,
      trailing: Text('${money(g['net'])} • ${pct.toStringAsFixed(1)}%', style: TextStyle(color: C.muted, fontSize: 12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(value: pct / 100, minHeight: 7, backgroundColor: C.card3, color: pct >= 100 ? C.green : C.brand),
        ),
        const SizedBox(height: 10),
        Text('At this pace: ${money(g['projected'])} by month end${toDouble(g['need_per_day']) > 0 ? ' • needed: ${money(g['need_per_day'])} per day' : ''}', style: TextStyle(color: C.muted, fontSize: 12.5)),
        const SizedBox(height: 12),
        Align(alignment: Alignment.centerLeft, child: OutlinedButton.icon(onPressed: () => onOpen(const InsightsScreen()), icon: const FaIcon(FontAwesomeIcons.lightbulb, size: 14), label: const Text('Business Insights'))),
      ]),
    );
  }

  Widget _periods(BuildContext ctx, Map<String, dynamic> p) {
    final ch = p['change'];
    Widget card(String variant, IconData icon, String title, String sub, Map<String, dynamic> v) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: StatCard(
            variant: variant,
            icon: icon,
            label: '$title • $sub',
            value: money(v['net']),
            sub: 'Mobile Money ${money(v['mobile'])} • Vouchers ${money(v['vouchers'])} • Commission −${money(v['commission'])}',
          ),
        );
    return WebCard(
      title: 'Earnings & statistics',
      icon: FontAwesomeIcons.chartLine,
      trailing: ch == null
          ? null
          : StatusChip(toDouble(ch) >= 0 ? 'success' : 'danger', label: '${toDouble(ch) >= 0 ? '+' : ''}${toDouble(ch).toStringAsFixed(1)}% vs last month'),
      child: Column(children: [
        card('s1', FontAwesomeIcons.calendarDay, 'This month', toStr(p['this_label']), toMap(p['this'])),
        card('s2', FontAwesomeIcons.calendarMinus, 'Last month', toStr(p['last_label']), toMap(p['last'])),
        card('s3', FontAwesomeIcons.infinity, 'All time', 'since the start', toMap(p['all'])),
      ]),
    );
  }
}

/// WiFi posters (printable, in Kiswahili) — opened in the app.
class PostersScreen extends StatelessWidget {
  const PostersScreen({super.key});
  @override
  Widget build(BuildContext context) => FutureBuilder<Map<String, dynamic>>(
        future: Api.I.getMap('vouchers/print_link'),
        builder: (ctx, s) {
          if (s.hasError) return Scaffold(appBar: skyBar('WiFi Posters'), body: ErrorView(s.error!, () => Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (_) => const PostersScreen()))));
          if (!s.hasData) return Scaffold(appBar: skyBar('WiFi Posters'), body: const SkeletonDetail());
          return WebPage(title: 'WiFi Posters', url: toStr(s.data!['posters_url']));
        },
      );
}
