import 'dart:async';
// Sign in, create account, forgot password
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../api.dart';
import '../main.dart';
import '../ui.dart';
import 'home.dart';

Future<String> deviceName() async => 'SKY WIFI app (Android)';

/// The website's sign-in look: dark background with a soft glow, one centred card, ◐ button top-right.
class AuthFrame extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;
  final VoidCallback? onLogoLongPress;
  const AuthFrame({super.key, required this.title, required this.subtitle, required this.children, this.onLogoLongPress});
  @override
  State<AuthFrame> createState() => _AuthFrameState();
}

class _AuthFrameState extends State<AuthFrame> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(-.9, -1.1),
              radius: 1.5,
              colors: C.dark ? [const Color(0xFF101A33), C.bg] : [const Color(0xFFE3EAFB), C.bg],
            ),
          ),
          child: SafeArea(
            child: Stack(children: [
              Positioned(
                right: 16,
                top: 12,
                child: IconBtn(FontAwesomeIcons.circleHalfStroke, tooltip: 'Dark / light', onTap: () async {
                  await ThemeCtl.toggle(context);
                  if (mounted) setState(() {});
                }),
              ),
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 64, 16, 24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(24, 26, 24, 24),
                      decoration: BoxDecoration(
                        color: C.card,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: C.line2),
                        boxShadow: [BoxShadow(color: C.dark ? const Color(0xD9000000) : const Color(0x4D101828), blurRadius: 60, spreadRadius: -26, offset: const Offset(0, 24))],
                      ),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                        Center(child: GestureDetector(onLongPress: widget.onLogoLongPress, child: const LogoMark(size: 66))),
                        const SizedBox(height: 18),
                        Text(widget.title, textAlign: TextAlign.center, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800, color: C.text)),
                        const SizedBox(height: 6),
                        Text(widget.subtitle, textAlign: TextAlign.center, style: TextStyle(color: C.muted, fontSize: 13)),
                        const SizedBox(height: 24),
                        ...widget.children,
                      ]),
                    ),
                  ),
                ),
              ),
            ]),
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
  bool _keep = true;
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
      await Api.I.saveToken(toStr(d['token']), persist: _keep);
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
        subtitle: 'WiFi Seller Platform • Omada EAP225 + RADIUS',
        onLogoLongPress: _server,
        children: [
          Field(_u, 'Username / Email / Phone', keyboard: TextInputType.emailAddress),
          Padding(padding: const EdgeInsets.only(bottom: 6, left: 2), child: Text('Password', style: TextStyle(color: C.text, fontWeight: FontWeight.w600, fontSize: 13.5))),
          TextField(
            controller: _p,
            obscureText: !_show,
            style: TextStyle(color: C.text),
            onSubmitted: (_) => _login(),
            decoration: InputDecoration(suffixIcon: IconButton(icon: Icon(_show ? Icons.visibility_off : Icons.visibility, color: C.muted), onPressed: () => setState(() => _show = !_show))),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => setState(() => _keep = !_keep),
            child: Row(children: [
              Checkbox(value: _keep, onChanged: (v) => setState(() => _keep = v == true), visualDensity: VisualDensity.compact),
              Text('Keep me logged in', style: TextStyle(color: C.body)),
            ]),
          ),
          const SizedBox(height: 14),
          GradButton(onPressed: _login, busy: _busy, icon: Icons.login_rounded, label: 'Login'),
          const SizedBox(height: 18),
          if (_regOpen)
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Don't have an account? ", style: TextStyle(color: C.muted)),
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterScreen())),
                child: const Text('Register', style: TextStyle(color: Color(0xFF7FA4FF), fontWeight: FontWeight.w600)),
              ),
            ]),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgotScreen())),
              child: const Row(children: [
                FaIcon(FontAwesomeIcons.key, size: 12, color: Color(0xFF7FA4FF)),
                SizedBox(width: 6),
                Text('Forgot password?', style: TextStyle(color: Color(0xFF7FA4FF))),
              ]),
            ),
            Text('  ·  ', style: TextStyle(color: C.muted)),
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PrivacyScreen())),
              child: Row(children: [
                FaIcon(FontAwesomeIcons.userShield, size: 12, color: C.muted),
                const SizedBox(width: 6),
                Text('Privacy Policy', style: TextStyle(color: C.muted)),
              ]),
            ),
          ]),
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
      // e-mail verification: the account is created only after the 6-digit code from the e-mail
      if (d['verify_required'] == true) {
        if (!mounted) return;
        showMessage(context, toStr(d['message'], 'Verification code sent.'), type: 'success');
        await Navigator.push(
            context, MaterialPageRoute(builder: (_) => VerifyEmailScreen(token: toStr(d['signup_token']), email: toStr(d['email']), resendIn: toInt(d['resend_in']))));
        return;
      }
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
          GradButton(onPressed: _go, busy: _busy, icon: Icons.person_add_alt_1, label: 'Create account'),
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('I already have an account')),
        ],
      );
}

