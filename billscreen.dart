import 'dart:async';

import 'package:flutter/material.dart';
import 'package:barterit/models/user.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BillScreen extends StatefulWidget {
  final User user;
  final double totalprice;

  const BillScreen({Key? key, required this.user, required this.totalprice})
      : super(key: key);

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bill"),
      ),
      body: Center(
        child: WebView(
          initialUrl:
              'https://slumberjer.com/barterit/php/payment.php?sellerid=${widget.user.id}&userid=${widget.user.id}&email=${widget.user.email}&phone=${widget.user.phone}&name=${widget.user.name}&amount=${widget.totalprice}',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onProgress: (int progress) {
            // prg = progress as double;
            // setState(() {});
            // print('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            // print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            //print('Page finished loading: $url');
            setState(() {
              //isLoading = false;
            });
          },
        ),
      ),
    );
  }
  
  WebView({required String initialUrl, required javascriptMode, required Null Function(WebViewController webViewController) onWebViewCreated, required Null Function(int progress) onProgress, required Null Function(String url) onPageStarted, required Null Function(String url) onPageFinished}) {}
}

class WebViewController {
}