// SKY WIFI TANZANIA — seller app (Flutter). Talks to api.php on the website.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'api.dart';
import 'screens/auth.dart';
import 'screens/home.dart';
import 'screens/money.dart';
import 'ui.dart';

final navKey = GlobalKey<NavigatorState>();

/// The signed-in user (GET me) — refreshed on start and after important actions.
class Session {
  static Map<String, dynamic> me = {};
  static bool get isAdmin => me['is_admin'] == true;
  static String get name => toStr(me['full_name'], toStr(me['username']));
  static Future<Map<String, dynamic>> refresh() async {
    me = await Api.I.getMap('me');
    currency = toStr(me['currency'], 'TZS');
    return me;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeCtl.load();
  await Api.I.init();
  Api.I.onUnauthorized = () => goTo(const LoginScreen());
  Api.I.onLocked = (home) {
    if (!LockedScreen.open) goTo(const LockedScreen());
  };
  runApp(const SkyApp());
}

/// Replace the whole screen stack (sign-in, home, locked).
void goTo(Widget w) {
  navKey.currentState?.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => w), (_) => false);
}

class SkyApp extends StatelessWidget {
  const SkyApp({super.key});
  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
        valueListenable: ThemeCtl.mode,
        builder: (_, dark, __) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: dark ? Brightness.light : Brightness.dark,
            systemNavigationBarColor: C.bg,
            systemNavigationBarIconBrightness: dark ? Brightness.light : Brightness.dark,
          ));
          return MaterialApp(
            title: 'SKY WIFI',
            debugShowCheckedModeBanner: false,
            navigatorKey: navKey,
            theme: skyTheme(),
            home: const BootScreen(),
          );
        },
      );
}

/// Splash: signed in? → home (or the locked screen); else → sign-in.
class BootScreen extends StatefulWidget {
  const BootScreen({super.key});
  @override
  State<BootScreen> createState() => _BootScreenState();
}

class _BootScreenState extends State<BootScreen> {
  Object? _err;

  @override
  void initState() {
    super.initState();
    _start();
  }

  Future<void> _start() async {
    setState(() => _err = null);
    if (Api.I.token == null) {
      await Future<void>.delayed(const Duration(milliseconds: 700));
      goTo(const LoginScreen());
      return;
    }
    try {
      final me = await Session.refresh();
      enterApp(me);
    } on ApiException catch (e) {
      if (e.isAuth || e.isLocked) return; // handled by Api callbacks
      setState(() => _err = e);
    } catch (e) {
      setState(() => _err = e);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const LogoMark(size: 96),
            const SizedBox(height: 22),
            const Text('SKY WIFI TANZANIA', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: .5)),
            const SizedBox(height: 6),
            Text('WiFi Seller Platform', style: TextStyle(color: C.muted)),
            const SizedBox(height: 30),
            if (_err == null)
              const SizedBox(width: 28, height: 28, child: CircularProgressIndicator(strokeWidth: 2.6, color: C.brand))
            else ...[
              Padding(padding: const EdgeInsets.symmetric(horizontal: 32), child: Text('$_err', textAlign: TextAlign.center)),
              const SizedBox(height: 14),
              FilledButton.icon(onPressed: _start, icon: const Icon(Icons.refresh), label: const Text('Try again')),
              TextButton(
                onPressed: () async {
                  await Api.I.saveToken(null);
                  goTo(const LoginScreen());
                },
                child: const Text('Sign in again'),
              ),
            ],
          ]),
        ),
      );
}

/// After sign-in / start: the locked screen for a restricted seller, otherwise the app.
void enterApp(Map<String, dynamic> me) {
  if (me['restricted'] == true) {
    goTo(const LockedScreen());
  } else {
    goTo(const HomeShell());
  }
}
