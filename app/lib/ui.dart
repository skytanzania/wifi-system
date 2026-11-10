// SKY WIFI TANZANIA — theme (same tokens as the website), formatting, skeleton loading and shared widgets
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'api.dart';

// =====================================================================
// COLOURS — copied from the website (index.php, [data-bs-theme=dark] / [data-bs-theme=light])
// =====================================================================
class Pal {
  final Color bg, surface, surface2, surface3, line, line2, body, heading, muted, input, topbar, brandSoft;
  final bool dark;
  const Pal({
    required this.dark,
    required this.bg,
    required this.surface,
    required this.surface2,
    required this.surface3,
    required this.line,
    required this.line2,
    required this.body,
    required this.heading,
    required this.muted,
    required this.input,
    required this.topbar,
    required this.brandSoft,
  });
}

const darkPal = Pal(
  dark: true,
  bg: Color(0xFF060A13),
  surface: Color(0xFF0C1320),
  surface2: Color(0xFF101828),
  surface3: Color(0xFF162036),
  line: Color(0xFF19243A),
  line2: Color(0xFF25324D),
  body: Color(0xFFC4CFE0),
  heading: Color(0xFFF4F7FC),
  muted: Color(0xFF7D8BA3),
  input: Color(0xFF09101C),
  topbar: Color(0xF0060A13),
  brandSoft: Color(0x245B8CFF),
);

const lightPal = Pal(
  dark: false,
  bg: Color(0xFFF3F5FA),
  surface: Color(0xFFFFFFFF),
  surface2: Color(0xFFF7F9FC),
  surface3: Color(0xFFEEF2F8),
  line: Color(0xFFE4E9F2),
  line2: Color(0xFFD5DDEA),
  body: Color(0xFF3A4658),
  heading: Color(0xFF0E1726),
  muted: Color(0xFF6A778C),
  input: Color(0xFFFFFFFF),
  topbar: Color(0xF2FFFFFF),
  brandSoft: Color(0x1A3D6DF5),
);

class C {
  static Pal p = darkPal;
  // surfaces and text follow the dark / light mode
  static Color get bg => p.bg;
  static Color get card => p.surface;
  static Color get card2 => p.surface2;
  static Color get card3 => p.surface3;
  static Color get line => p.line;
  static Color get line2 => p.line2;
  static Color get text => p.heading;
  static Color get body => p.body;
  static Color get muted => p.muted;
  static Color get input => p.input;
  static Color get soft => p.brandSoft;
  static bool get dark => p.dark;
  // accents (the same in both modes)
  static const brand = Color(0xFF5B8CFF);
  static const brand2 = Color(0xFF8B5CF6);
  static const cyan = Color(0xFF22D3EE);
  static const green = Color(0xFF22C55E);
  static const red = Color(0xFFEF4444);
  static const amber = Color(0xFFF59E0B);
  static const grad = LinearGradient(colors: [Color(0xFF5B8CFF), Color(0xFF8B5CF6)], begin: Alignment.topLeft, end: Alignment.bottomRight);
  static const okGrad = LinearGradient(colors: [Color(0xFF15803D), Color(0xFF22C55E)], begin: Alignment.topLeft, end: Alignment.bottomRight);
}

/// The 6 gradient colours of the website's stat cards (.card.s1 … .s6).
const statGrads = <String, List<Color>>{
  's1': [Color(0xFF3B6CF6), Color(0xFF7C3AED)],
  's2': [Color(0xFF047857), Color(0xFF22C55E)],
  's3': [Color(0xFF0369A1), Color(0xFF06B6D4)],
  's4': [Color(0xFFC2410C), Color(0xFFF59E0B)],
  's5': [Color(0xFFBE123C), Color(0xFFF43F5E)],
  's6': [Color(0xFF4338CA), Color(0xFF0EA5E9)],
};

String statFor(Color c) {
  if (c == C.green) return 's2';
  if (c == C.cyan) return 's3';
  if (c == C.amber) return 's4';
  if (c == C.red) return 's5';
  if (c == C.brand2) return 's6';
  return 's1';
}

const kFont = 'Inter';
const kMono = 'JetBrainsMono';

TextStyle mono({double size = 14, FontWeight weight = FontWeight.w700, Color? color, double spacing = .6}) =>
    TextStyle(fontFamily: kMono, fontSize: size, fontWeight: weight, color: color ?? C.text, letterSpacing: spacing);

/// Dark / light mode, saved on the phone (the website's ◐ button).
class ThemeCtl {
  static final mode = ValueNotifier<bool>(true); // true = dark
  static Future<void> load() async {
    try {
      final p = await SharedPreferences.getInstance();
      mode.value = (p.getString('theme') ?? 'dark') != 'light';
    } catch (_) {}
    C.p = mode.value ? darkPal : lightPal;
  }

  static Future<void> toggle(BuildContext context) async {
    final dark = !mode.value;
    C.p = dark ? darkPal : lightPal; // colours first, then tell the app
    mode.value = dark;
    try {
      final p = await SharedPreferences.getInstance();
      await p.setString('theme', mode.value ? 'dark' : 'light');
    } catch (_) {}
    // every screen reads the colours when it builds: rebuild them all
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = context;
      if (ctx is Element && ctx.mounted) ctx.visitChildren(rebuild);
    });
  }
}

