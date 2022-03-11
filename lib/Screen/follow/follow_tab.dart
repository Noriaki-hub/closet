import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../follow/src/user_search_screen.dart';
import '../follow/src/follow_screen.dart';
import '../follow/src/follower_screen.dart';


class TabInfo {
  String label;
  Widget widget;
  TabInfo(this.label, this.widget);
}

class FollowTab extends StatelessWidget{

  final List<TabInfo> _tabs = [
    TabInfo("フォロー", FollowPage()),
    TabInfo("フォロワー", FollowerPage()),
    TabInfo("さがす", UserSearchScreen()),

  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown.shade50,
          bottom: PreferredSize(
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