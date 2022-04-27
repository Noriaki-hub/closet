import 'package:closet_app_xxx/ui/libs/tab_info.dart';
import 'package:closet_app_xxx/ui/pages/search/user/user_search_screen.dart';
import 'package:closet_app_xxx/ui/pages/search/brand/search_brand_page.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  final List<TabInfo> _tabs = [
    TabInfo("ユーザー", UserSearchScreen()),
    TabInfo("ブランド", SearchBrandPage()),
    // TabInfo("さがす", UserSearchScreen()),
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
