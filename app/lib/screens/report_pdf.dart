// The report as a PDF inside the app — the same PDF file the website makes (api.php export/report_pdf),
// shown in a preview, then printed, saved or shared (WhatsApp, e-mail, Drive …) without leaving the app.
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import '../api.dart';
import '../ui.dart';
import 'home.dart';

class ReportPdfScreen extends StatefulWidget {
  final String type; // seller | router
  final String period;
  final int id;
  final String label;
  const ReportPdfScreen({super.key, required this.type, required this.period, this.id = 0, this.label = ''});
  @override
  State<ReportPdfScreen> createState() => _ReportPdfScreenState();
}

class _ReportPdfScreenState extends State<ReportPdfScreen> {
  Uint8List? _pdf;
  Object? _err;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _err = null;
      _pdf = null;
    });
    try {
      final b = await Api.I.bytes('export/report_pdf', {'type': widget.type, 'period': widget.period, if (widget.id > 0) 'id': widget.id});
      if (mounted) setState(() => _pdf = b);
    } catch (e) {
      if (mounted) setState(() => _err = e);
    }
  }

  String get _fileName {
    final p = widget.period.replaceAll(RegExp(r'[^a-z0-9_]'), '');
    return 'sky-wifi-report-${widget.type}${widget.id > 0 ? '-${widget.id}' : ''}-$p.pdf';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: skyBar('Report PDF'),
      body: _err != null
          ? ListView(padding: const EdgeInsets.all(20), children: [
              GlowCard(
                glow: C.red,
                child: Column(children: [
                  Icon(Icons.picture_as_pdf_outlined, size: 42, color: C.red),
                  const SizedBox(height: 10),
                  Text(_err is ApiException ? (_err as ApiException).message : 'Could not make the PDF.', textAlign: TextAlign.center),
                  const SizedBox(height: 14),
                  GradButton(label: 'Try again', icon: Icons.refresh, onPressed: _load),
                ]),
              ),
            ])
          : _pdf == null
              ? const SkeletonDetail()
              : Column(children: [
                  if (widget.label.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
                      child: Row(children: [
                        Icon(Icons.picture_as_pdf, color: C.red, size: 18),
                        const SizedBox(width: 8),
                        Expanded(child: Text(widget.label, style: TextStyle(color: C.muted, fontWeight: FontWeight.w600))),
                      ]),
                    ),
                  Expanded(
                    child: PdfPreview(
                      build: (PdfPageFormat f) async => _pdf!,
                      initialPageFormat: PdfPageFormat.a4,
                      canChangePageFormat: false,
                      canChangeOrientation: false,
                      canDebug: false,
                      allowPrinting: true,
                      allowSharing: true,
                      pdfFileName: _fileName,
                      pdfPreviewPageDecoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Color(0x55000000), blurRadius: 12)]),
                      scrollViewDecoration: BoxDecoration(color: C.bg),
                      loadingWidget: const SkeletonDetail(),
                    ),
                  ),
                ]),
    );
  }
}
