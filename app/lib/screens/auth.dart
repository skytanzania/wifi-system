// Sign in, create account, forgot password
import 'package:flutter/material.dart';

import '../api.dart';
import '../main.dart';
import '../ui.dart';

Future<String> deviceName() async => 'SKY WIFI app (Android)';

class AuthFrame extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;
  final VoidCallback? onLogoLongPress;
  const AuthFrame({super.key, required this.title, required this.subtitle, required this.children, this.onLogoLongPress});
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(center: Alignment(-.8, -1), radius: 1.4, colors: [Color(0xFF14204A), C.bg]),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(22),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 440),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    Center(child: GestureDetector(onLongPress: onLogoLongPress, child: const LogoMark(size: 78))),
                    const SizedBox(height: 18),
                    Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 6),
                    Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(color: C.muted)),
                    const SizedBox(height: 26),
                    GlowCard(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children)),
                  ]),
                ),
              ),
            ),
          ),
        ),
      );
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _u = TextEditingController();
  final _p = TextEditingController();
  bool _busy = false;
  bool _show = false;
  bool _regOpen = true;

  @override
  void initState() {
    super.initState();
    Api.I.getMap('info').then((i) {
      if (mounted) setState(() => _regOpen = i['registration_open'] != false);
    }).catchError((_) {});
  }

  Future<void> _login() async {
    if (_u.text.trim().isEmpty || _p.text.isEmpty) {
      showMessage(context, 'Enter your username (or phone / e-mail) and password.', type: 'warning');
      return;
    }
    setState(() => _busy = true);
    try {
      final d = await Api.I.postData('auth/login', {'username': _u.text.trim(), 'password': _p.text, 'device_name': await deviceName(), 'platform': 'android'});
      await Api.I.saveToken(toStr(d['token']));
      final me = await Session.refresh();
      enterApp(me);
    } catch (e) {
      if (mounted) showError(context, e);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _server() async {
    final v = await askText(context, 'Server address', label: 'api.php address', initial: Api.I.base, keyboard: TextInputType.url, ok: 'Save');
    if (v == null) return;
    await Api.I.setBase(v.isEmpty ? kDefaultApi : v);
    if (mounted) showMessage(context, 'Server: ${Api.I.base}', type: 'info');
  }

  @override
  Widget build(BuildContext context) => AuthFrame(
        title: 'SKY WIFI TANZANIA',
        subtitle: 'Sign in to manage your WiFi hotspot business',
        onLogoLongPress: _server,
        children: [
          Field(_u, 'Username, phone or e-mail', icon: Icons.person_outline, keyboard: TextInputType.emailAddress),
          TextField(
            controller: _p,
            obscureText: !_show,
            onSubmitted: (_) => _login(),
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: const Icon(Icons.lock_outline, size: 20),
              suffixIcon: IconButton(icon: Icon(_show ? Icons.visibility_off : Icons.visibility), onPressed: () => setState(() => _show = !_show)),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgotScreen())),
              child: const Text('Forgot password?'),
            ),
          ),
          FilledButton(
            onPressed: _busy ? null : _login,
            child: _busy ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white)) : const Text('Sign in'),
          ),
          if (_regOpen) ...[
            const SizedBox(height: 14),
            OutlinedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterScreen())),
              child: const Text('Create a seller account'),
            ),
          ],
        ],
      );
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _name = TextEditingController();
  final _user = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _pass = TextEditingController();
  bool _agree = false;
  bool _busy = false;

  Future<void> _go() async {
    if (!_agree) {
      showMessage(context, 'Please read and accept the Privacy Policy first.', type: 'warning');
      return;
    }
    setState(() => _busy = true);
    try {
      final d = await Api.I.postData('auth/register', {
        'full_name': _name.text.trim(),
        'username': _user.text.trim(),
        'email': _email.text.trim(),
        'phone': _phone.text.trim(),
        'password': _pass.text,
        'privacy_accept': true,
        'device_name': await deviceName(),
        'platform': 'android',
      });
      await Api.I.saveToken(toStr(d['token']));
      final me = await Session.refresh();
      enterApp(me);
    } catch (e) {
      if (mounted) showError(context, e);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => AuthFrame(
        title: 'Create account',
        subtitle: 'Start selling WiFi with your own routers',
        children: [
          Field(_name, 'Full name', icon: Icons.badge_outlined),
          Field(_user, 'Username', icon: Icons.person_outline),
          Field(_email, 'E-mail', icon: Icons.mail_outline, keyboard: TextInputType.emailAddress),
          Field(_phone, 'Phone (07XXXXXXXX)', icon: Icons.phone_android, keyboard: TextInputType.phone),
          Field(_pass, 'Password (at least 6 characters)', icon: Icons.lock_outline, obscure: true),
          Row(children: [
            Checkbox(value: _agree, onChanged: (v) => setState(() => _agree = v == true)),
            Expanded(
              child: Wrap(children: [
                const Text('I have read and accept the '),
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PrivacyScreen())),
                  child: const Text('Privacy Policy', style: TextStyle(color: C.cyan, fontWeight: FontWeight.w700, decoration: TextDecoration.underline)),
                ),
              ]),
            ),
          ]),
          const SizedBox(height: 10),
          FilledButton(
            onPressed: _busy ? null : _go,
            child: _busy ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white)) : const Text('Create account'),
          ),
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('I already have an account')),
        ],
      );
}

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});
  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final _who = TextEditingController();
  bool _busy = false;

  Future<void> _go() async {
    if (_who.text.trim().isEmpty) return;
    setState(() => _busy = true);
    try {
      final d = await Api.I.postData('auth/forgot', {'who': _who.text.trim()});
      if (mounted) {
        await showMessage(context, toStr(d['message'], 'Check your e-mail for the reset link.'));
        if (mounted) Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) showError(context, e);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => AuthFrame(
        title: 'Forgot password',
        subtitle: 'We will send a reset link to your e-mail and phone',
        children: [
          Field(_who, 'Username, phone or e-mail', icon: Icons.person_search_outlined),
          FilledButton(onPressed: _busy ? null : _go, child: const Text('Send reset link')),
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Back to sign in')),
        ],
      );
}

class PrivacyScreen extends StatelessWidget {
  final bool askAccept;
  const PrivacyScreen({super.key, this.askAccept = false});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Privacy Policy')),
        body: AsyncPage<Map<String, dynamic>>(
          load: () => Api.I.getMap('privacy'),
          build: (ctx, d, reload) => [
            Text('Version ${toStr(d['version'])}', style: const TextStyle(color: C.muted)),
            const SizedBox(height: 12),
            SelectableText(toStr(d['text']), style: const TextStyle(height: 1.5)),
            if (askAccept) ...[
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () async {
                  final r = await runAction(ctx, 'privacy/accept', {});
                  if (r != null && r.ok && ctx.mounted) {
                    await Session.refresh();
                    if (ctx.mounted) Navigator.pop(ctx);
                  }
                },
                child: const Text('I accept the Privacy Policy'),
              ),
            ],
          ],
        ),
      );
}
