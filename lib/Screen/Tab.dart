
import 'package:closet_app_xxx/Screen/home/home_page.dart';
import 'package:closet_app_xxx/Screen/news/news_screen.dart';
import 'package:closet_app_xxx/Screen/shop/shop_screen.dart';
import 'package:closet_app_xxx/Screen/timeline/timeline_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'friends/follow_tab.dart';


class BottomTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomTabPageState();
  }
}

class _BottomTabPageState extends State<BottomTabPage> {

  int _currentIndex = 0;
  final _pageWidgets = [
    TimeLineScreen(),
    FollowTab(),
    HomePage(),
    NewsScreen(),
    ShopScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade200,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(LineIcons.stream), label: 'タイムライン'),
          BottomNavigationBarItem(icon: Icon(LineIcons.userFriends),label: 'フォロー'),
          BottomNavigationBarItem(icon: Icon(LineIcons.home),label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(LineIcons.newspaper), label: 'メディア'),
          BottomNavigationBarItem(icon: Icon(LineIcons.shoppingCart),label: 'ショップ'),
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.white,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _currentIndex = index );
}