
import 'package:closet_app_xxx/Screen/friends/friends_search_screen.dart';
import 'package:closet_app_xxx/Screen/shop_screen/shop_screen.dart';
import 'package:closet_app_xxx/Screen/timeline/timeline_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'friends/friends_screen.dart';
import 'home/home_screen.dart';


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
    ShopScreen(),
    FriendsScreen(),
    FriendsSearchScreen(),
    HomeScreen()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade200,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.perm_media_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.supervisor_account_rounded),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
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