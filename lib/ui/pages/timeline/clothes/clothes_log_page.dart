import 'package:closet_app_xxx/controllers/pages/timeline/log_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/pages/timeline/clothes/src/time_line_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ClothesLogPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
     final isScrollLoading =
        ref.watch(timeLinePageProvider.select((value) => value.isScrollLoading));
    final isLoading =
        ref.watch(timeLinePageProvider.select((value) => value.isLoading));
    final isAddClothes =
        ref.watch(timeLinePageProvider.select((value) => value.isAddClothes));
    return isLoading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown.shade50,
            body: Center(
              child: RefreshIndicator(
                onRefresh: () async {
                  await ref.read(timeLinePageProvider.notifier).pullToRefresh();
                },
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: size.height * 0.8,
                    child: NotificationListener<ScrollEndNotification>(
                        onNotification: (notification) {
                          final metrics = notification.metrics;
                          if (isAddClothes &&
                              !isScrollLoading &&
                              metrics.extentAfter == 0) {
                            ref.read(timeLinePageProvider.notifier).endScroll();
                          }
                          return true;
                        },
                        child: RefreshIndicator(
                            onRefresh: () async {
                              await ref
                                  .read(timeLinePageProvider.notifier)
                                  .pullToRefresh();
                            },
                            child: TimeLineList())),
                  ),
                ),
              ),
            ),
          );
  }
}