ThemeData skyTheme() {
  final dark = C.dark;
  final base = ThemeData(brightness: dark ? Brightness.dark : Brightness.light, useMaterial3: true, colorSchemeSeed: C.brand, fontFamily: kFont);
  final r12 = BorderRadius.circular(12);
  return base.copyWith(
    scaffoldBackgroundColor: C.bg,
    colorScheme: base.colorScheme.copyWith(primary: C.brand, secondary: C.cyan, surface: C.card, error: C.red, onSurface: C.text),
    textTheme: base.textTheme.apply(bodyColor: C.body, displayColor: C.text, fontFamily: kFont),
    appBarTheme: AppBarTheme(
      backgroundColor: C.bg,
      foregroundColor: C.text,
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(fontFamily: kFont, fontSize: 18, fontWeight: FontWeight.w800, color: C.text),
    ),
    cardTheme: CardThemeData(color: C.card, elevation: 0, margin: EdgeInsets.zero),
    dividerColor: C.line,
    dividerTheme: DividerThemeData(color: C.line, space: 1),
    drawerTheme: DrawerThemeData(backgroundColor: dark ? const Color(0xFF080D18) : Colors.white, width: 290),
    listTileTheme: ListTileThemeData(textColor: C.body, iconColor: C.muted),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: C.input,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
      hintStyle: TextStyle(color: C.muted),
      border: OutlineInputBorder(borderRadius: r12, borderSide: BorderSide(color: C.line2)),
      enabledBorder: OutlineInputBorder(borderRadius: r12, borderSide: BorderSide(color: C.line2)),
      focusedBorder: OutlineInputBorder(borderRadius: r12, borderSide: const BorderSide(color: C.brand, width: 1.4)),
      labelStyle: TextStyle(color: C.muted),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: C.brand,
        foregroundColor: Colors.white,
        minimumSize: const Size(64, 46),
        shape: RoundedRectangleBorder(borderRadius: r12),
        textStyle: const TextStyle(fontFamily: kFont, fontWeight: FontWeight.w700, fontSize: 15),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: C.text,
        minimumSize: const Size(44, 42),
        side: BorderSide(color: C.line2),
        shape: RoundedRectangleBorder(borderRadius: r12),
        textStyle: const TextStyle(fontFamily: kFont, fontWeight: FontWeight.w700),
      ),
    ),
    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: dark ? const Color(0xFF7FA4FF) : C.brand)),
    chipTheme: base.chipTheme.copyWith(
      backgroundColor: C.card,
      selectedColor: C.soft,
      side: BorderSide(color: C.line2),
      labelStyle: TextStyle(fontFamily: kFont, color: C.body, fontWeight: FontWeight.w600, fontSize: 13),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    tabBarTheme: TabBarThemeData(labelColor: C.brand, unselectedLabelColor: C.muted, indicatorColor: C.brand, dividerColor: C.line),
    dialogTheme: DialogThemeData(backgroundColor: C.card, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: C.card, showDragHandle: true),
    snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
    switchTheme: SwitchThemeData(thumbColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? Colors.white : null)),
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: C.brand),
  );
}

// =====================================================================
// FORMATTING
// =====================================================================
String currency = 'TZS';

String money(dynamic v) => '$currency ${thousands(toDouble(v).round())}';

String thousands(num n) {
  final neg = n < 0;
  final s = n.abs().round().toString();
  final b = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) b.write(',');
    b.write(s[i]);
  }
  return (neg ? '-' : '') + b.toString();
}

const _months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
const _days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

DateTime? parseDate(dynamic v) {
  final s = toStr(v);
  if (s.isEmpty) return null;
  return DateTime.tryParse(s.replaceFirst(' ', 'T'));
}

String two(int n) => n.toString().padLeft(2, '0');

/// "09 Nov 15:30" (this year) or "09 Nov 2025".
String fmtDate(dynamic v, {bool time = true}) {
  final d = parseDate(v);
  if (d == null) return '—';
  final now = DateTime.now();
  final day = '${two(d.day)} ${_months[d.month - 1]}';
  if (d.year != now.year) return '$day ${d.year}';
  return time ? '$day ${two(d.hour)}:${two(d.minute)}' : day;
}

/// "Tuesday, 10 Nov 2026" (the website's date under "Welcome back").
String longToday() {
  final d = DateTime.now();
  return '${_days[d.weekday - 1]}, ${two(d.day)} ${_months[d.month - 1]} ${d.year}';
}

String ago(dynamic v) {
  final d = parseDate(v);
  if (d == null) return 'never';
  final s = DateTime.now().difference(d).inSeconds;
  if (s < 60) return 'just now';
  if (s < 3600) return '${s ~/ 60} min ago';
  if (s < 86400) return '${s ~/ 3600} h ago';
  return '${s ~/ 86400} d ago';
}

String fmtSecs(dynamic v) {
  var s = toInt(v);
  if (s <= 0) return '0 min';
  final d = s ~/ 86400;
  s %= 86400;
  final h = s ~/ 3600;
  final m = (s % 3600) ~/ 60;
  if (d > 0) return '${d}d ${h}h';
  if (h > 0) return '${h}h ${m}m';
  return '${math.max(1, m)} min';
}

