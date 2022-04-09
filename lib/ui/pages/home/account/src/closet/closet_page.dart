import 'package:closet_app_xxx/controllers/pages/home/closet_page_controller.dart';
import 'package:closet_app_xxx/ui/pages/home/account/src/closet/src/category_controller.dart';
import 'package:closet_app_xxx/ui/pages/home/account/src/closet/src/closet.dart';
import 'package:closet_app_xxx/ui/pages/home/account/src/closet/src/favorite.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ClosetPage extends StatelessWidget {
  ClosetPage({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        ClosetPageProvider.overrideWithProvider(
          ClosetPageProviderFamily(
            ClosetPageProviderArg(userId: userId),
          ),
        ),
      ],
      child: _ClosetPage(),
    );
  }
}

class _ClosetPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final state = ref.watch(ClosetPageProvider);
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                state.user.name,
                style: TextStyle(color: Colors.black45, fontSize: 12),
              ),
              Text('さんのクローゼット',
                  style: TextStyle(color: Colors.black45, fontSize: 12))
            ],
          ),
          backgroundColor: Colors.brown.shade50,
        ),
        backgroundColor: Colors.brown.shade50,
        body: SizedBox(
          height: size.height,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                SizedBox(height: size.height * 1 / 5, child: ClosetFavorite()),
                ClosetController(),
                NotificationListener<ScrollEndNotification>(
                    onNotification: (notification) {
                      final metrics = notification.metrics;
                      if (!state.isLoading && metrics.extentAfter == 0) {
                        ref.read(ClosetPageProvider.notifier).endScroll();
                      }
                      return true;
                    },
                    child:
                        SizedBox(height: size.height * 2 / 5, child: Closet())),
              ]),
        ));
  }
}
