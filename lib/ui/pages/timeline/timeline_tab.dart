import 'package:closet_app_xxx/ui/pages/timeline/clothes/clothes_log_tab.dart';
import 'package:closet_app_xxx/ui/pages/timeline/media/media_log_tab.dart';
import 'package:closet_app_xxx/ui/pages/timeline/ranking/ranking_tab.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'shop/shop_log_tab.dart';

class TabInfo {
  String label;
  Widget widget;
  TabInfo(this.label, this.widget);
}

class TimeLineTab extends StatelessWidget {
  final List<TabInfo> _tabs = [
    TabInfo("ランキング",RankingTab()),
    TabInfo("服ログ", ClothesLogTab()),
    TabInfo("メディア", MediaLogTab()),
    TabInfo("ショップ", ShopLogTab()),
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
              indicator: DotIndicator(
                color: Colors.black45,
                distanceFromCenter: 16,
                radius: 3,
                paintingStyle: PaintingStyle.fill,
              ),
              unselectedLabelStyle: TextStyle(fontSize: 15),
              unselectedLabelColor: Colors.black45,
              isScrollable: true,
              labelColor: Colors.black45,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
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
