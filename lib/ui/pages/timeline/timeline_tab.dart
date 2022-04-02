import 'package:closet_app_xxx/ui/pages/timeline/clothes/clothes_log_page.dart';
import 'package:closet_app_xxx/ui/pages/timeline/share/media_log_page.dart';
import 'package:closet_app_xxx/ui/pages/timeline/share/shop_log_page.dart';
import 'package:flutter/material.dart';

class TabInfo {
  String label;
  Widget widget;
  TabInfo(this.label, this.widget);
}

class TimeLineTab extends StatelessWidget {
  final List<TabInfo> _tabs = [
    TabInfo("服ログ", ClothesLogPage()),
    TabInfo("メディア", MediaLogPage()),
    TabInfo("ショップ", ShopLogPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown.shade50,
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