String fmtMinutes(dynamic v) {
  final m = toInt(v);
  if (m % 1440 == 0 && m >= 1440) return '${m ~/ 1440} day${m == 1440 ? '' : 's'}';
  if (m % 60 == 0 && m >= 60) return '${m ~/ 60} hour${m == 60 ? '' : 's'}';
  return '$m min';
}

String fmtBytes(dynamic v) {
  var b = toDouble(v);
  const u = ['B', 'KB', 'MB', 'GB', 'TB'];
  var i = 0;
  while (b >= 1024 && i < u.length - 1) {
    b /= 1024;
    i++;
  }
  return '${b.toStringAsFixed(b < 10 && i > 0 ? 1 : 0)} ${u[i]}';
}

String cap(String s) => s.isEmpty ? s : s[0].toUpperCase() + s.substring(1).replaceAll('_', ' ');

Color statusColor(String s) {
  switch (s) {
    case 'paid':
    case 'active':
    case 'completed':
    case 'delivered':
    case 'success':
    case 'available':
    case 'online':
    case 'connected':
    case 'done':
      return C.green;
    case 'pending':
    case 'processing':
    case 'sold':
    case 'unpaid':
    case 'queued':
    case 'sending':
    case 'sent':
    case 'info':
      return C.cyan;
    case 'warning':
    case 'expired':
    case 'exhausted':
    case 'overdue':
    case 'undelivered':
      return C.amber;
    case 'failed':
    case 'blocked':
    case 'rejected':
    case 'danger':
    case 'cancelled':
    case 'offline':
      return C.red;
    default:
      return C.muted;
  }
}

// =====================================================================
// SKELETON LOADING (grey blocks with a moving shine while data loads)
// =====================================================================
class Shimmer extends StatefulWidget {
  final Widget child;
  const Shimmer({super.key, required this.child});
  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1300))..repeat();
  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final base = C.dark ? const Color(0xFF141E31) : const Color(0xFFE6EBF3);
    final hi = C.dark ? const Color(0xFF22304B) : const Color(0xFFF6F8FC);
    return AnimatedBuilder(
      animation: _c,
      child: widget.child,
      builder: (_, child) {
        final t = _c.value * 3 - 1; // -1 … 2
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (r) => LinearGradient(
            begin: Alignment(-1 + t, -.3),
            end: Alignment(t, .3),
            colors: [base, hi, base],
            stops: const [.1, .5, .9],
          ).createShader(r),
          child: child,
        );
      },
    );
  }
}

/// One grey block.
class Skel extends StatelessWidget {
  final double? w;
  final double h;
  final double r;
  const Skel({super.key, this.w, this.h = 12, this.r = 8});
  @override
  Widget build(BuildContext context) => Container(
        width: w,
        height: h,
        decoration: BoxDecoration(color: C.dark ? const Color(0xFF141E31) : const Color(0xFFE6EBF3), borderRadius: BorderRadius.circular(r)),
      );
}

/// A card-shaped skeleton (title line, two text lines, a chip on the right).
class SkelCard extends StatelessWidget {
  final bool avatar;
  const SkelCard({super.key, this.avatar = true});
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: C.card, borderRadius: BorderRadius.circular(18), border: Border.all(color: C.line)),
        child: Row(children: [
          if (avatar) ...[const Skel(w: 44, h: 44, r: 12), const SizedBox(width: 12)],
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Skel(w: 160, h: 14),
              SizedBox(height: 8),
              Skel(h: 10),
              SizedBox(height: 6),
              Skel(w: 110, h: 10),
            ]),
          ),
          const SizedBox(width: 12),
          const Skel(w: 54, h: 22, r: 11),
        ]),
      );
}

class SkeletonList extends StatelessWidget {
  final int count;
  final bool avatar;
  final EdgeInsets padding;
  const SkeletonList({super.key, this.count = 7, this.avatar = true, this.padding = const EdgeInsets.fromLTRB(14, 10, 14, 20)});
  @override
  Widget build(BuildContext context) => Shimmer(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: padding,
          children: [for (var i = 0; i < count; i++) SkelCard(avatar: avatar)],
        ),
      );
}

/// Skeleton of the Home page: welcome lines, balance pill, the 2×2 + 1 stat cards, then cards.
class SkeletonDashboard extends StatelessWidget {
  const SkeletonDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    Widget stat() => Container(
          height: 116,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: C.card, borderRadius: BorderRadius.circular(22), border: Border.all(color: C.line)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Skel(w: 90, h: 9), SizedBox(height: 14), Skel(w: 110, h: 22), Spacer(), Skel(w: 70, h: 9)]),
        );
    return Shimmer(
      child: ListView(physics: const NeverScrollableScrollPhysics(), padding: const EdgeInsets.fromLTRB(12, 14, 12, 20), children: [
        const Skel(w: 230, h: 22),
        const SizedBox(height: 8),
        const Skel(w: 150, h: 11),
        const SizedBox(height: 16),
        const Skel(w: 250, h: 38, r: 10),
        const SizedBox(height: 16),
        Row(children: [Expanded(child: stat()), const SizedBox(width: 12), Expanded(child: stat())]),
        const SizedBox(height: 12),
        Row(children: [Expanded(child: stat()), const SizedBox(width: 12), Expanded(child: stat())]),
        const SizedBox(height: 12),
        stat(),
        const SizedBox(height: 12),
        const SkelCard(),
        const SkelCard(),
      ]),
    );
  }
}

