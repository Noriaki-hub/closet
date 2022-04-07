import 'package:closet_app_xxx/controllers/admin/notice_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NoticePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notices =
        ref.watch(noticePageProvider.select((value) => value.notices));
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: Center(
        child: ListView.builder(itemCount: notices.length, itemBuilder: (BuildContext context, int index) {
          final notice = notices[index];
          return ListTile(
            leading: SizedBox(height: 50, width: 50,child: ClipRRect(borderRadius: BorderRadius.circular(100),child: Image.network(notice.image, fit: BoxFit.cover,),)),
            title: Text(notice.title, style: TextStyle(color: Colors.black54),),
            trailing: Text(notice.date,style: TextStyle(color: Colors.black45)),

          );
        }),
      ),
    );
  }
}
