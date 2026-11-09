// Home shell: bottom navigation, top bar with chat + notifications, Home and More tabs
import 'dart:async';

import 'package:flutter/material.dart';

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

void push(BuildContext context, Widget w) => Navigator.push(context, MaterialPageRoute(builder: (_) => w));

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});
  @override
  State<HomeShell> createState() => HomeShellState();
}

class HomeShellState extends State<HomeShell> {
  int _tab = 0;
  int _chat = 0;
  int _bell = 0;
  Timer? _t;

  @override
  void initState() {
    super.initState();
    _chat = toInt(Session.me['unread_messages']);
    _bell = toInt(Session.me['unread_notifications']);
    _poll();
    _t = Timer.periodic(const Duration(seconds: 20), (_) => _poll());
    WidgetsBinding.instance.addPostFrameCallback((_) => _privacyCheck());
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

  Future<void> _privacyCheck() async {
    if (Session.me['privacy_accepted'] == false && mounted) {
      await Navigator.push(context, MaterialPageRoute(builder: (_) => const PrivacyScreen(askAccept: true)));
    }
  }

  void setTab(int i) => setState(() => _tab = i);

  @override
  Widget build(BuildContext context) {
    final titles = ['Home', 'Vouchers', 'Clients', 'Money', 'More'];
    final pages = <Widget>[
      DashboardTab(onTab: setTab),
      const VouchersTab(),
      const ClientsTab(),
      const MoneyTab(),
      const MoreTab(),
    ];
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 16,
        title: Row(children: [
          const LogoMark(size: 32),
          const SizedBox(width: 10),
          Text(_tab == 0 ? 'SKY WIFI' : titles[_tab], style: const TextStyle(fontWeight: FontWeight.w900)),
        ]),
        actions: [
          IconButton(
            tooltip: 'Messages',
            icon: Badge(isLabelVisible: _chat > 0, label: Text('$_chat'), child: const Icon(Icons.chat_bubble_outline_rounded)),
            onPressed: () async {
              await Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatScreen()));
              _poll();
            },
          ),
          IconButton(
            tooltip: 'Notifications',
            icon: Badge(isLabelVisible: _bell > 0, label: Text('$_bell'), child: const Icon(Icons.notifications_none_rounded)),
            onPressed: () async {
              await Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationsScreen()));
              _poll();
            },
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: IndexedStack(index: _tab, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: setTab,
        height: 66,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.confirmation_number_outlined), selectedIcon: Icon(Icons.confirmation_number), label: 'Vouchers'),
          NavigationDestination(icon: Icon(Icons.people_alt_outlined), selectedIcon: Icon(Icons.people_alt), label: 'Clients'),
          NavigationDestination(icon: Icon(Icons.account_balance_wallet_outlined), selectedIcon: Icon(Icons.account_balance_wallet), label: 'Money'),
          NavigationDestination(icon: Icon(Icons.grid_view_outlined), selectedIcon: Icon(Icons.grid_view_rounded), label: 'More'),
        ],
      ),
    );
  }
}

// =====================================================================
// HOME
// =====================================================================
class DashboardTab extends StatelessWidget {
  final void Function(int) onTab;
  const DashboardTab({super.key, required this.onTab});

