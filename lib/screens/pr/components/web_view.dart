import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:puble_frontend/models/pr_model.dart';

// class PRWebView extends StatelessWidget {
//   final WebViewController controller;

//   const PRWebView({
//     super.key,
//     required this.controller,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return WebViewWidget(
//       controller: controller,
//     );
//   }
// }

class WebViewApp extends StatefulWidget {
  final PullRequestModel pr;

  const WebViewApp({
    super.key,
    required this.pr,
  });

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://flutter.dev'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}