/// Skeleton of a details page (big header card + key/value rows).
class SkeletonDetail extends StatelessWidget {
  const SkeletonDetail({super.key});
  @override
  Widget build(BuildContext context) => Shimmer(
        child: ListView(physics: const NeverScrollableScrollPhysics(), padding: const EdgeInsets.fromLTRB(14, 12, 14, 20), children: [
          Container(
            height: 150,
            decoration: BoxDecoration(color: C.card, borderRadius: BorderRadius.circular(18), border: Border.all(color: C.line)),
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Skel(w: 180, h: 18), SizedBox(height: 12), Skel(w: 120, h: 12), Spacer(), Skel(h: 40, r: 12)]),
          ),
          const SizedBox(height: 14),
          for (var i = 0; i < 8; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(children: const [Skel(w: 100, h: 11), SizedBox(width: 24), Expanded(child: Skel(h: 11))]),
            ),
        ]),
      );
}

// =====================================================================
// WIDGETS (styled like the website)
// =====================================================================

/// The website's WiFi logo (gradient square, white WiFi waves).
class LogoMark extends StatefulWidget {
  final double size;
  const LogoMark({super.key, this.size = 72});
  @override
  State<LogoMark> createState() => _LogoMarkState();
}

class _LogoMarkState extends State<LogoMark> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800))..repeat();
  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.size;
    return Container(
      width: s,
      height: s,
      decoration: BoxDecoration(
        gradient: C.grad,
        borderRadius: BorderRadius.circular(s * .28),
        boxShadow: [BoxShadow(color: C.brand.withValues(alpha: .45), blurRadius: s * .45, spreadRadius: -s * .1, offset: Offset(0, s * .12))],
      ),
      child: AnimatedBuilder(animation: _c, builder: (_, __) => CustomPaint(painter: _WifiPainter(_c.value))),
    );
  }
}

class _WifiPainter extends CustomPainter {
  final double t;
  _WifiPainter(this.t);
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final c = Offset(w / 2, w * .70);
    for (var i = 0; i < 3; i++) {
      final r = w * (.13 + i * .12);
      final phase = ((t * 3) - i).clamp(0.0, 1.0).toDouble();
      final op = (.55 + .45 * (phase > 0 && phase < 1 ? math.sin(phase * math.pi) : 0)).clamp(.55, 1.0).toDouble();
      final p = Paint()
        ..color = Colors.white.withValues(alpha: op)
        ..style = PaintingStyle.stroke
        ..strokeWidth = w * .07
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(Rect.fromCircle(center: c, radius: r), math.pi * 1.25, math.pi * .5, false, p);
    }
    canvas.drawCircle(c, w * .055, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(_WifiPainter o) => o.t != t;
}

/// A website card: surface colour, thin border, 18px corners (GlowCard keeps its old name).
class GlowCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? glow;
  final VoidCallback? onTap;
  final Gradient? gradient;
  const GlowCard({super.key, required this.child, this.padding = const EdgeInsets.all(16), this.glow, this.onTap, this.gradient});
  @override
  Widget build(BuildContext context) {
    final g = gradient;
    return Container(
      decoration: BoxDecoration(
        color: g == null ? C.card : null,
        gradient: g,
        borderRadius: BorderRadius.circular(18),
        border: g == null ? Border.all(color: C.line) : null,
        boxShadow: [
          if (g != null && glow != null) BoxShadow(color: glow!.withValues(alpha: .45), blurRadius: 28, spreadRadius: -10, offset: const Offset(0, 14)),
          if (g == null && C.dark) const BoxShadow(color: Color(0xBF000000), blurRadius: 32, spreadRadius: -18, offset: Offset(0, 12)),
          if (g == null && !C.dark) const BoxShadow(color: Color(0x14101828), blurRadius: 26, spreadRadius: -16, offset: Offset(0, 10)),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        clipBehavior: Clip.antiAlias,
        child: InkWell(onTap: onTap, child: Padding(padding: padding, child: child)),
      ),
    );
  }
}

/// A website card with a header line ("card-header": brand icon + title, optional right side).
class WebCard extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget? trailing;
  final Widget child;
  final EdgeInsetsGeometry padding;
  const WebCard({super.key, required this.title, this.icon, this.trailing, required this.child, this.padding = const EdgeInsets.all(16)});
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: C.card,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: C.line),
          boxShadow: [C.dark ? const BoxShadow(color: Color(0xBF000000), blurRadius: 32, spreadRadius: -18, offset: Offset(0, 12)) : const BoxShadow(color: Color(0x14101828), blurRadius: 26, spreadRadius: -16, offset: Offset(0, 10))],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 14, 12, 14),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: C.line))),
            child: Row(children: [
              if (icon != null) ...[FaIcon(icon, size: 15, color: C.brand), const SizedBox(width: 10)],
              Expanded(child: Text(title, style: TextStyle(fontWeight: FontWeight.w700, color: C.text, fontSize: 15))),
              if (trailing != null) trailing!,
            ]),
          ),
          Padding(padding: padding, child: child),
        ]),
      );
}

