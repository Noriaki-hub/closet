import 'package:closet_app_xxx/ui/pages/timeline/clothes/clothes_log_page.dart';
import 'package:closet_app_xxx/ui/pages/timeline/src/tab_info.dart';
import 'package:flutter/material.dart';

import 'follow_clothes_log.dart';



class ClothesLogTab extends StatelessWidget {
  final List<TabInfo> _tabs = [


    TabInfo("全てのユーザー", ClothesLogPage()),
    TabInfo("フォロー中のユーザー", FollowLogPage()),
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
