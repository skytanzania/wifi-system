// SKY WIFI TANZANIA — theme, formatting and shared widgets
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'api.dart';

// ---------- colours (same as the website dashboard) ----------
class C {
  static const bg = Color(0xFF060A13);
  static const card = Color(0xFF0C1320);
  static const card2 = Color(0xFF111A2B);
  static const line = Color(0xFF1E2A40);
  static const brand = Color(0xFF5B8CFF);
  static const brand2 = Color(0xFF8B5CF6);
  static const cyan = Color(0xFF22D3EE);
  static const green = Color(0xFF22C55E);
  static const red = Color(0xFFEF4444);
  static const amber = Color(0xFFF59E0B);
  static const text = Color(0xFFE6EBF5);
  static const muted = Color(0xFF94A3B8);
  static const grad = LinearGradient(colors: [cyan, brand, brand2], begin: Alignment.topLeft, end: Alignment.bottomRight);
}

ThemeData skyTheme() {
  final base = ThemeData(brightness: Brightness.dark, useMaterial3: true, colorSchemeSeed: C.brand);
  return base.copyWith(
    scaffoldBackgroundColor: C.bg,
    colorScheme: base.colorScheme.copyWith(primary: C.brand, secondary: C.cyan, surface: C.card, error: C.red),
    appBarTheme: const AppBarTheme(backgroundColor: C.bg, foregroundColor: C.text, elevation: 0, centerTitle: false, scrolledUnderElevation: 0),
    cardTheme: const CardThemeData(color: C.card, elevation: 0, margin: EdgeInsets.zero),
    dividerColor: C.line,
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: C.card,
      indicatorColor: C.brand.withValues(alpha: .22),
      labelTextStyle: WidgetStateProperty.all(const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w600, color: C.text)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: C.card2,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: C.line)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: C.line)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: C.brand, width: 1.4)),
      labelStyle: const TextStyle(color: C.muted),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: C.brand,
        foregroundColor: Colors.white,
        minimumSize: const Size(64, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: C.text,
        minimumSize: const Size(64, 44),
        side: const BorderSide(color: C.line),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    chipTheme: base.chipTheme.copyWith(backgroundColor: C.card2, side: const BorderSide(color: C.line), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    dialogTheme: DialogThemeData(backgroundColor: C.card, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: C.card, showDragHandle: true),
    snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
  );
}

// ---------- formatting ----------
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

// ---------- widgets ----------
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
        borderRadius: BorderRadius.circular(s * .26),
        boxShadow: [BoxShadow(color: C.brand.withValues(alpha: .45), blurRadius: s * .45, spreadRadius: -s * .08)],
      ),
      child: AnimatedBuilder(
        animation: _c,
        builder: (_, __) => CustomPaint(painter: _WifiPainter(_c.value)),
      ),
    );
  }
}

class _WifiPainter extends CustomPainter {
  final double t;
  _WifiPainter(this.t);
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final c = Offset(w / 2, w * .76);
    for (var i = 0; i < 3; i++) {
      final r = w * (.16 + i * .15);
      final phase = ((t * 3) - i).clamp(0.0, 1.0);
      final op = .35 + .65 * (phase > 0 && phase < 1 ? math.sin(phase * math.pi) : 0) + (i == 0 ? .3 : 0);
      final p = Paint()
        ..color = Colors.white.withValues(alpha: op.clamp(.35, 1.0).toDouble())
        ..style = PaintingStyle.stroke
        ..strokeWidth = w * .075
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(Rect.fromCircle(center: c, radius: r), math.pi * 1.22, math.pi * .56, false, p);
    }
    canvas.drawCircle(c, w * .055, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(_WifiPainter o) => o.t != t;
}

class GlowCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? glow;
  final VoidCallback? onTap;
  final Gradient? gradient;
  const GlowCard({super.key, required this.child, this.padding = const EdgeInsets.all(16), this.glow, this.onTap, this.gradient});
  @override
  Widget build(BuildContext context) {
    final g = glow ?? C.brand;
    return Container(
      decoration: BoxDecoration(
        color: gradient == null ? C.card : null,
        gradient: gradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: g.withValues(alpha: .16), blurRadius: 22, spreadRadius: -6, offset: const Offset(0, 6))],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        child: InkWell(onTap: onTap, child: Padding(padding: padding, child: child)),
      ),
    );
  }
}

class StatTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final String? sub;
  final VoidCallback? onTap;
  const StatTile({super.key, required this.icon, required this.label, required this.value, this.color = C.brand, this.sub, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GlowCard(
      glow: color,
      onTap: onTap,
      padding: const EdgeInsets.all(14),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(color: color.withValues(alpha: .16), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, size: 18, color: color),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: C.muted, fontSize: 12.5, fontWeight: FontWeight.w600))),
        ]),
        const SizedBox(height: 10),
        FittedBox(fit: BoxFit.scaleDown, alignment: Alignment.centerLeft, child: Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: C.text))),
        if (sub != null) ...[const SizedBox(height: 2), Text(sub!, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: C.muted, fontSize: 11.5))],
      ]),
    );
  }
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
      decoration: BoxDecoration(color: c.withValues(alpha: .15), borderRadius: BorderRadius.circular(20)),
      child: Text(label ?? cap(status), style: TextStyle(color: c, fontSize: 11.5, fontWeight: FontWeight.w700)),
    );
  }
}

class Dot extends StatelessWidget {
  final bool on;
  const Dot(this.on, {super.key});
  @override
  Widget build(BuildContext context) => Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: on ? C.green : C.red,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: (on ? C.green : C.red).withValues(alpha: .6), blurRadius: 8)],
        ),
      );
}

class SectionTitle extends StatelessWidget {
  final String text;
  final Widget? trailing;
  const SectionTitle(this.text, {super.key, this.trailing});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(4, 18, 4, 10),
        child: Row(children: [
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: C.text))),
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
          SizedBox(width: 130, child: Text(k, style: const TextStyle(color: C.muted, fontSize: 13))),
          Expanded(
            child: SelectableText(v.isEmpty ? '—' : v,
                style: TextStyle(color: C.text, fontSize: 13.5, fontWeight: FontWeight.w600, fontFamily: mono ? 'monospace' : null)),
          ),
          if (copy && v.isNotEmpty)
            InkWell(
              onTap: () => copyText(context, v),
              child: const Padding(padding: EdgeInsets.only(left: 8), child: Icon(Icons.copy_rounded, size: 18, color: C.muted)),
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
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
        child: Column(children: [
          Icon(icon, size: 48, color: C.muted.withValues(alpha: .6)),
          const SizedBox(height: 12),
          Text(text, textAlign: TextAlign.center, style: const TextStyle(color: C.muted)),
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
            const Icon(Icons.cloud_off_rounded, size: 52, color: C.amber),
            const SizedBox(height: 14),
            Text('$error', textAlign: TextAlign.center, style: const TextStyle(color: C.text)),
            const SizedBox(height: 18),
            FilledButton.icon(onPressed: onRetry, icon: const Icon(Icons.refresh), label: const Text('Try again')),
          ]),
        ),
      );
}

const loader = Center(child: Padding(padding: EdgeInsets.all(32), child: CircularProgressIndicator(color: C.brand)));

/// Loads data once (and on pull-to-refresh) and builds a scrollable page from it.
class AsyncPage<T> extends StatefulWidget {
  final Future<T> Function() load;
  final List<Widget> Function(BuildContext context, T data, Future<void> Function() reload) build;
  final EdgeInsets padding;
  const AsyncPage({super.key, required this.load, required this.build, this.padding = const EdgeInsets.fromLTRB(16, 8, 16, 100)});
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
    if (_busy && _data == null) return loader;
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

/// Infinite list of a paged API route.
class PagedList extends StatefulWidget {
  final String route;
  final Map<String, dynamic> query;
  final Widget Function(BuildContext context, Map<String, dynamic> item, Future<void> Function() reload) item;
  final List<Widget> Function(BuildContext context, Map<String, dynamic> extra, Future<void> Function() reload)? header;
  final String empty;
  final EdgeInsets padding;
  const PagedList({super.key, required this.route, this.query = const {}, required this.item, this.header, this.empty = 'Nothing here yet.', this.padding = const EdgeInsets.fromLTRB(16, 8, 16, 100)});
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
  void didUpdateWidget(covariant PagedList old) {
    super.didUpdateWidget(old);
    if (old.route != widget.route || old.query.toString() != widget.query.toString()) reload();
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  Future<void> reload() async {
    _page = 0;
    _pages = 1;
    _items.clear();
    await _more(reset: true);
  }

  Future<void> _more({bool reset = false}) async {
    if (_busy || (!reset && _page >= _pages)) return;
    setState(() => _busy = true);
    try {
      final r = await Api.I.page(widget.route, _page + 1, widget.query);
      if (!mounted) return;
      setState(() {
        if (reset) _items.clear();
        _items.addAll(r.items.whereType<Map>().map((e) => Map<String, dynamic>.from(e)));
        _page = r.page;
        _pages = r.pages;
        total = r.total;
        _extra = r.extra;
        _err = null;
      });
    } catch (e) {
      if (mounted) setState(() => _err = e);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_items.isEmpty && _busy) return loader;
    if (_items.isEmpty && _err != null) return ErrorView(_err!, reload);
    final head = widget.header?.call(context, _extra, reload) ?? const <Widget>[];
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
          return _busy ? const Padding(padding: EdgeInsets.all(16), child: Center(child: CircularProgressIndicator(strokeWidth: 2))) : const SizedBox(height: 8);
        },
      ),
    );
  }
}