/// A website stat card (gradient, two light circles, uppercase label with icon, big amount).
class StatCard extends StatelessWidget {
  final String variant; // s1 … s6
  final IconData icon;
  final String label;
  final String value;
  final String? sub;
  final VoidCallback? onTap;
  final double minHeight;
  const StatCard({super.key, required this.variant, required this.icon, required this.label, required this.value, this.sub, this.onTap, this.minHeight = 118});
  @override
  Widget build(BuildContext context) {
    final g = statGrads[variant] ?? statGrads['s1']!;
    return Container(
      constraints: BoxConstraints(minHeight: minHeight),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: g, begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withValues(alpha: .12)),
        boxShadow: [BoxShadow(color: g.last.withValues(alpha: .45), blurRadius: 30, spreadRadius: -10, offset: const Offset(0, 12))],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(22),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Stack(children: [
            Positioned(right: -55, top: -70, child: _circle(160, .14)),
            Positioned(right: 34, bottom: -60, child: _circle(96, .08)),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  FaIcon(icon, size: 10.5, color: Colors.white.withValues(alpha: .9)),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(label.toUpperCase(),
                        maxLines: 2,
                        style: TextStyle(color: Colors.white.withValues(alpha: .9), fontSize: 10.5, fontWeight: FontWeight.w800, letterSpacing: 1.0, height: 1.25)),
                  ),
                ]),
                const SizedBox(height: 10),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.w800, letterSpacing: -.3, shadows: [Shadow(color: Color(0x40000000), blurRadius: 14, offset: Offset(0, 2))])),
                ),
                if (sub != null) ...[
                  const SizedBox(height: 10),
                  Text(sub!, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white.withValues(alpha: .88), fontSize: 11.5)),
                ],
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  static Widget _circle(double s, double a) =>
      Container(width: s, height: s, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withValues(alpha: a)));
}

/// Old name kept: a gradient stat card whose colour follows [color].
class StatTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final String? sub;
  final VoidCallback? onTap;
  const StatTile({super.key, required this.icon, required this.label, required this.value, this.color = C.brand, this.sub, this.onTap});
  @override
  Widget build(BuildContext context) => StatCard(variant: statFor(color), icon: icon, label: label, value: value, sub: sub, onTap: onTap, minHeight: 104);
}

class StatusChip extends StatelessWidget {
  final String status;
  final String? label;
  const StatusChip(this.status, {super.key, this.label});
  @override
  Widget build(BuildContext context) {
    final c = statusColor(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(color: c.withValues(alpha: .14), borderRadius: BorderRadius.circular(8), border: Border.all(color: c.withValues(alpha: .35))),
      child: Text(label ?? cap(status), style: TextStyle(color: c, fontSize: 11.5, fontWeight: FontWeight.w700)),
    );
  }
}

class Dot extends StatelessWidget {
  final bool on;
  const Dot(this.on, {super.key});
  @override
  Widget build(BuildContext context) => Container(
        width: 9,
        height: 9,
        decoration: BoxDecoration(
          color: on ? C.green : C.red,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: (on ? C.green : C.red).withValues(alpha: .6), blurRadius: 7)],
        ),
      );
}

class SectionTitle extends StatelessWidget {
  final String text;
  final Widget? trailing;
  const SectionTitle(this.text, {super.key, this.trailing});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(4, 16, 4, 10),
        child: Row(children: [
          Expanded(child: Text(text, style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w800, color: C.text))),
          if (trailing != null) trailing!,
        ]),
      );
}

class KV extends StatelessWidget {
  final String k;
  final String v;
  final bool copy;
  final bool mono;
  const KV(this.k, this.v, {super.key, this.copy = false, this.mono = false});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(width: 130, child: Text(k, style: TextStyle(color: C.muted, fontSize: 13))),
          Expanded(
            child: SelectableText(v.isEmpty ? '—' : v,
                style: TextStyle(color: C.text, fontSize: 13.5, fontWeight: FontWeight.w600, fontFamily: mono ? kMono : null)),
          ),
          if (copy && v.isNotEmpty)
            InkWell(
              onTap: () => copyText(context, v),
              child: Padding(padding: const EdgeInsets.only(left: 8), child: Icon(Icons.copy_rounded, size: 18, color: C.muted)),
            ),
        ]),
      );
}

class EmptyView extends StatelessWidget {
  final String text;
  final IconData icon;
  const EmptyView(this.text, {super.key, this.icon = Icons.inbox_outlined});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
        child: Column(children: [
          Icon(icon, size: 42, color: C.muted.withValues(alpha: .6)),
          const SizedBox(height: 10),
          Text(text, textAlign: TextAlign.center, style: TextStyle(color: C.muted)),
        ]),
      );
}