  @override
  Widget build(BuildContext context) => AsyncPage<Map<String, dynamic>>(
        load: () => Api.I.getMap('dashboard'),
        build: (ctx, d, reload) {
          final st = toMap(d['stats']);
          final e = toMap(d['earnings']);
          final routers = toList(d['routers']);
          final pending = toList(d['pending_orders']);
          final recent = toList(d['recent_sales']);
          final plat = toMap(d['platform']);
          final hour = DateTime.now().hour;
          final hi = hour < 12 ? 'Good morning' : (hour < 17 ? 'Good afternoon' : 'Good evening');
          return [
            Text('$hi, ${Session.name.split(' ').first} 👋', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: 4),
            Text(d['radius_server_online'] == true ? 'RADIUS server online • ${routers.length} router(s)' : 'RADIUS server offline — contact the administrator',
                style: TextStyle(color: d['radius_server_online'] == true ? C.muted : C.amber, fontSize: 13)),
            const SizedBox(height: 16),
            GlowCard(
              gradient: const LinearGradient(colors: [Color(0xFF1D2E66), Color(0xFF2A1F5C)], begin: Alignment.topLeft, end: Alignment.bottomRight),
              glow: C.brand2,
              onTap: () => onTab(3),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Withdrawable balance (mobile money)', style: TextStyle(color: Color(0xFFC7D2FE), fontSize: 13)),
                const SizedBox(height: 6),
                Text(money(e['balance']), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
                const SizedBox(height: 12),
                Row(children: [
                  Expanded(child: _mini('Today', money(e['today']))),
                  Expanded(child: _mini('This month', money(e['month']))),
                  Expanded(child: _mini('All time', money(e['total']))),
                ]),
              ]),
            ),
            const SizedBox(height: 14),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.55,
              children: [
                StatTile(icon: Icons.wifi_tethering, label: 'Online users', value: '${toInt(st['active_sessions'])}', color: C.green, onTap: () => onTab(2)),
                StatTile(icon: Icons.router_outlined, label: 'Routers online', value: '${toInt(st['devices_online'])} / ${toInt(st['devices'])}', color: C.cyan,
                    onTap: () => push(ctx, const RoutersScreen())),
                StatTile(icon: Icons.confirmation_number_outlined, label: 'Unused vouchers', value: '${toInt(st['available'])}', color: C.brand,
                    sub: '${toInt(st['active_vouchers'])} in use • ${toInt(st['used_today'])} today', onTap: () => onTab(1)),
                StatTile(icon: Icons.pending_actions_outlined, label: 'Payments to check', value: '${toInt(st['attention_orders'])}', color: C.amber,
                    sub: '${toInt(st['pending_orders'])} pending', onTap: () => onTab(3)),
                StatTile(icon: Icons.phone_iphone, label: 'Mobile money', value: money(e['mobile_net'] ?? e['mobile']), color: C.green),
                StatTile(icon: Icons.storefront_outlined, label: 'Voucher sales', value: money(e['vouchers_net'] ?? e['vouchers']), color: C.brand2, sub: 'cash in your shop'),
              ],
            ),
            if (plat.isNotEmpty) ...[
              const SectionTitle('Platform (administrator)'),
              GlowCard(
                glow: C.amber,
                onTap: () => push(ctx, const AdminScreen()),
                child: Wrap(spacing: 18, runSpacing: 10, children: [
                  _kpi('Total', money(plat['total'])),
                  _kpi('This month', money(plat['month'])),
                  _kpi('Today', money(plat['today'])),
                  _kpi('Voucher commission', money(plat['vc'])),
                  _kpi('SMS profit', money(plat['sms'])),
                ]),
              ),
            ],
            const SectionTitle('Quick actions'),
            Row(children: [
              _quick(ctx, Icons.add_card, 'Vouchers', C.brand, () => showGenerateDialog(ctx, then: reload)),
              _quick(ctx, Icons.add_to_queue, 'Add router', C.cyan, () => push(ctx, const RouterFormScreen())),
              _quick(ctx, Icons.sell_outlined, 'Packages', C.brand2, () => push(ctx, const PackagesScreen())),
              _quick(ctx, Icons.payments_outlined, 'Withdraw', C.green, () => push(ctx, const WithdrawScreen())),
            ]),
            SectionTitle('Routers', trailing: TextButton(onPressed: () => push(ctx, const RoutersScreen()), child: const Text('All'))),
            if (routers.isEmpty)
              GlowCard(
                onTap: () => push(ctx, const RouterFormScreen()),
                child: const Row(children: [
                  Icon(Icons.add_circle_outline, color: C.cyan),
                  SizedBox(width: 12),
                  Expanded(child: Text('Add your first router (TP-Link Omada, Ruijie or Cudy) to start selling WiFi.')),
                ]),
              ),
            for (final r in routers.take(4)) Padding(padding: const EdgeInsets.only(bottom: 10), child: RouterTile(toMap(r), onChanged: reload)),
            if (pending.isNotEmpty) ...[
              const SectionTitle('Pending payments'),
              for (final o in pending) Padding(padding: const EdgeInsets.only(bottom: 8), child: OrderTile(toMap(o), onChanged: reload)),
            ],
            SectionTitle('Recent sales', trailing: TextButton(onPressed: () => onTab(3), child: const Text('All'))),
            if (recent.isEmpty) const EmptyView('No mobile money sales yet.', icon: Icons.receipt_long_outlined),
            for (final o in recent)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: GlowCard(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  glow: C.green,
                  child: Row(children: [
                    const Icon(Icons.check_circle, color: C.green),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(toStr(o['package_name'], 'Package'), style: const TextStyle(fontWeight: FontWeight.w700)),
                        Text('${toStr(o['phone'])} • ${fmtDate(o['paid_at'])}', style: const TextStyle(color: C.muted, fontSize: 12.5)),
                      ]),
                    ),
                    Text(money(o['amount']), style: const TextStyle(fontWeight: FontWeight.w800)),
                  ]),
                ),
              ),
          ];
        },
      );

  static Widget _mini(String k, String v) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(k, style: const TextStyle(color: Color(0xFFA5B4FC), fontSize: 11.5)),
        const SizedBox(height: 2),
        FittedBox(fit: BoxFit.scaleDown, child: Text(v, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14))),
      ]);

  static Widget _kpi(String k, String v) => Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
        Text(k, style: const TextStyle(color: C.muted, fontSize: 12)),
        Text(v, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
      ]);

  static Widget _quick(BuildContext ctx, IconData i, String t, Color c, VoidCallback f) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: GlowCard(
            glow: c,
            onTap: f,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
            child: Column(children: [
              Icon(i, color: c),
              const SizedBox(height: 6),
              Text(t, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700)),
            ]),
          ),
        ),
      );
}

