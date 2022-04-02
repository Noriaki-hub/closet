import 'package:closet_app_xxx/controllers/pages/account_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/cache_image.dart';
import 'package:closet_app_xxx/ui/pages/home/clothes/clothes_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountFavorite extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final closetFavorite =
        ref.watch(accountPageProvider.select((value) => value.closetFavorite));
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: closetFavorite.length == 0
          ? Container()
          : GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: (5 / 4),
              ),
              itemCount: closetFavorite.length,
              itemBuilder: (BuildContext context, int index) {
                final item = closetFavorite[index];
                return InkWell(
                    onTap: () async {
                      final result = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ClothesViewScreen(clothes: item);
                      }));
                      if (result) {
                        ref
                            .read(accountPageProvider.notifier)
                            .fetchAccountPageData();
                      }
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CacheImage(imageURL: item.imageURL)));
              }),
    );
  }
}
