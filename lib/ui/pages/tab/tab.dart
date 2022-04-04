import 'package:closet_app_xxx/controllers/admin/config_controller.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/pages/follow/follow_tab.dart';
import 'package:closet_app_xxx/ui/pages/home/home_page.dart';
import 'package:closet_app_xxx/ui/pages/maintenance_page.dart';
import 'package:closet_app_xxx/ui/pages/media/media_screen.dart';
import 'package:closet_app_xxx/ui/pages/shop/shop_page.dart';
import 'package:closet_app_xxx/ui/pages/timeline/timeline_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import 'src/account_image.dart';

class BottomTabPage extends ConsumerStatefulWidget {
  @override
  _BottomTabPageState createState() {
    return _BottomTabPageState();
  }
}

class _BottomTabPageState extends ConsumerState<BottomTabPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final isMaintenance =
        ref.watch(configProvider.select((value) => value.isMaintenance));

    final _pageWidgets = [
      TimeLineTab(),
      FollowTab(),
      HomePage(),
      MediaPage(),
      ShopScreen(),
    ];

    return isMaintenance == null
        ? Loading()
        : isMaintenance
            ? MaintenancePage()
            : Scaffold(
                body: _pageWidgets.elementAt(_currentIndex),
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Colors.grey.shade200,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: const Icon(LineIcons.stream), label: 'ログ'),
                    BottomNavigationBarItem(
                        icon: const Icon(LineIcons.userFriends), label: 'フォロー'),
                    BottomNavigationBarItem(icon: AccountImage(), label: 'ホーム'),
                    BottomNavigationBarItem(
                        icon: const Icon(LineIcons.newspaper), label: 'メディア'),
                    BottomNavigationBarItem(
                        icon: const Icon(LineIcons.shoppingCart),
                        label: 'ショップ'),
                  ],
                  currentIndex: _currentIndex,
                  fixedColor: Colors.white,
                  onTap: _onItemTapped,
                  type: BottomNavigationBarType.fixed,
                ),
              );
  }

  _onItemTapped(int index) => setState(() => _currentIndex = index);
}
