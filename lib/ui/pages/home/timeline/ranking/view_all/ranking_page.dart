import 'package:closet_app_xxx/controllers/pages/timeline/price_ranking_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/category_controller.dart';
import 'src/priceRankingList.dart';

class RankingPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(priceRankingPageProvider.select((value) => value.isLoading));
    final isAddClothes =
        ref.watch(priceRankingPageProvider.select((value) => value.isAddClothes));
     final isScrollLoading =
        ref.watch(priceRankingPageProvider.select((value) => value.isScrollLoading));
    final Size size = MediaQuery.of(context).size;
    return isLoading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: Center(
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(height: 50, child: CategoryController()),
                  RefreshIndicator(
                    onRefresh: () async {
                      await ref
                          .read(priceRankingPageProvider.notifier)
                          .pullToRefresh();
                    },
                    child: NotificationListener<ScrollEndNotification>(
                        onNotification: (notification) {
                          final metrics = notification.metrics;
                          if (isAddClothes &&
                              !isScrollLoading &&
                              metrics.extentAfter == 0) {
                            ref.read(priceRankingPageProvider.notifier).endScroll();
                          }
                          return true;
                        },
                        child: RefreshIndicator(
                            onRefresh: () async {
                              await ref
                                  .read(priceRankingPageProvider.notifier)
                                  .pullToRefresh();
                            },
                            child: SizedBox(
                                height: size.height,
                                child: PriceRankingList()))),
                  ),
                ]),
              ),
            ));
  }
}
