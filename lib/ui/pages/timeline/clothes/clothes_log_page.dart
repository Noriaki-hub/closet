
import 'package:closet_app_xxx/controllers/pages/time_line_page_controller.dart';
import 'package:closet_app_xxx/ui/pages/timeline/clothes/src/time_line_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class ClothesLogPage extends HookConsumerWidget {


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery
        .of(context)
        .size;
    final isLoading = ref.watch(
        TimeLinePageProvider.select((value) => value.isLoading));
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async {
            await ref.read(TimeLinePageProvider.notifier).fetchTimeLine();
          },
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height * 5 / 6,
              child: NotificationListener<ScrollEndNotification>(
                  onNotification: (notification) {
                    final metrics = notification.metrics;
                    if (!isLoading && metrics.extentAfter == 0) {
                      ref.read(TimeLinePageProvider.notifier).endScroll();
                    }
                    return true;
                  },
                  child: RefreshIndicator(
                      onRefresh: () async {
                        await ref.read(TimeLinePageProvider.notifier)
                            .fetchTimeLine();
                      },
                      child: TimeLineList()
                  )),
            ),
          ),
        ),
      ),
    );
  }
}





