import 'package:closet_app_xxx/ui/pages/timeline/ranking/like_ranking_page.dart';
import 'package:closet_app_xxx/ui/pages/timeline/ranking/ranking_page.dart';
import 'package:flutter/material.dart';

class TabInfo {
  String label;
  Widget widget;
  TabInfo(this.label, this.widget);
}

class RankingTab extends StatelessWidget {
  final List<TabInfo> _tabs = [
    TabInfo("購入額", RankingPape()),
    TabInfo("いいね数", LikeRankingPape()),
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
