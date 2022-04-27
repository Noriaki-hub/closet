import 'package:closet_app_xxx/ui/libs/tab_info.dart';
import 'package:closet_app_xxx/ui/libs/web_view.dart';

import 'package:flutter/material.dart';

class MediaTab extends StatelessWidget {
  final List<TabInfo> _tabs = [
    TabInfo(
        "HYPEBEAST",
        WebViewScreen(
          genre: 'media',
          url: 'https://hypebeast.com/jp',
        )),
    TabInfo(
        "FASHION PRESS",
        WebViewScreen(
          genre: 'media',
          url: 'https://www.fashion-press.net/',
        )),
    TabInfo(
        "WWD",
        WebViewScreen(
          genre: 'media',
          url: 'https://www.wwdjapan.com/',
        )),
    TabInfo(
        "VOGUE",
        WebViewScreen(
          genre: 'media',
          url: 'https://www.vogue.co.jp/',
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          title: PreferredSize(
            child: TabBar(
              isScrollable: true,
              tabs: _tabs.map((TabInfo tab) {
                return Tab(text: tab.label);
              }).toList(),
            ),
            preferredSize: Size.fromHeight(30.0),
          ),
        ),
        body: TabBarView(children: _tabs.map((tab) => tab.widget).toList()),
      ),
    );
  }
}
