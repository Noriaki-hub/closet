import 'package:closet_app_xxx/ui/libs/app_colors.dart';
import 'package:closet_app_xxx/ui/libs/widgets.dart';
import 'package:closet_app_xxx/ui/pages/closet/buy_screen/buy_step_screen.dart';
import 'package:closet_app_xxx/ui/pages/closet/calender_screen/calender_screen.dart';
import 'package:closet_app_xxx/ui/pages/closet/closet_page.dart';
import 'package:closet_app_xxx/ui/pages/closet/sell_screen/sellStep_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabInfo {
  String label;
  Widget widget;
  TabInfo(this.label, this.widget);
}

class ClosetTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<TabInfo> _tabs = [
      TabInfo("クローゼット", ClosetPage()),
      TabInfo("購入", BuyStepScreen()),
      TabInfo("売却", SellStepScreen()),
      TabInfo("収支", CalenderScreen()),
    ];
    return DefaultTabController(
      length: _tabs.length,
      child: GlassScaffold(
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
