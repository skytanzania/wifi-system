// Profile (details, password) and Settings (notifications, captive-portal message, dark / light, signed-in phones)
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../api.dart';
import '../main.dart';
import '../ui.dart';
import 'auth.dart';
import 'home.dart';
import 'webview.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _k = GlobalKey<AsyncPageState<Map<String, dynamic>>>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _cur = TextEditingController();
  final _new = TextEditingController();

  Future<Map<String, dynamic>> _load() async {
    final me = await Session.refresh();
    _name.text = toStr(me['full_name']);
    _email.text = toStr(me['email']);
    _phone.text = toStr(me['phone']);
    return me;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: skyBar('Profile'),
        body: AsyncPage<Map<String, dynamic>>(
          key: _k,
          skeleton: const SkeletonDetail(),
          load: _load,
          build: (ctx, me, reload) => [
            GlowCard(
              child: Row(children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(gradient: C.grad, borderRadius: BorderRadius.circular(16)),
                  child: Center(child: Text(Session.name.isEmpty ? '?' : Session.name[0].toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900))),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(toStr(me['full_name']), style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17, color: C.text)),
                    Text('@${toStr(me['username'])} • ${me['is_admin'] == true ? 'Administrator' : 'Seller'}', style: TextStyle(color: C.muted)),
                    Text('Member since ${fmtDate(me['created_at'], time: false)} • balance ${money(me['balance'])}', style: TextStyle(color: C.muted, fontSize: 12)),
                  ]),
                ),
              ]),
            ),
            const SizedBox(height: 14),
            WebCard(
              title: 'My details',
              icon: FontAwesomeIcons.user,
              child: Column(children: [
                Field(_name, 'Full name'),
                Field(_email, 'E-mail', keyboard: TextInputType.emailAddress),
                Field(_phone, 'Phone', keyboard: TextInputType.phone),
                GradButton(
                  onPressed: () async {
                    await runAction(ctx, 'profile/update', {'full_name': _name.text.trim(), 'email': _email.text.trim(), 'phone': _phone.text.trim()});
                    reload();
                  },
                  icon: Icons.save_outlined,
                  label: 'Save',
                ),
              ]),
            ),
            WebCard(
              title: 'Change password',
              icon: FontAwesomeIcons.key,
              child: Column(children: [
                Field(_cur, 'Current password', obscure: true),
                Field(_new, 'New password (at least 6 characters)', obscure: true),
                GradButton(
                  onPressed: () async {
                    final r = await runAction(ctx, 'profile/password', {'current': _cur.text, 'new': _new.text});
                    if (r != null && r.ok) {
                      _cur.clear();
                      _new.clear();
                    }
                  },
                  icon: Icons.lock_reset,
                  label: 'Change password',
                ),
                const SizedBox(height: 6),
                Text('Other phones signed in to your account are signed out when the password changes.', style: TextStyle(color: C.muted, fontSize: 12)),
              ]),
            ),
          ],
        ),
      );
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _k = GlobalKey<AsyncPageState<Map<String, dynamic>>>();
  final _announce = TextEditingController();
  bool _sms = true;
  bool _mail = true;

  Future<Map<String, dynamic>> _load() async {
    final s = await Api.I.getMap('settings');
    final dev = await Api.I.getList('auth/sessions');
    _announce.text = toStr(s['portal_announce']);
    _sms = s['sms_enabled'] == true;
    _mail = s['email_enabled'] == true;
    return {'settings': s, 'devices': dev};
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: skyBar('Settings'),
        body: AsyncPage<Map<String, dynamic>>(
          key: _k,
          skeleton: const SkeletonDetail(),
          load: _load,
          build: (ctx, d, reload) {
            final s = toMap(d['settings']);
            final devs = toList(d['devices']).map(toMap).toList();
            return [
              WebCard(
                title: 'Appearance',
                icon: FontAwesomeIcons.circleHalfStroke,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                child: SwitchListTile(
                  value: C.dark,
                  title: Text('Dark mode', style: TextStyle(color: C.text, fontWeight: FontWeight.w600)),
                  subtitle: Text('Same as the ◐ button on the website', style: TextStyle(color: C.muted, fontSize: 12)),
                  onChanged: (_) async {
                    await ThemeCtl.toggle(ctx);
                    setState(() {});
                  },
                ),
              ),
              WebCard(
                title: 'Notifications to me',
                icon: FontAwesomeIcons.bell,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                child: Column(children: [
                  SwitchListTile(
                    value: _sms,
                    title: Text('SMS notifications', style: TextStyle(color: C.text, fontWeight: FontWeight.w600)),
                    onChanged: (v) async {
                      setState(() => _sms = v);
                      await runAction(ctx, 'settings/prefs', {'sms_enabled': v, 'email_enabled': _mail}, popupOnlyOnError: true);
                    },
                  ),
                  SwitchListTile(
                    value: _mail,
                    title: Text('E-mail notifications', style: TextStyle(color: C.text, fontWeight: FontWeight.w600)),
                    onChanged: (v) async {
                      setState(() => _mail = v);
                      await runAction(ctx, 'settings/prefs', {'sms_enabled': _sms, 'email_enabled': v}, popupOnlyOnError: true);
                    },
                  ),
                ]),
              ),
              WebCard(
                title: 'Message on my captive portal',
                icon: FontAwesomeIcons.bullhorn,
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  Field(_announce, 'Shown to customers on the WiFi login page (max 300)', maxLines: 3),
                  GradButton(onPressed: () => runAction(ctx, 'settings/announce', {'announce': _announce.text.trim()}), icon: Icons.campaign_outlined, label: 'Save message'),
                  const SizedBox(height: 8),
                  KV('Portal address', toStr(s['portal_url']), copy: true),
                ]),
              ),
              WebCard(
                title: 'Signed-in phones',
                icon: FontAwesomeIcons.mobileScreen,
                trailing: TextButton(
                  onPressed: () async {
                    if (!await confirm(ctx, 'Sign out everywhere', 'Sign out on every phone, including this one?', ok: 'Sign out all', danger: true)) return;
                    try {
                      await Api.I.post('auth/logout_all');
                    } catch (_) {}
                    await Api.I.saveToken(null);
                    goTo(const LoginScreen());
                  },
                  child: const Text('Sign out all'),
                ),
                padding: const EdgeInsets.fromLTRB(10, 4, 4, 4),
                child: Column(children: [
                  for (final t in devs)
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                      leading: Icon(Icons.phone_android, color: t['current'] == true ? C.green : C.muted),
                      title: Text('${toStr(t['name'])}${t['current'] == true ? ' (this phone)' : ''}', style: TextStyle(color: C.text, fontWeight: FontWeight.w600)),
                      subtitle: Text('Last used ${fmtDate(t['last_used_at'])} • ${toStr(t['ip'])}', style: TextStyle(color: C.muted, fontSize: 12)),
                      trailing: t['current'] == true
                          ? null
                          : IconButton(
                              icon: const Icon(Icons.logout, color: C.red),
                              onPressed: () async {
                                await runAction(ctx, 'auth/revoke', {'id': t['id']}, popup: false);
                                reload();
                              },
                            ),
                    ),
                ]),
              ),
              WebCard(
                title: 'About',
                icon: FontAwesomeIcons.circleInfo,
                padding: const EdgeInsets.fromLTRB(6, 2, 6, 2),
                child: Column(children: [
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.userShield, size: 18),
                    title: Text('Privacy Policy', style: TextStyle(color: C.text)),
                    onTap: () => push(ctx, const PrivacyScreen()),
                  ),
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.globe, size: 18),
                    title: Text('Open the website', style: TextStyle(color: C.text)),
                    subtitle: Text(Api.I.base.replaceAll(RegExp(r'/api(\.php)?$'), ''), style: TextStyle(color: C.muted, fontSize: 12)),
                    onTap: () => push(ctx, WebPage(title: 'SKY WIFI', url: Api.I.base.replaceAll(RegExp(r'/api(\.php)?$'), '/index.php'))),
                  ),
                  ListTile(title: Text('SKY WIFI TANZANIA app 1.1', style: TextStyle(color: C.muted, fontSize: 12.5))),
                ]),
              ),
            ];
          },
        ),
      );
}
