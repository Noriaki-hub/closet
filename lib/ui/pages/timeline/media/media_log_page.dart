import 'package:closet_app_xxx/controllers/pages/timeline/media_log_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/pages/timeline/media/src/time_line_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MediaLogPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final isLoading =
        ref.watch(mediaLogPageProvider.select((value) => value.isLoading));
    final isScrollLoading = ref
        .watch(mediaLogPageProvider.select((value) => value.isScrollLoading));
    return isLoading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown.shade50,
            body: Center(
              child: RefreshIndicator(
                onRefresh: () async {
                  await ref.read(mediaLogPageProvider.notifier).fetchTimeLine();
                },
                child: SingleChildScrollView(
                    child: SizedBox(
                  height: size.height * 5 / 6,
                  child: NotificationListener<ScrollEndNotification>(
                      onNotification: (notification) {
                        final metrics = notification.metrics;
                        if (!isScrollLoading && metrics.extentAfter == 0) {
                          ref.read(mediaLogPageProvider.notifier).endScroll();
                        }
                        return true;
                      },
                      child: RefreshIndicator(
                          onRefresh: () async {
                            await ref
                                .read(mediaLogPageProvider.notifier)
                                .fetchTimeLine();
                          },
                          child: TimeLineList())),
                )),
              ),
            ),
          );
  }
}