// ---------- pop-ups ----------
Future<void> copyText(BuildContext context, String v, {String what = 'Copied'}) async {
  await Clipboard.setData(ClipboardData(text: v));
  if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(what), duration: const Duration(seconds: 1)));
}

/// Every system message is shown as a pop-up (like the website).
Future<void> showMessage(BuildContext context, String message, {String type = 'success', String? title}) {
  final c = statusColor(type);
  final icon = type == 'success'
      ? Icons.check_circle_rounded
      : type == 'warning'
          ? Icons.warning_amber_rounded
          : type == 'info'
              ? Icons.info_rounded
              : Icons.error_rounded;
  return showDialog<void>(
    context: context,
    builder: (ctx) => AlertDialog(
      icon: Icon(icon, color: c, size: 44),
      title: title == null ? null : Text(title, textAlign: TextAlign.center),
      content: SingleChildScrollView(child: Text(message, textAlign: TextAlign.center, style: const TextStyle(fontSize: 15, height: 1.4))),
      actions: [FilledButton(onPressed: () => Navigator.pop(ctx), child: const Text('OK'))],
      actionsAlignment: MainAxisAlignment.center,
    ),
  );
}

Future<void> showError(BuildContext context, Object e) => showMessage(context, '$e', type: 'danger');

Future<bool> confirm(BuildContext context, String title, String message, {String ok = 'Yes', bool danger = false}) async {
  final r = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      content: Text(message),
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
      title: Text(title),
      content: TextField(
        controller: c,
        autofocus: true,
        keyboardType: keyboard,
        maxLines: maxLines,
        decoration: InputDecoration(labelText: label, hintText: hint),
      ),
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
    builder: (_) => const PopScope(canPop: false, child: Center(child: CircularProgressIndicator(color: C.brand))),
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
          Padding(padding: const EdgeInsets.fromLTRB(16, 0, 16, 8), child: Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16))),
          for (final it in items)
            ListTile(
              leading: Icon(it.$1, color: it.$3),
              title: Text(it.$2),
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

/// A simple horizontal bar chart (no chart library needed).
class Bars extends StatelessWidget {
  final List<(String, double)> data;
  final Color color;
  final double height;
  const Bars(this.data, {super.key, this.color = C.brand, this.height = 120});
  @override
  Widget build(BuildContext context) {
    final mx = data.fold<double>(0, (a, b) => math.max(a, b.$2));
    return SizedBox(
      height: height + 18,
      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        for (final d in data)
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: data.length > 20 ? .5 : 2),
              child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Tooltip(
                  message: '${d.$1}: ${thousands(d.$2)}',
                  child: Container(
                    height: mx <= 0 ? 2.0 : math.max(2.0, height * d.$2 / mx),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
                      gradient: LinearGradient(colors: [color, color.withValues(alpha: .45)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(data.length > 12 ? '' : d.$1, maxLines: 1, overflow: TextOverflow.clip, style: const TextStyle(fontSize: 9, color: C.muted)),
              ]),
            ),
          ),
      ]),
    );
  }
}

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
        padding: const EdgeInsets.only(bottom: 12),
        child: TextField(
          controller: c,
          keyboardType: keyboard,
          obscureText: obscure,
          maxLines: obscure ? 1 : maxLines,
          decoration: InputDecoration(labelText: label, hintText: hint, helperText: helper, helperMaxLines: 3, prefixIcon: icon == null ? null : Icon(icon, size: 20)),
        ),
      );
}
