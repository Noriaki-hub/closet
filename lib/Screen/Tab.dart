
import 'package:closet_app_xxx/Screen/friends/friends_search_screen.dart';
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
    HomeScreen(),
    FriendsScreen(),
    FriendsSearchScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('')),
          BottomNavigationBarItem(icon: Icon(Icons.supervisor_account_rounded),title: Text('')),
          BottomNavigationBarItem(icon: Icon(Icons.search),title: Text('')),
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.blueAccent,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _currentIndex = index );
}