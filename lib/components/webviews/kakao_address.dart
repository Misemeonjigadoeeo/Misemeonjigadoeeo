import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:webview_flutter/webview_flutter.dart';

class KakaoAddress extends StatefulWidget {
  @override
  _KakaoAddressState createState() => _KakaoAddressState();
}

class _KakaoAddressState extends State<KakaoAddress> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Scaffold(body: webView())
        : CupertinoPageScaffold(
            child: webView(),
          );
  }

  Widget webView() {
    return SafeArea(
      child: Container(
        child: WebView(
          initialUrl: '',
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: Set.from([
            JavascriptChannel(
                name: 'Print',
                onMessageReceived: (JavascriptMessage message) {
                  print(message.message);
                })
          ]),
          onWebViewCreated: (WebViewController webViewController) async {
            _controller = webViewController;
            String fileText =
                await rootBundle.loadString('assets/html/kakao-address.html');
            _controller.loadUrl(Uri.dataFromString(fileText,
                    mimeType: 'text/html',
                    encoding: Encoding.getByName('utf-8'))
                .toString());
          },
        ),
      ),
    );
  }
}
