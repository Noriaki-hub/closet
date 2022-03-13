
import 'package:closet_app_xxx/ui/pages/home/account_screen/account_screen.dart';
import 'package:closet_app_xxx/ui/pages/home/home_page.dart';
import 'package:closet_app_xxx/ui/pages/shop/shop_page.dart';
import 'package:closet_app_xxx/ui/pages/timeline/timeline_screen.dart';
import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import 'follow/follow_tab.dart';
import 'media/media_screen.dart';




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
    MediaPage(),
    ShopScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade200,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(LineIcons.stream), label: '服ログ'),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.userFriends), label: 'フォロー'),
          BottomNavigationBarItem(icon: Icon(LineIcons.home), label: 'ホーム'),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.newspaper), label: 'メディア'),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.shoppingCart), label: 'ショップ'),
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.white,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButton: Column(
        children: [
          SizedBox(height: 150,),
          SizedBox(
            height: 35,
            child: FloatingActionButton(onPressed: () {Navigator.push(context, MaterialPageRoute(
                builder: (context)=> AccountScreen()));},
              child: Consumer(
                builder: (context, ref, _) {
                  final accountImage = ref.watch(
                      userProvider.select((value) => value.user.image));
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      color: Colors.white,
                      child: Image.network(
                        accountImage,
                        width: 35,
                        height: 35,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _currentIndex = index);
}