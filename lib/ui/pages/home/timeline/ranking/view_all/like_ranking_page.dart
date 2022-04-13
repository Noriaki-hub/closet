import 'package:closet_app_xxx/controllers/pages/timeline/like_ranking_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'src/likeRankingList.dart';
import 'src/like_category_controller.dart';

class LikeRankingPape extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(likeRankingPageProvider.select((value) => value.isLoading));
    final isAddClothes = ref
        .watch(likeRankingPageProvider.select((value) => value.isAddClothes));
    final isScrollLoading = ref.watch(
        likeRankingPageProvider.select((value) => value.isScrollLoading));
    final Size size = MediaQuery.of(context).size;
    return isLoading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown.shade50,
            body: Center(
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(height: 50, child: LikeCategoryController()),
                  RefreshIndicator(
                    onRefresh: () async {
                      await ref
                          .read(likeRankingPageProvider.notifier)
                          .pullToRefresh();
                    },
                    child: NotificationListener<ScrollEndNotification>(
                        onNotification: (notification) {
                          final metrics = notification.metrics;
                          if (isAddClothes &&
                              !isScrollLoading &&
                              metrics.extentAfter == 0) {
                            ref
                                .read(likeRankingPageProvider.notifier)
                                .endScroll();
                          }
                          return true;
                        },
                        child: RefreshIndicator(
                            onRefresh: () async {
                              await ref
                                  .read(likeRankingPageProvider.notifier)
                                  .pullToRefresh();
                            },
                            child: SizedBox(
                                height: size.height,
                                child: LikeRankingList()))),
                  ),
                ]),
              ),
            ));
  }
}
