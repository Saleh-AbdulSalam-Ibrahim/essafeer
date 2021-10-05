import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebViewExample(),
    );
  }
}

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  // Initialize below webController object.
  late WebViewController _myController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: "https://essafeer.com/",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
// assign webviewcontroller object to mycontroller object and now we have a webpage
            _myController = webViewController;
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
// evaluateJavascript is a method to customize the UI, here i find searchfield class name and writing a javascript query string.
            _myController.evaluateJavascript(
                "document.getElementsByClassName(\"zGVn2e\")[0].style.display='none';");
          },
        ),
      ),
    );
  }
}
