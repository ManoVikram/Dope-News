import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../constants.dart';

class AppWebView extends StatefulWidget {
  const AppWebView({super.key, required this.url});

  final String url;

  @override
  State<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {
  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.url),
        backgroundColor: primaryColor,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: WebView(initialUrl: widget.url),
      ),
    );
  }
}