// =====================================================================
// MORE
// =====================================================================
class MoreTab extends StatelessWidget {
  const MoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <(IconData, String, Color, Widget)>[
      (Icons.router_outlined, 'Routers', C.cyan, const RoutersScreen()),
      (Icons.sell_outlined, 'Packages', C.brand2, const PackagesScreen()),
      (Icons.wifi, 'WiFi names', C.brand, const WifiNamesScreen()),
      (Icons.map_outlined, 'Map', C.green, const MapScreen()),
      (Icons.contacts_outlined, 'Customers', C.cyan, const CustomersScreen()),
      (Icons.insights_outlined, 'Insights', C.amber, const InsightsScreen()),
      (Icons.emoji_events_outlined, 'Top sellers', C.amber, const TopSellersScreen()),
      (Icons.bar_chart_rounded, 'Reports', C.brand, const ReportsScreen()),
      (Icons.sms_outlined, 'SMS', C.green, const SmsScreen()),
      (Icons.percent, 'Commission', C.brand2, const CommissionScreen()),
      (Icons.payments_outlined, 'Withdraw', C.green, const WithdrawScreen()),
      (Icons.chat_bubble_outline, 'Messages', C.cyan, const ChatScreen()),
      (Icons.notifications_none, 'Notifications', C.amber, const NotificationsScreen()),
      (Icons.manage_accounts_outlined, 'Profile & settings', C.brand, const ProfileScreen()),
      if (Session.isAdmin) (Icons.admin_panel_settings_outlined, 'Administrator', C.red, const AdminScreen()),
    ];
    return ListView(padding: const EdgeInsets.fromLTRB(16, 8, 16, 100), children: [
      GlowCard(
        onTap: () => push(context, const ProfileScreen()),
        child: Row(children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: C.brand.withValues(alpha: .25),
            child: Text(Session.name.isEmpty ? '?' : Session.name[0].toUpperCase(), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: C.text)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(Session.name, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
              Text('@${toStr(Session.me['username'])} • ${Session.isAdmin ? 'Administrator' : 'Seller'}', style: const TextStyle(color: C.muted, fontSize: 12.5)),
            ]),
          ),
          const Icon(Icons.chevron_right, color: C.muted),
        ]),
      ),
      const SizedBox(height: 14),
      GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.0,
        children: [
          for (final it in items)
            GlowCard(
              glow: it.$3,
              padding: const EdgeInsets.all(8),
              onTap: () => push(context, it.$4),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: it.$3.withValues(alpha: .15), borderRadius: BorderRadius.circular(14)),
                  child: Icon(it.$1, color: it.$3, size: 24),
                ),
                const SizedBox(height: 8),
                Text(it.$2, textAlign: TextAlign.center, maxLines: 2, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              ]),
            ),
        ],
      ),
      const SizedBox(height: 18),
      OutlinedButton.icon(
        onPressed: () async {
          if (!await confirm(context, 'Sign out', 'Sign out of SKY WIFI on this phone?', ok: 'Sign out')) return;
          try {
            await Api.I.post('auth/logout');
          } catch (_) {}
          await Api.I.saveToken(null);
          goTo(const LoginScreen());
        },
        icon: const Icon(Icons.logout, color: C.red),
        label: const Text('Sign out'),
      ),
      const SizedBox(height: 10),
      const Center(child: Text('SKY WIFI TANZANIA • app 1.0', style: TextStyle(color: C.muted, fontSize: 12))),
    ]);
  }
}
