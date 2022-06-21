import 'package:closet_app_xxx/ui/libs/app_colors.dart';
import 'package:closet_app_xxx/ui/libs/widgets.dart';
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
      child: GlassScaffold(
        extendBodyBehindAppBar: false,
        appBar: GlassAppBar(
          title: TabBar(
            indicatorColor: AppColors.theme,
            labelColor: AppColors.theme,
            unselectedLabelColor: AppColors.text,
            isScrollable: true,
            tabs: _tabs.map((TabInfo tab) {
              return Tab(text: tab.label);
            }).toList(),
          ),
        ),
        body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: _tabs.map((tab) => tab.widget).toList()),
      ),
    );
  }
}