class ErrorView extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;
  const ErrorView(this.error, this.onRetry, {super.key});
  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Icon(Icons.cloud_off_rounded, size: 50, color: C.amber),
            const SizedBox(height: 14),
            Text('$error', textAlign: TextAlign.center, style: TextStyle(color: C.text)),
            const SizedBox(height: 18),
            GradButton(onPressed: onRetry, icon: Icons.refresh, label: 'Try again'),
          ]),
        ),
      );
}

/// Shown while something loads (kept for old code): a skeleton list.
const loader = SkeletonList(count: 5);

/// The website's main button: blue → purple gradient with a soft glow (green for "Generate" etc.).
class GradButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final IconData? icon;
  final bool green;
  final bool busy;
  final bool expand;
  const GradButton({super.key, required this.onPressed, required this.label, this.icon, this.green = false, this.busy = false, this.expand = true});
  @override
  Widget build(BuildContext context) {
    final g = green ? C.okGrad : C.grad;
    final off = onPressed == null || busy;
    final btn = Opacity(
      opacity: off ? .6 : 1,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          gradient: g,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: (green ? C.green : C.brand).withValues(alpha: .5), blurRadius: 22, spreadRadius: -10, offset: const Offset(0, 10))],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: off ? null : onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
                if (busy)
                  const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white))
                else ...[
                  if (icon != null) ...[Icon(icon, color: Colors.white, size: 18), const SizedBox(width: 8)],
                  Flexible(child: Text(label, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15))),
                ],
              ]),
            ),
          ),
        ),
      ),
    );
    return expand ? SizedBox(width: double.infinity, child: btn) : btn;
  }
}

/// Small square button with an icon (the website's .icon-btn).
class IconBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final Color? color;
  final String? tooltip;
  final int badge;
  const IconBtn(this.icon, {super.key, this.onTap, this.color, this.tooltip, this.badge = 0});
  @override
  Widget build(BuildContext context) {
    final b = Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: C.card, borderRadius: BorderRadius.circular(12), border: Border.all(color: C.line)),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: InkWell(onTap: onTap, child: Center(child: FaIcon(icon, size: 16, color: color ?? C.text))),
      ),
    );
    final w = badge > 0
        ? Stack(clipBehavior: Clip.none, children: [
            b,
            Positioned(
              right: -5,
              top: -5,
              child: Container(
                constraints: const BoxConstraints(minWidth: 18),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
                decoration: BoxDecoration(color: C.red, borderRadius: BorderRadius.circular(10), border: Border.all(color: C.bg, width: 2)),
                child: Text(badge > 99 ? '99+' : '$badge', textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800)),
              ),
            ),
          ])
        : b;
    return tooltip == null ? w : Tooltip(message: tooltip!, child: w);
  }
}

/// Loads data once (and on pull-to-refresh) and builds a scrollable page from it. Shows a skeleton while loading.
class AsyncPage<T> extends StatefulWidget {
  final Future<T> Function() load;
  final List<Widget> Function(BuildContext context, T data, Future<void> Function() reload) build;
  final EdgeInsets padding;
  final Widget? skeleton;
  const AsyncPage({super.key, required this.load, required this.build, this.padding = const EdgeInsets.fromLTRB(14, 10, 14, 110), this.skeleton});
  @override
  State<AsyncPage<T>> createState() => AsyncPageState<T>();
}

class AsyncPageState<T> extends State<AsyncPage<T>> {
  T? _data;
  Object? _err;
  bool _busy = true;

  @override
  void initState() {
    super.initState();
    reload();
  }

  Future<void> reload() async {
    setState(() => _busy = _data == null);
    try {
      final d = await widget.load();
      if (!mounted) return;
      setState(() {
        _data = d;
        _err = null;
        _busy = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _err = e;
        _busy = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_busy && _data == null) return widget.skeleton ?? const SkeletonList();
    if (_data == null) return ErrorView(_err ?? 'Error', reload);
    return RefreshIndicator(
      onRefresh: reload,
      color: C.brand,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: widget.padding,
        children: [
          if (_err != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text('$_err', style: const TextStyle(color: C.amber, fontSize: 12.5)),
            ),
          ...widget.build(context, _data as T, reload),
        ],
      ),
    );
  }
}

/// Infinite list of a paged API route (skeleton while the first page loads).
class PagedList extends StatefulWidget {
  final String route;
  final Map<String, dynamic> query;
  final Widget Function(BuildContext context, Map<String, dynamic> item, Future<void> Function() reload) item;
  final List<Widget> Function(BuildContext context, Map<String, dynamic> extra, Future<void> Function() reload)? header;
  final String empty;
  final EdgeInsets padding;
  final bool avatarSkeleton;
  const PagedList(
      {super.key,
      required this.route,
      this.query = const {},
      required this.item,
      this.header,
      this.empty = 'Nothing here yet.',
      this.padding = const EdgeInsets.fromLTRB(14, 8, 14, 110),
      this.avatarSkeleton = false});
  @override
  State<PagedList> createState() => PagedListState();
}

class PagedListState extends State<PagedList> {
  final List<Map<String, dynamic>> _items = [];
  Map<String, dynamic> _extra = {};
  int _page = 0;
  int _pages = 1;
  int total = 0;
  bool _busy = false;
  bool _loaded = false;
  Object? _err;
  final _sc = ScrollController();

