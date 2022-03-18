import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  Completer<WebViewController> _completer = Completer<WebViewController>();
  final urls = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blueAccent,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text("Flutter", style: TextStyle(color: Colors.black)),
            const Text(
              "News",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        actions: [Opacity(opacity: 0, child: Icon(Icons.save))],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: WebView(
            onWebViewCreated: (WebViewController webViewController) {
              _completer.complete(webViewController);
            },
            initialUrl: urls,
          ),
        ),
      ),
    );
  }
}
