import 'package:closet_app_xxx/ui/pages/home/timeline/clothes/clothes_log_tab.dart';
import 'package:closet_app_xxx/ui/pages/home/timeline/media/media_log_tab.dart';
import 'package:closet_app_xxx/ui/pages/home/timeline/shop/shop_log_tab.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'ranking/ranking_tab.dart';

class TimelineTabPage extends StatefulWidget {
  TimelineTabPage({required this.currentIndex});

  final int currentIndex;
  @override
  _TimelineTabPageState createState() {
    return _TimelineTabPageState(currentIndex: currentIndex);
  }
}

class _TimelineTabPageState extends State<TimelineTabPage> {
  _TimelineTabPageState({required this.currentIndex});

  int currentIndex;

  final _pageWidgets = [
    RankingTab(),
    ClothesLogTab(),
    MediaLogTab(),
    ShopLogTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(

        backgroundColor: Colors.grey.shade100,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(LineIcons.angleDown),
      ),
      body: _pageWidgets.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade100,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: const Icon(LineIcons.crown), label: ''),
          BottomNavigationBarItem(
              icon: const Icon(LineIcons.stream), label: ''),
          BottomNavigationBarItem(
              icon: const Icon(LineIcons.newspaperAlt), label: ''),
          BottomNavigationBarItem(
              icon: const Icon(LineIcons.shoppingCart), label: ''),
        ],
        currentIndex: currentIndex,
        fixedColor: Colors.black,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  _onItemTapped(int index) => setState(() => currentIndex = index);
}
