// Voucher printing inside the app: the website's Kiswahili voucher cards drawn as a PDF on the phone,
// shown in a preview, then printed (any Android printer / Wi-Fi / Bluetooth print service), saved as PDF or shared.
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../api.dart';
import '../ui.dart';
import 'home.dart';

class VoucherPrintScreen extends StatefulWidget {
  final String batch;
  final List<int> ids; // print only these vouchers (one voucher from its page)
  const VoucherPrintScreen({super.key, this.batch = '', this.ids = const []});
  @override
  State<VoucherPrintScreen> createState() => _VoucherPrintScreenState();
}

class _VoucherPrintScreenState extends State<VoucherPrintScreen> {
  Map<String, dynamic>? _d;
  Object? _err;
  int _cols = 3;
  String _qr = 'both';
  bool _withQr = true;
  pw.Font? _f400, _f700, _f900, _mono;
  pw.MemoryImage? _logo;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final d = await Api.I.getMap('vouchers/print_data', {
        if (widget.batch.isNotEmpty) 'batch': widget.batch,
        for (var i = 0; i < widget.ids.length; i++) 'ids[$i]': widget.ids[i],
      });
      _f400 = pw.Font.ttf(await rootBundle.load('fonts/Inter_400Regular.ttf'));
      _f700 = pw.Font.ttf(await rootBundle.load('fonts/Inter_700Bold.ttf'));
      _f900 = pw.Font.ttf(await rootBundle.load('fonts/Inter_900Black.ttf'));
      _mono = pw.Font.ttf(await rootBundle.load('fonts/JetBrainsMono_800ExtraBold.ttf'));
      final logo = toStr(d['logo_url']);
      if (logo.startsWith('http')) {
        try {
          final r = await http.get(Uri.parse(logo)).timeout(const Duration(seconds: 12));
          if (r.statusCode == 200 && r.bodyBytes.length > 100) _logo = pw.MemoryImage(r.bodyBytes);
        } catch (_) {}
      }
      if (!mounted) return;
      setState(() {
        _d = d;
        _qr = toStr(d['qr_mode'], 'both');
      });
    } catch (e) {
      if (mounted) setState(() => _err = e);
    }
  }

  // ---------------- PDF ----------------
  static const _a = PdfColor.fromInt(0xFF2F62EA);
  static const _b = PdfColor.fromInt(0xFF7C3AED);
  static const _ink = PdfColor.fromInt(0xFF0B1324);
  static const _mut = PdfColor.fromInt(0xFF4B5872);
  static const _line = PdfColor.fromInt(0xFFD3DBEA);

  Future<Uint8List> _build(PdfPageFormat format) async {
    final d = _d!;
    final list = toList(d['vouchers']).map(toMap).toList();
    final phone = toStr(d['seller_phone']);
    final site = toStr(d['site_name'], 'SKY WIFI TANZANIA');
    final doc = pw.Document(title: 'Vocha ${widget.batch}', author: site, theme: pw.ThemeData.withFont(base: _f400, bold: _f700));
    final s = _cols == 2 ? 1.15 : (_cols == 4 ? .82 : (_cols == 5 ? .7 : 1.0)); // text scale per column count
    final rows = <List<Map<String, dynamic>>>[];
    for (var i = 0; i < list.length; i += _cols) {
      rows.add(list.sublist(i, i + _cols > list.length ? list.length : i + _cols));
    }
    doc.addPage(pw.MultiPage(
      pageFormat: format.copyWith(marginLeft: 14, marginRight: 14, marginTop: 14, marginBottom: 14),
      build: (ctx) => [
        for (final r in rows)
          pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 7),
            child: pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
              for (var i = 0; i < _cols; i++) ...[
                if (i > 0) pw.SizedBox(width: 7),
                pw.Expanded(child: i < r.length ? _card(r[i], s, phone, site) : pw.SizedBox()),
              ],
            ]),
          ),
      ],
    ));
    return doc.save();
  }

  pw.Widget _card(Map<String, dynamic> v, double s, String phone, String site) {
    final price = toDouble(v['price']);
    final ssid = toStr(v['ssid']);
    final both = _withQr && _qr == 'both';
    final qrSize = (both ? 50.0 : 62.0) * s;
    pw.Widget qr(String data, String label, String? n) => pw.Column(children: [
          if (n != null)
            pw.Container(
              padding: const pw.EdgeInsets.symmetric(horizontal: 3, vertical: .5),
              decoration: const pw.BoxDecoration(color: _a, borderRadius: pw.BorderRadius.all(pw.Radius.circular(3))),
              child: pw.Text(n, style: pw.TextStyle(color: PdfColors.white, fontSize: 6.5 * s, font: _f700)),
            ),
          pw.SizedBox(height: 2),
          pw.BarcodeWidget(barcode: pw.Barcode.qrCode(), data: data, width: qrSize, height: qrSize, color: _ink),
          pw.SizedBox(height: 2),
          pw.Text(label, textAlign: pw.TextAlign.center, style: pw.TextStyle(fontSize: 6.5 * s, color: _mut, font: _f700)),
        ]);
    final steps = <String>[
      if (both) ...[
        'QR 1: scan kwa kamera / WiFi scanner — simu inaingia WiFi $ssid',
        'QR 2: scan — vocha inawekwa, unaunganishwa moja kwa moja',
        'Au weka namba ya vocha kwenye ukurasa wa WiFi',
      ] else if (_withQr && _qr == 'wifi') ...[
        'Scan QR kwa kamera / WiFi scanner — simu inaingia WiFi $ssid',
        'Ukurasa wa WiFi utafunguka — weka namba ya vocha, bonyeza UNGANISHA',
      ] else ...[
        'Unganisha WiFi $ssid',
        if (_withQr) ...['Scan QR — utaunganishwa moja kwa moja', 'Au fungua ukurasa wa WiFi, weka namba ya vocha'] else ...['Ukurasa wa WiFi utafunguka', 'Weka namba ya vocha, bonyeza UNGANISHA'],
      ],
      'Vocha moja = simu moja kwa wakati mmoja',
      if (toInt(v['max_devices']) > 1) 'Inatumika kwenye vifaa ${toInt(v['max_devices'])}',
    ];
    pw.Widget info(String k, String val) => pw.Expanded(
          child: pw.Container(
            padding: pw.EdgeInsets.symmetric(horizontal: 5 * s, vertical: 4 * s),
            child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
              pw.Text(k.toUpperCase(), style: pw.TextStyle(fontSize: 5.8 * s, color: _mut, font: _f700, letterSpacing: .6)),
              pw.Text(val, maxLines: 1, style: pw.TextStyle(fontSize: 8.6 * s, color: _ink, font: _f700)),
            ]),
          ),
        );
    return pw.Container(
      decoration: pw.BoxDecoration(color: PdfColors.white, border: pw.Border.all(color: _line, width: 1.2), borderRadius: const pw.BorderRadius.all(pw.Radius.circular(10))),
      child: pw.ClipRRect(
        horizontalRadius: 10,
        verticalRadius: 10,
        child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.stretch, children: [
          // 1 — header: WiFi name | logo | price
          pw.Container(
            padding: pw.EdgeInsets.symmetric(horizontal: 8 * s, vertical: 6 * s),
            decoration: const pw.BoxDecoration(gradient: pw.LinearGradient(colors: [_a, _b])),
            child: pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
              pw.Expanded(
                child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                  pw.Text('WIFI', style: pw.TextStyle(color: PdfColors.white, fontSize: 6.2 * s, font: _f700, letterSpacing: 1)),
                  pw.Text(ssid, maxLines: 1, style: pw.TextStyle(color: PdfColors.white, fontSize: 10 * s, font: _f900)),
                ]),
              ),
              if (_logo != null) pw.Padding(padding: pw.EdgeInsets.symmetric(horizontal: 4 * s), child: pw.Image(_logo!, width: 34 * s, height: 34 * s, fit: pw.BoxFit.contain)),
              pw.Expanded(
                child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
                  pw.Text('BEI', style: pw.TextStyle(color: PdfColors.white, fontSize: 6.2 * s, font: _f700, letterSpacing: 1)),
                  pw.Text(price > 0 ? 'TSh ${thousands(price)}' : 'BURE', maxLines: 1, style: pw.TextStyle(color: PdfColors.white, fontSize: 11.5 * s, font: _f900)),
                ]),
              ),
            ]),
          ),
          // 2 — package details
          pw.Container(
            decoration: const pw.BoxDecoration(border: pw.Border(bottom: pw.BorderSide(color: _line))),
            child: pw.Row(children: [info('Kifurushi', toStr(v['package'])), info('Muda', toStr(v['duration'])), info('Data', toStr(v['data']))]),
          ),
          // 3 — the code (nothing on top of it)
          pw.Padding(
            padding: pw.EdgeInsets.fromLTRB(8 * s, 5 * s, 8 * s, 6 * s),
            child: pw.Column(children: [
              pw.Text('NAMBA YA VOCHA', style: pw.TextStyle(fontSize: 6.2 * s, color: _mut, font: _f900, letterSpacing: 1.2)),
              pw.SizedBox(height: 3),
              pw.Container(
                width: double.infinity,
                padding: pw.EdgeInsets.symmetric(vertical: 5 * s),
                decoration: pw.BoxDecoration(
                  color: const PdfColor.fromInt(0xFFF3F6FD),
                  border: pw.Border.all(color: const PdfColor.fromInt(0xFF8EA3CF), width: 1.4),
                  borderRadius: const pw.BorderRadius.all(pw.Radius.circular(7)),
                ),
                child: pw.Text(toStr(v['code']), textAlign: pw.TextAlign.center, style: pw.TextStyle(font: _mono, fontSize: 16 * s, color: _ink, letterSpacing: 2.5 * s)),
              ),
            ]),
          ),
          // 4 — QR codes + how to use
          pw.Container(
            padding: pw.EdgeInsets.symmetric(horizontal: 8 * s, vertical: 5 * s),
            decoration: const pw.BoxDecoration(border: pw.Border(top: pw.BorderSide(color: _line, width: .8))),
            child: pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
              if (_withQr && _qr != 'auto') qr(toStr(v['qr_wifi']), 'Scan WiFi', both ? '1' : null),
              if (_withQr && _qr != 'auto') pw.SizedBox(width: 4 * s),
              if (_withQr && _qr != 'wifi') qr(toStr(v['qr_login']), both ? 'Ingia' : 'Scan QR uunganishwe', both ? '2' : null),
              if (_withQr) pw.SizedBox(width: 6 * s),
              pw.Expanded(
                child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                  pw.Text('JINSI YA KUTUMIA', style: pw.TextStyle(fontSize: 5.8 * s, color: _mut, font: _f700, letterSpacing: .8)),
                  pw.SizedBox(height: 2),
                  for (var i = 0; i < steps.length; i++)
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(bottom: 1.2),
                      child: pw.Text('${i + 1}. ${steps[i]}', style: pw.TextStyle(fontSize: 6.6 * s, color: _ink, lineSpacing: .5)),
                    ),
                ]),
              ),
            ]),
          ),
          // 5 — footer
          pw.Container(
            padding: pw.EdgeInsets.symmetric(horizontal: 8 * s, vertical: 4 * s),
            color: const PdfColor.fromInt(0xFFF5F7FC),
            child: pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
              pw.Text(toStr(v['valid_until']).isNotEmpty ? 'Tumia kabla ya: ${toStr(v['valid_until'])}' : site, style: pw.TextStyle(fontSize: 6.6 * s, color: _mut)),
              if (phone.isNotEmpty) pw.Text('Msaada: $phone', style: pw.TextStyle(fontSize: 6.6 * s, color: _ink, font: _f700)),
            ]),
          ),
        ]),
      ),
    );
  }

  // ---------------- screen ----------------
  @override
  Widget build(BuildContext context) {
    final n = toList(_d?['vouchers']).length;
    return Scaffold(
      appBar: skyBar(widget.batch.isNotEmpty ? 'Print vouchers' : 'Print voucher'),
      body: _err != null
          ? ErrorView(_err!, () {
              setState(() => _err = null);
              _load();
            })
          : _d == null
              ? const SkeletonDetail()
              : n == 0
                  ? const EmptyView('This batch has no unused vouchers left to print.', icon: Icons.print_disabled_outlined)
                  : Column(children: [
                      Container(
                        color: C.card,
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text('$n vocha${widget.batch.isNotEmpty ? ' • ${widget.batch}' : ''}', style: TextStyle(color: C.text, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 8),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                              Text('Kwa mstari: ', style: TextStyle(color: C.muted, fontSize: 12.5)),
                              for (final c in [2, 3, 4, 5])
                                Padding(
                                  padding: const EdgeInsets.only(right: 6),
                                  child: ChoiceChip(label: Text('$c'), selected: _cols == c, onSelected: (_) => setState(() => _cols = c), visualDensity: VisualDensity.compact),
                                ),
                              const SizedBox(width: 6),
                              FilterChip(label: const Text('QR code'), selected: _withQr, onSelected: (v) => setState(() => _withQr = v), visualDensity: VisualDensity.compact),
                              const SizedBox(width: 6),
                              if (_withQr)
                                for (final q in const [('both', 'WiFi + Kuingia'), ('wifi', 'WiFi tu'), ('auto', 'Kuingia tu')])
                                  Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: ChoiceChip(label: Text(q.$2), selected: _qr == q.$1, onSelected: (_) => setState(() => _qr = q.$1), visualDensity: VisualDensity.compact),
                                  ),
                            ]),
                          ),
                        ]),
                      ),
                      Expanded(
                        child: PdfPreview(
                          key: ValueKey('$_cols|$_qr|$_withQr'),
                          build: _build,
                          initialPageFormat: PdfPageFormat.a4,
                          canChangePageFormat: true,
                          canChangeOrientation: false,
                          canDebug: false,
                          allowPrinting: true,
                          allowSharing: true,
                          pdfFileName: 'vocha-${widget.batch.isEmpty ? 'sky-wifi' : widget.batch}.pdf',
                          pdfPreviewPageDecoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Color(0x55000000), blurRadius: 12)]),
                          scrollViewDecoration: BoxDecoration(color: C.bg),
                          loadingWidget: const SkeletonDetail(),
                        ),
                      ),
                    ]),
    );
  }
}
