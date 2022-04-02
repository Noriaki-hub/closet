import 'dart:io';
import 'package:closet_app_xxx/ui/libs/share_log_button.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  final String genre;
  WebViewScreen({required this.url, required this.genre});
  @override
  _WebViewScreen createState() => _WebViewScreen(url, genre);
}

class _WebViewScreen extends State<WebViewScreen> {
  final String url;
  final String genre;

  _WebViewScreen(this.url, this.genre);

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
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.brown.shade50,
          child: Icon(Icons.ios_share),
          onPressed: () async {
            final currentUrl = await _webViewController?.currentUrl();
            if (currentUrl != null) {
              showDialog(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return ShareLogPage(
                    currentUrl: currentUrl,
                    genre: genre,
                  );
                },
              );
            }
          }),
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
                icon: Icon(
                  LineIcons.shareSquareAlt,
                  color: Colors.grey,
                ),
                onPressed: () async {
                  final currentUrl = await _webViewController?.currentUrl();
                  Share.share(currentUrl!);
                }),
            IconButton(
              icon: Icon(
                LineIcons.home,
                color: Colors.grey,
              ),
              onPressed: () => _webViewController?.loadUrl(url),
            ),
            IconButton(
              icon: Icon(
                LineIcons.angleLeft,
                color: Colors.grey,
              ),
              onPressed: _canGoBack ? _webViewController?.goBack : null,
            ),
            IconButton(
              icon: Icon(
                LineIcons.angleRight,
                color: Colors.grey,
              ),
              onPressed: _canGoForward ? _webViewController?.goForward : null,
            ),
          ],
        ),
      ],
    );
  }
}
