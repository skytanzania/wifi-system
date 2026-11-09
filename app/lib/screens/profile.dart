// Profile, password, notifications settings, captive portal message, signed-in devices
import 'package:flutter/material.dart';

import '../api.dart';
import '../main.dart';
import '../ui.dart';
import 'auth.dart';
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
  final _announce = TextEditingController();
  bool _sms = true;
  bool _mail = true;

  Future<Map<String, dynamic>> _load() async {
    final me = await Session.refresh();
    final s = await Api.I.getMap('settings');
    final dev = await Api.I.getList('auth/sessions');
    _name.text = toStr(me['full_name']);
    _email.text = toStr(me['email']);
    _phone.text = toStr(me['phone']);
    _announce.text = toStr(s['portal_announce']);
    _sms = s['sms_enabled'] == true;
    _mail = s['email_enabled'] == true;
    return {'me': me, 'settings': s, 'devices': dev};
  }

  Future<void> _password() async {
    final cur = TextEditingController();
    final nw = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Change password'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Field(cur, 'Current password', obscure: true),
          Field(nw, 'New password (at least 6)', obscure: true),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Change')),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    await runAction(context, 'profile/password', {'current': cur.text, 'new': nw.text});
    _k.currentState?.reload();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Profile & settings')),
        body: AsyncPage<Map<String, dynamic>>(
          key: _k,
          load: _load,
          build: (ctx, d, reload) {
            final me = toMap(d['me']);
            final s = toMap(d['settings']);
            final devs = toList(d['devices']).map(toMap).toList();
            return [
              GlowCard(
                child: Row(children: [
                  const LogoMark(size: 50),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(toStr(me['full_name']), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17)),
                      Text('@${toStr(me['username'])} • ${me['is_admin'] == true ? 'Administrator' : 'Seller'}', style: const TextStyle(color: C.muted)),
                      Text('Member since ${fmtDate(me['created_at'], time: false)}', style: const TextStyle(color: C.muted, fontSize: 12)),
                    ]),
                  ),
                ]),
              ),
              const SectionTitle('My details'),
              Field(_name, 'Full name', icon: Icons.badge_outlined),
              Field(_email, 'E-mail', icon: Icons.mail_outline, keyboard: TextInputType.emailAddress),
              Field(_phone, 'Phone', icon: Icons.phone_android, keyboard: TextInputType.phone),
              Row(children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () async {
                      await runAction(ctx, 'profile/update', {'full_name': _name.text.trim(), 'email': _email.text.trim(), 'phone': _phone.text.trim()});
                      reload();
                    },
                    child: const Text('Save details'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(child: OutlinedButton.icon(onPressed: _password, icon: const Icon(Icons.key), label: const Text('Password'))),
              ]),
              const SectionTitle('Notifications to me'),
              GlowCard(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(children: [
                  SwitchListTile(
                    value: _sms,
                    title: const Text('SMS notifications'),
                    onChanged: (v) async {
                      setState(() => _sms = v);
                      await runAction(ctx, 'settings/prefs', {'sms_enabled': v, 'email_enabled': _mail}, popupOnlyOnError: true);
                    },
                  ),
                  SwitchListTile(
                    value: _mail,
                    title: const Text('E-mail notifications'),
                    onChanged: (v) async {
                      setState(() => _mail = v);
                      await runAction(ctx, 'settings/prefs', {'sms_enabled': _sms, 'email_enabled': v}, popupOnlyOnError: true);
                    },
                  ),
                ]),
              ),
              const SectionTitle('Message on my captive portal'),
              Field(_announce, 'Shown to customers on the WiFi login page (max 300)', maxLines: 3),
              FilledButton.icon(
                onPressed: () => runAction(ctx, 'settings/announce', {'announce': _announce.text.trim()}),
                icon: const Icon(Icons.campaign_outlined),
                label: const Text('Save message'),
              ),
              const SizedBox(height: 8),
              KV('Portal address', toStr(s['portal_url']), copy: true),
              SectionTitle('Signed-in phones', trailing: TextButton(
                onPressed: () async {
                  if (!await confirm(ctx, 'Sign out everywhere', 'Sign out on every phone, including this one?', ok: 'Sign out all', danger: true)) return;
                  try {
                    await Api.I.post('auth/logout_all');
                  } catch (_) {}
                  await Api.I.saveToken(null);
                  goTo(const LoginScreen());
                },
                child: const Text('Sign out all'),
              )),
              for (final t in devs)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.phone_android, color: t['current'] == true ? C.green : C.muted),
                  title: Text('${toStr(t['name'])}${t['current'] == true ? ' (this phone)' : ''}'),
                  subtitle: Text('Last used ${fmtDate(t['last_used_at'])} • ${toStr(t['ip'])}'),
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
              const SectionTitle('About'),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.privacy_tip_outlined),
                title: const Text('Privacy Policy'),
                onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => const PrivacyScreen())),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.language),
                title: const Text('Open the website'),
                subtitle: Text(Api.I.base.replaceAll('/api.php', '')),
                onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => WebPage(title: 'SKY WIFI', url: Api.I.base.replaceAll('/api.php', '/index.php')))),
              ),
            ];
          },
        ),
      );
}
