import 'package:closet_app_xxx/controllers/pages/home/home_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/cache_image.dart';
import 'package:closet_app_xxx/ui/libs/navigation.dart';
import 'package:closet_app_xxx/ui/pages/global/clothes/clothes_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ClosetFavorite extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final closetFavorite =
        ref.watch(HomePageProvider.select((value) => value.closetFavorite));
    return closetFavorite.isEmpty
        ? Center(
            child: Text(
            'お気に入りは空です',
            style: TextStyle(color: Colors.black45),
          ))
        : Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: (5 / 4),
              ),
              scrollDirection: Axis.horizontal,
              itemCount: closetFavorite.length,
              itemBuilder: (BuildContext context, int index) {
                final item = closetFavorite[index];
                return GestureDetector(
                    onTap: () => Navigation().transition(
                        context: context,
                        widget: ClothesViewScreen(clothes: item)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          color: Colors.white,
                          child: CacheImage(imageURL: item.imageURL)),
                    ));
              },
            ),
          );
  }
}