  @override
  void initState() {
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels > _sc.position.maxScrollExtent - 300) _more();
    });
    reload();
  }

  @override
  void didUpdateWidget(covariant PagedList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.route != widget.route || oldWidget.query.toString() != widget.query.toString()) {
      _loaded = false;
      reload();
    }
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  Future<void> reload() async {
    _page = 0;
    _pages = 1;
    await _more(reset: true);
  }

  Future<void> _more({bool reset = false}) async {
    if (_busy || (!reset && _page >= _pages)) return;
    setState(() => _busy = true);
    try {
      final r = await Api.I.page(widget.route, reset ? 1 : _page + 1, widget.query);
      if (!mounted) return;
      setState(() {
        if (reset) _items.clear();
        _items.addAll(r.items.whereType<Map>().map((e) => Map<String, dynamic>.from(e)));
        _page = r.page;
        _pages = r.pages;
        total = r.total;
        _extra = r.extra;
        _err = null;
        _loaded = true;
      });
    } catch (e) {
      if (mounted) setState(() => _err = e);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded && _err == null) return SkeletonList(avatar: widget.avatarSkeleton, padding: widget.padding.copyWith(bottom: 20));
    if (_items.isEmpty && _err != null && !_loaded) return ErrorView(_err!, reload);
    final head = widget.header?.call(context, _extra, reload) ?? <Widget>[];
    return RefreshIndicator(
      onRefresh: reload,
      color: C.brand,
      child: ListView.builder(
        controller: _sc,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: widget.padding,
        itemCount: head.length + (_items.isEmpty ? 1 : _items.length) + 1,
        itemBuilder: (ctx, i) {
          if (i < head.length) return head[i];
          final j = i - head.length;
          if (_items.isEmpty) return j == 0 ? EmptyView(widget.empty) : const SizedBox.shrink();
          if (j < _items.length) return Padding(padding: const EdgeInsets.only(bottom: 10), child: widget.item(ctx, _items[j], reload));
          if (_busy) return Shimmer(child: Column(children: [SkelCard(avatar: widget.avatarSkeleton), SkelCard(avatar: widget.avatarSkeleton)]));
          return const SizedBox(height: 8);
        },
      ),
    );
  }
}

// =====================================================================
// POP-UPS (every system message is a pop-up, like the website)
// =====================================================================
Future<void> copyText(BuildContext context, String v, {String what = 'Copied'}) async {
  await Clipboard.setData(ClipboardData(text: v));
  if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(what), duration: const Duration(seconds: 1)));
}

Future<void> showMessage(BuildContext context, String message, {String type = 'success', String? title}) {
  final c = statusColor(type);
  final icon = type == 'success'
      ? FontAwesomeIcons.circleCheck
      : type == 'warning'
          ? FontAwesomeIcons.triangleExclamation
          : type == 'info'
              ? FontAwesomeIcons.circleInfo
              : FontAwesomeIcons.circleXmark;
  return showDialog<void>(
    context: context,
    builder: (ctx) => AlertDialog(
      icon: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(color: c.withValues(alpha: .14), shape: BoxShape.circle),
        child: Center(child: FaIcon(icon, color: c, size: 30)),
      ),
      title: title == null ? null : Text(title, textAlign: TextAlign.center, style: TextStyle(color: C.text, fontWeight: FontWeight.w800)),
      content: SingleChildScrollView(child: Text(message, textAlign: TextAlign.center, style: TextStyle(fontSize: 15, height: 1.45, color: C.body))),
      actions: [SizedBox(width: 140, child: GradButton(onPressed: () => Navigator.pop(ctx), label: 'OK'))],
      actionsAlignment: MainAxisAlignment.center,
    ),
  );
}

Future<void> showError(BuildContext context, Object e) => showMessage(context, '$e', type: 'danger');

Future<bool> confirm(BuildContext context, String title, String message, {String ok = 'Yes', bool danger = false}) async {
  final r = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title, style: TextStyle(color: C.text, fontWeight: FontWeight.w800)),
      content: Text(message, style: TextStyle(color: C.body)),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
        FilledButton(
          style: danger ? FilledButton.styleFrom(backgroundColor: C.red) : null,
          onPressed: () => Navigator.pop(ctx, true),
          child: Text(ok),
        ),
      ],
    ),
  );
  return r == true;
}

/// Ask for one value (phone, amount, …).
Future<String?> askText(BuildContext context, String title,
    {String label = '', String initial = '', TextInputType keyboard = TextInputType.text, String ok = 'OK', String? hint, int maxLines = 1}) {
  final c = TextEditingController(text: initial);
  return showDialog<String>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title, style: TextStyle(color: C.text, fontWeight: FontWeight.w800)),
      content: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (label.isNotEmpty) Padding(padding: const EdgeInsets.only(bottom: 6), child: Text(label, style: TextStyle(color: C.text, fontWeight: FontWeight.w600, fontSize: 13.5))),
        TextField(controller: c, autofocus: true, keyboardType: keyboard, maxLines: maxLines, decoration: InputDecoration(hintText: hint)),
      ]),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
        FilledButton(onPressed: () => Navigator.pop(ctx, c.text.trim()), child: Text(ok)),
      ],
    ),
  );
}

