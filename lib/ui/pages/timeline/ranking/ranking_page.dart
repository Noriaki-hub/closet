import 'package:closet_app_xxx/controllers/pages/ranking_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/pages/timeline/ranking/src/priceRankingList%20copy.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/category_controller.dart';

class RankingPape extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(rankingPageProvider.select((value) => value.isLoading));
    final isAddClothes =
        ref.watch(rankingPageProvider.select((value) => value.isAddClothes));
     final isScrollLoading =
        ref.watch(rankingPageProvider.select((value) => value.isScrollLoading));
    final Size size = MediaQuery.of(context).size;
    return isLoading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown.shade50,
            body: Center(
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(height: 50, child: CategoryController()),
                  RefreshIndicator(
                    onRefresh: () async {
                      await ref
                          .read(rankingPageProvider.notifier)
                          .pullToRefresh();
                    },
                    child: NotificationListener<ScrollEndNotification>(
                        onNotification: (notification) {
                          final metrics = notification.metrics;
                          if (isAddClothes &&
                              !isScrollLoading &&
                              metrics.extentAfter == 0) {
                            ref.read(rankingPageProvider.notifier).endScroll();
                          }
                          return true;
                        },
                        child: RefreshIndicator(
                            onRefresh: () async {
                              await ref
                                  .read(rankingPageProvider.notifier)
                                  .pullToRefresh();
                            },
                            child: SizedBox(
                                height: size.height * 0.65,
                                child: PriceRankingList()))),
                  ),
                ]),
              ),
            ));
  }
}
