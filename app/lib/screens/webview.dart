// In-app web page (voucher printing, posters, public WiFi map)
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../ui.dart';

class WebPage extends StatefulWidget {
  final String title;
  final String url;
  const WebPage({super.key, required this.title, required this.url});
  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late final WebViewController _c;
  int _progress = 0;

  @override
  void initState() {
    super.initState();
    _c = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(NavigationDelegate(onProgress: (p) {
        if (mounted) setState(() => _progress = p);
      }))
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(tooltip: 'Reload', icon: const Icon(Icons.refresh), onPressed: () => _c.reload()),
            IconButton(tooltip: 'Open in browser', icon: const Icon(Icons.open_in_browser), onPressed: () => openUrl(context, widget.url)),
          ],
          bottom: _progress < 100
              ? PreferredSize(preferredSize: const Size.fromHeight(3), child: LinearProgressIndicator(value: _progress / 100, minHeight: 3, color: C.cyan))
              : null,
        ),
        body: WebViewWidget(controller: _c),
      );
}