/// Send a website action with a progress dialog, then show its message as a pop-up.
Future<ActionResult?> runAction(BuildContext context, String route, Map<String, dynamic> body, {bool popup = true, bool popupOnlyOnError = false}) async {
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => PopScope(
      canPop: false,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(color: C.card, borderRadius: BorderRadius.circular(18), border: Border.all(color: C.line)),
          child: const SizedBox(width: 30, height: 30, child: CircularProgressIndicator(strokeWidth: 3, color: C.brand)),
        ),
      ),
    ),
  );
  ActionResult? r;
  Object? err;
  try {
    r = await Api.I.post(route, body);
  } catch (e) {
    err = e;
  }
  if (context.mounted) Navigator.of(context, rootNavigator: true).pop();
  if (!context.mounted) return r;
  if (err != null) {
    if (err is ApiException && (err.isAuth || err.isLocked)) return null;
    await showError(context, err);
    return null;
  }
  if (popup && (!popupOnlyOnError || !r!.ok)) await showMessage(context, r!.message, type: r.type);
  return r;
}

Future<void> openUrl(BuildContext context, String url) async {
  final ok = await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  if (!ok && context.mounted) showMessage(context, 'Could not open $url', type: 'warning');
}

/// Bottom sheet with a list of actions.
Future<void> actionSheet(BuildContext context, String title, List<(IconData, String, Color, VoidCallback)> items) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (ctx) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(padding: const EdgeInsets.fromLTRB(16, 0, 16, 8), child: Text(title, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: C.text))),
          for (final it in items)
            ListTile(
              leading: Icon(it.$1, color: it.$3),
              title: Text(it.$2, style: TextStyle(color: C.text, fontWeight: FontWeight.w600)),
              onTap: () {
                Navigator.pop(ctx);
                it.$4();
              },
            ),
        ]),
      ),
    ),
  );
}

/// A simple bar chart (no chart library needed). [data2] draws a second (stacked) colour.
class Bars extends StatelessWidget {
  final List<(String, double)> data;
  final List<double>? data2;
  final Color color;
  final Color color2;
  final double height;
  const Bars(this.data, {super.key, this.color = C.brand, this.height = 120, this.data2, this.color2 = C.cyan});
  @override
  Widget build(BuildContext context) {
    double sum(int i) => data[i].$2 + (data2 != null && i < data2!.length ? data2![i] : 0);
    var mx = 0.0;
    for (var i = 0; i < data.length; i++) {
      mx = math.max(mx, sum(i));
    }
    return SizedBox(
      height: height + 18,
      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        for (var i = 0; i < data.length; i++)
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: data.length > 20 ? .5 : 2.5),
              child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Tooltip(
                  message: '${data[i].$1}: ${thousands(sum(i))}',
                  child: Column(children: [
                    if (data2 != null && i < data2!.length && data2![i] > 0)
                      Container(
                        height: mx <= 0 ? 0.0 : math.max(2.0, height * data2![i] / mx),
                        decoration: BoxDecoration(color: color2, borderRadius: BorderRadius.vertical(top: const Radius.circular(4), bottom: Radius.circular(data[i].$2 > 0 ? 0 : 4))),
                      ),
                    Container(
                      height: mx <= 0 ? 2.0 : (data[i].$2 <= 0 && (data2?.elementAtOrNull(i) ?? 0) > 0 ? 0.0 : math.max(2.0, height * data[i].$2 / mx)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular((data2?.elementAtOrNull(i) ?? 0) > 0 ? 0 : 4)),
                        gradient: LinearGradient(colors: [color, color.withValues(alpha: .55)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(height: 4),
                Text(data.length > 16 ? '' : data[i].$1, maxLines: 1, overflow: TextOverflow.clip, style: TextStyle(fontSize: 8.5, color: C.muted)),
              ]),
            ),
          ),
      ]),
    );
  }
}

/// A form field like the website: label above, field below.
class Field extends StatelessWidget {
  final TextEditingController c;
  final String label;
  final TextInputType keyboard;
  final bool obscure;
  final String? hint;
  final int maxLines;
  final IconData? icon;
  final String? helper;
  const Field(this.c, this.label, {super.key, this.keyboard = TextInputType.text, this.obscure = false, this.hint, this.maxLines = 1, this.icon, this.helper});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(padding: const EdgeInsets.only(bottom: 6, left: 2), child: Text(label, style: TextStyle(color: C.text, fontWeight: FontWeight.w600, fontSize: 13.5))),
          TextField(
            controller: c,
            keyboardType: keyboard,
            obscureText: obscure,
            maxLines: obscure ? 1 : maxLines,
            style: TextStyle(color: C.text),
            decoration: InputDecoration(hintText: hint, helperText: helper, helperMaxLines: 3, prefixIcon: icon == null ? null : Icon(icon, size: 19, color: C.muted)),
          ),
        ]),
      );
}

/// Label above a dropdown (website form style).
Widget labeled(String label, Widget field) => Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(padding: const EdgeInsets.only(bottom: 6, left: 2), child: Text(label, style: TextStyle(color: C.text, fontWeight: FontWeight.w600, fontSize: 13.5))),
        field,
      ]),
    );
