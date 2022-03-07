import 'dart:io';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';



class ShopWebViewScreen extends StatefulWidget {
  final String url;
  ShopWebViewScreen(this.url);
  @override
  _ShopWebViewScreen createState() => _ShopWebViewScreen(url);
}

class _ShopWebViewScreen extends State<ShopWebViewScreen> {
  final String url;
  _ShopWebViewScreen(this.url,);

  bool _canGoBack = false;
  bool _canGoForward = false;
  WebViewController? _webViewController;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade50,
        actions: [
          IconButton(
            icon: Icon(LineIcons.alternateRedo),
            onPressed: _webViewController?.reload,
          ),
        ],
      ),
      body: Center(
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: {
            JavascriptChannel(
              name: "Print",
              onMessageReceived: (message) {
                print(message.message);
              },
            ),
          },
          onWebViewCreated: (controller) {
            _webViewController = controller;
          },
          onPageStarted: (value) {},
          onPageFinished: (value) async {
            _canGoBack = (await _webViewController?.canGoBack())!;
            _canGoForward = (await _webViewController?.canGoForward())!;
            setState(() {});
          },
          onWebResourceError: (error) {
            print("onWebResourceError : $error");
          },
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(LineIcons.shareSquareAlt, color: Colors.grey,),
              onPressed: () async{
                final currentUrl = await _webViewController?.currentUrl();
                Share.share(currentUrl!);
              }
            ),
            IconButton(
              icon: Icon(LineIcons.home, color: Colors.grey,),
              onPressed:() => _webViewController?.loadUrl(url),
            ),
            IconButton(
              icon: Icon(LineIcons.angleLeft, color: Colors.grey,),
              onPressed: _canGoBack ? _webViewController?.goBack : null,
            ),
            IconButton(
              icon: Icon(LineIcons.angleRight, color: Colors.grey,),
              onPressed: _canGoForward ? _webViewController?.goForward : null,
            ),
          ],
        ),
      ],
    );
  }
}
