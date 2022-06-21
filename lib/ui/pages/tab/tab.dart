import 'dart:ui';

import 'package:closet_app_xxx/controllers/admin/config_controller.dart';
import 'package:closet_app_xxx/ui/libs/app_colors.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/pages/closet/closet_tab.dart';
import 'package:closet_app_xxx/ui/pages/home/home_page.dart';
import 'package:closet_app_xxx/ui/pages/maintenance_page.dart';
import 'package:closet_app_xxx/ui/pages/media/media_tab.dart';
import 'package:closet_app_xxx/ui/pages/notice/notice_page.dart';
import 'package:closet_app_xxx/ui/pages/search/serach_tab.dart';
import 'package:closet_app_xxx/ui/pages/update_message_page.dart';
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
    final isUpdateCheck =
        ref.watch(configProvider.select((value) => value.isUpdateCheck));

    final _pageWidgets = [
      // DevelopPage(),
      HomePage(),
      SearchTab(),
      ClosetTab(),
      MediaTab(),
      NoticePage(),
    ];

    return isUpdateCheck == null
        ? Loading()
        : isUpdateCheck
            ? UpdatePage()
            : isMaintenance == null
                ? Loading()
                : isMaintenance
                    ? MaintenancePage()
                    : Scaffold(
                        extendBody: true,
                        body: _pageWidgets.elementAt(_currentIndex),
                        bottomNavigationBar: PreferredSize(
                          preferredSize: Size(
                            double.infinity,
                            56.0,
                          ),
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                              child: BottomNavigationBar(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                items: <BottomNavigationBarItem>[
                                  BottomNavigationBarItem(
                                      icon: Icon(LineIcons.home), label: 'ホーム'),
                                  BottomNavigationBarItem(
                                      icon: const Icon(LineIcons.search),
                                      label: 'さがす'),
                                  BottomNavigationBarItem(
                                      icon: AccountImage(), label: 'アカウント'),
                                  BottomNavigationBarItem(
                                      icon: const Icon(LineIcons.newspaperAlt),
                                      label: 'メディア'),
                                  BottomNavigationBarItem(
                                      icon: const Icon(LineIcons.bellAlt),
                                      label: 'お知らせ'),
                                ],
                                currentIndex: _currentIndex,
                                fixedColor: AppColors.theme,
                                onTap: _onItemTapped,
                                type: BottomNavigationBarType.fixed,
                              ),
                            ),
                          ),
                        ),
                      );
  }

  _onItemTapped(int index) => setState(() => _currentIndex = index);
}
