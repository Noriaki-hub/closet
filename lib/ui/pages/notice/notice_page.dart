import 'package:closet_app_xxx/controllers/admin/notice_page_controller.dart';
import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/ui/pages/notice/add_notice_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import 'infomation_page.dart';

class NoticePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notices =
        ref.watch(noticePageProvider.select((value) => value.notices));
        final userId =
        ref.watch(userProvider.select((value) => value.user.uid));
    return Scaffold(
      appBar: AppBar(
        title: Text('お知らせ'),
        backgroundColor: Colors.grey.shade100,
        
      ),
      floatingActionButton: userId != 'H7YUdyEcCPepJP3SP5iA3SzE7ws1' ? FloatingActionButton(
        backgroundColor: Colors.grey.shade100,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InfomationPage()));
        },
        child: const Icon(
          LineIcons.info,
          color: Colors.black45,
        ),
      ): FloatingActionButton(
        backgroundColor: Colors.grey.shade100,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNoticePage()));
        },
        child: const Icon(
          LineIcons.plus,
          color: Colors.black45,
        )),
      backgroundColor: Colors.grey.shade50,
      body: Center(
        child: ListView.builder(
            itemCount: notices.length,
            itemBuilder: (BuildContext context, int index) {
              final notice = notices[index];
              return ListTile(
                leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        notice.image,
                        fit: BoxFit.cover,
                      ),
                    )),
                title: Text(
                  notice.title,
                  style: TextStyle(color: Colors.black54),
                ),
                trailing:
                    Text(notice.date, style: TextStyle(color: Colors.black45)),
              );
            }),
      ),
    );
  }

}
