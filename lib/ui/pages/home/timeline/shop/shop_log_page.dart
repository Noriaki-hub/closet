import 'package:closet_app_xxx/controllers/pages/timeline/shop_log_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/pages/home/timeline/shop/src/shop_log_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShopLogPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final isLoading =
        ref.watch(shopLogPageProvider.select((value) => value.isLoading));
    final isScrollLoading =
        ref.watch(shopLogPageProvider.select((value) => value.isScrollLoading));
    return isLoading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown.shade50,
            body: Center(
              child: RefreshIndicator(
                onRefresh: () async {
                  await ref.read(shopLogPageProvider.notifier).fetchTimeLine();
                },
                child: SingleChildScrollView(
                    child: SizedBox(
                  height: size.height * 5 / 6,
                  child: NotificationListener<ScrollEndNotification>(
                      onNotification: (notification) {
                        final metrics = notification.metrics;
                        if (!isScrollLoading && metrics.extentAfter == 0) {
                          ref.read(shopLogPageProvider.notifier).endScroll();
                        }
                        return true;
                      },
                      child: RefreshIndicator(
                          onRefresh: () async {
                            await ref
                                .read(shopLogPageProvider.notifier)
                                .fetchTimeLine();
                          },
                          child: ShopLogList())),
                )),
              ),
            ),
          );
  }
}
