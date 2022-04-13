
import 'package:closet_app_xxx/ui/pages/home/timeline/ranking/timeline_tab.dart';
import 'package:closet_app_xxx/ui/pages/home/timeline/ranking/view_all/like_ranking_page.dart';
import 'package:closet_app_xxx/ui/pages/home/timeline/ranking/view_all/ranking_page.dart';
import 'package:flutter/material.dart';



class RankingTab extends StatelessWidget {
  final List<TabInfo> _tabs = [
    TabInfo("購入額", RankingPage()),
    TabInfo("いいね数", LikeRankingPape()),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          backgroundColor: Colors.brown.shade50,
          title: PreferredSize(
            child: TabBar(
              indicatorWeight: 1,
              labelColor: Colors.black45,
              unselectedLabelColor: Colors.black45,
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
