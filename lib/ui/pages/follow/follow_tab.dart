import 'package:closet_app_xxx/ui/pages/follow/src/follow_web.dart';
import 'package:flutter/material.dart';
import '../follow/src/follow_screen.dart';

class TabInfo {
  String label;
  Widget widget;
  TabInfo(this.label, this.widget);
}

class FollowTab extends StatelessWidget {
  final List<TabInfo> _tabs = [
    TabInfo("ユーザー", FollowPage()),
    TabInfo("ブランド", FollowBrandPage()),
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
