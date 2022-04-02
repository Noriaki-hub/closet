
import 'package:closet_app_xxx/controllers/pages/media_log_page_controller.dart';
import 'package:closet_app_xxx/controllers/pages/shop_log_page_controller.dart';
import 'package:closet_app_xxx/ui/pages/timeline/share/src/shop_time_line_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class ShopLogPage extends HookConsumerWidget {


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery
        .of(context)
        .size;
    final isLoading = ref.watch(
        MediaLogPageProvider.select((value) => value.isLoading));
    final timeLineList = ref.watch(
        MediaLogPageProvider.select((value) => value.timeLineList));
    return Scaffold(
        backgroundColor: Colors.brown.shade50,
        body: Center(
          child: RefreshIndicator(
            onRefresh: () async {
              await ref.read(ShopLogPageProvider.notifier).fetchTimeLine();
            },
            child: SingleChildScrollView(
              child: SizedBox(
                  height: size.height * 5 / 6,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await ref.read(ShopLogPageProvider.notifier)
                          .fetchTimeLine();
                    },
                    child: NotificationListener<ScrollEndNotification>(
                        onNotification: (notification) {
                          final metrics = notification.metrics;
                          if (!isLoading &&
                              metrics.extentAfter == 0) {
                            ref.read(ShopLogPageProvider.notifier).endScroll();
                          }
                          return true;
                        },
                        child: ShopTimeLineList()),
                  )),
            ),
          ),
        )
    );
  }
}