import 'package:closet_app_xxx/controllers/pages/home/home_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/widgets.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/pages/closet/src/favorite.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'src/category_controller.dart';
import 'src/closet.dart';

class ClosetPage extends ConsumerWidget {
  ClosetPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final state = ref.watch(HomePageProvider);
    return state.user.uid == ''
        ? Loading()
        : RefreshIndicator(
            onRefresh: () async {
              await ref.read(HomePageProvider.notifier).fetchHomePageData();
            },
            child: SingleChildScrollView(
              child: GlassContainer(
                borderRadius: BorderRadius.zero,
                width: double.infinity,
                height: size.height,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), //角の丸み
                              ),
                              side: const BorderSide(color: Colors.black45),
                            ),
                            child: Text(
                              '今月の収支',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: null),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35, right: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('購入額'),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                  height: 30,
                                  width: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 10, top: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Text(state.buying),
                                            Text('円')
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('売却額'),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                  height: 30,
                                  width: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 10, top: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Text(state.selling),
                                            Text('円')
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), //角の丸み
                              ),
                              side: const BorderSide(color: Colors.black45),
                            ),
                            child: Text(
                              'お気に入り',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: null),
                      ),
                      SizedBox(
                        height: size.height * 1 / 5,
                        child: ClosetFavorite(),
                      ),
                      ClosetController(),
                      NotificationListener<ScrollEndNotification>(
                          onNotification: (notification) {
                            final metrics = notification.metrics;
                            if (!state.isLoading && metrics.extentAfter == 0) {
                              ref.read(HomePageProvider.notifier).endScroll();
                            }
                            return true;
                          },
                          child: SizedBox(
                              height: size.height * 2 / 5,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                child: Closet(),
                              )))
                    ]),
              ),
            ),
          );
  }
}