/// Step 2 of registration: the 6-digit code from the e-mail. The account is created only when the code is correct.
class VerifyEmailScreen extends StatefulWidget {
  final String token;
  final String email;
  final int resendIn;
  const VerifyEmailScreen({super.key, required this.token, required this.email, this.resendIn = 60});
  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final _code = TextEditingController();
  bool _busy = false;
  int _wait = 0;
  Timer? _t;

  @override
  void initState() {
    super.initState();
    _startWait(widget.resendIn);
  }

  @override
  void dispose() {
    _t?.cancel();
    super.dispose();
  }

  void _startWait(int s) {
    _t?.cancel();
    setState(() => _wait = s);
    if (s <= 0) return;
    _t = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return t.cancel();
      setState(() => _wait--);
      if (_wait <= 0) t.cancel();
    });
  }

  Future<void> _verify() async {
    final c = _code.text.replaceAll(RegExp(r'\D'), '');
    if (c.length != 6) {
      showMessage(context, 'Enter the 6-digit code from the e-mail.', type: 'warning');
      return;
    }
    setState(() => _busy = true);
    try {
      final d = await Api.I.postData('auth/register/verify', {
        'signup_token': widget.token,
        'code': c,
        'device_name': await deviceName(),
        'platform': 'android',
      });
      await Api.I.saveToken(toStr(d['token']));
      final me = await Session.refresh();
      enterApp(me);
    } on ApiException catch (e) {
      if (!mounted) return;
      showMessage(context, e.message, type: 'error');
      if (e.code == 'signup_expired') Navigator.pop(context);
    } catch (e) {
      if (mounted) showError(context, e);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _resend() async {
    try {
      final d = await Api.I.postData('auth/register/resend', {'signup_token': widget.token});
      if (!mounted) return;
      showMessage(context, toStr(d['message'], 'New code sent.'), type: 'success');
      _startWait(toInt(d['resend_in'], 60));
    } on ApiException catch (e) {
      if (!mounted) return;
      showMessage(context, e.message, type: 'error');
      if (e.code == 'signup_expired') Navigator.pop(context);
    } catch (e) {
      if (mounted) showError(context, e);
    }
  }

  @override
  Widget build(BuildContext context) => AuthFrame(
        title: 'Verify your e-mail',
        subtitle: 'Enter the 6-digit code we sent to ${widget.email}. Your account is created when the code is correct.',
        children: [
          TextField(
            controller: _code,
            autofocus: true,
            keyboardType: TextInputType.number,
            maxLength: 6,
            textAlign: TextAlign.center,
            autofillHints: const [AutofillHints.oneTimeCode],
            style: const TextStyle(fontFamily: kMono, fontSize: 28, fontWeight: FontWeight.w800, letterSpacing: 12),
            decoration: const InputDecoration(counterText: '', hintText: '••••••'),
            onSubmitted: (_) => _verify(),
          ),
          const SizedBox(height: 14),
          GradButton(onPressed: _verify, busy: _busy, icon: Icons.verified_outlined, label: 'Verify & create account'),
          const SizedBox(height: 6),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextButton.icon(
              onPressed: _wait > 0 ? null : _resend,
              icon: const Icon(Icons.refresh, size: 18),
              label: Text(_wait > 0 ? 'New code (${_wait}s)' : 'Send a new code'),
            ),
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Change details')),
          ]),
          Text('No e-mail? Check Spam / Promotions. The code is valid for 15 minutes.', textAlign: TextAlign.center, style: TextStyle(color: C.muted, fontSize: 12)),
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
          GradButton(onPressed: _go, busy: _busy, icon: Icons.mark_email_read_outlined, label: 'Send reset link'),
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Back to sign in')),
        ],
      );
}

class PrivacyScreen extends StatelessWidget {
  final bool askAccept;
  const PrivacyScreen({super.key, this.askAccept = false});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: skyBar('Privacy Policy'),
        body: AsyncPage<Map<String, dynamic>>(
          skeleton: const SkeletonDetail(),
          load: () => Api.I.getMap('privacy'),
          build: (ctx, d, reload) => [
            Text('Version ${toStr(d['version'])}', style: TextStyle(color: C.muted)),
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
