import 'dart:io';
import 'dart:ui';
import 'package:closet_app_xxx/ui/libs/app_colors.dart';

import 'package:closet_app_xxx/ui/libs/share_log_button.dart';
import 'package:closet_app_xxx/ui/libs/widgets.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  final String genre;
  final bool? isNavigation;
  WebViewScreen({required this.url, required this.genre, this.isNavigation});
  @override
  _WebViewScreen createState() => _WebViewScreen(url, genre, isNavigation);
}

class _WebViewScreen extends State<WebViewScreen> {
  final String url;
  final String genre;
  final bool? isNavigation;
  double _height = 0;

  _WebViewScreen(this.url, this.genre, this.isNavigation);

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
    return GlassScaffold(
      extendBodyBehindAppBar: false,
      appBar: isNavigation == true ? GlassAppBar() : null,
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.theme,
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
      body: SingleChildScrollView(
        child: GlassContainer(
          borderRadius: BorderRadius.zero,
          width: double.infinity,
          height: _height,
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
              if (_webViewController != null) {
                double _contentHeight = double.parse(await _webViewController!
                    .runJavascriptReturningResult(
                        'document.documentElement.scrollHeight;'));

                _canGoBack = (await _webViewController?.canGoBack())!;
                _canGoForward = (await _webViewController?.canGoForward())!;
                setState(() {
                  _height = _contentHeight;
                });
              }
            },
            onWebResourceError: (error) {
              print("onWebResourceError : $error");
            },
          ),
        ),
      ),
      persistentFooterButtons: [
        GlassContainer(
          borderRadius: BorderRadius.circular(12),
          width: double.infinity,
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(LineIcons.alternateRedo, color: AppColors.white),
                onPressed: _webViewController?.reload,
              ),
              IconButton(
                  icon: Icon(LineIcons.shareSquareAlt, color: AppColors.white),
                  onPressed: () async {
                    final currentUrl = await _webViewController?.currentUrl();
                    Share.share(currentUrl!);
                  }),
              IconButton(
                icon: Icon(LineIcons.home, color: AppColors.white),
                onPressed: () => _webViewController?.loadUrl(url),
              ),
              IconButton(
                icon: Icon(LineIcons.angleLeft, color: AppColors.white),
                onPressed: _canGoBack ? _webViewController?.goBack : null,
              ),
              IconButton(
                icon: Icon(LineIcons.angleRight, color: AppColors.white),
                onPressed: _canGoForward ? _webViewController?.goForward : null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
