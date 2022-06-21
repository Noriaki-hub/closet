import 'package:closet_app_xxx/controllers/admin/notice_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/app_colors.dart';
import 'package:closet_app_xxx/ui/libs/widgets.dart';
import 'package:closet_app_xxx/ui/libs/navigation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import 'infomation_page.dart';

class NoticePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notices =
        ref.watch(noticePageProvider.select((value) => value.notices));

    return GlassScaffold(
      appBar: GlassAppBar(
        leading: Container(),
        title: Text(
          'お知らせ',
          style: TextStyle(color: AppColors.text),
        ),
        actions: [
          InkWell(
            onTap: () => Navigation()
                .transition(context: context, widget: InfomationPage()),
            child: const Icon(
              LineIcons.info,
              color: Colors.black45,
            ),
          ),
        ],
      ),
      body: GlassContainer(
        height: double.infinity,
        width: double.infinity,
        borderRadius: BorderRadius.zero,
        child: Center(
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
                    style: TextStyle(color: AppColors.text),
                  ),
                  trailing: Text(notice.date,
                      style: TextStyle(color: AppColors.text)),
                );
              }),
        ),
      ),
    );
  }
}
