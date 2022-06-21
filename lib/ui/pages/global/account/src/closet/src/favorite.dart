import 'package:closet_app_xxx/controllers/pages/home/closet_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/cache_image.dart';
import 'package:closet_app_xxx/ui/libs/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ClosetFavorite extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final closetFavorite =
        ref.watch(ClosetPageProvider.select((value) => value.closetFavorite));
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
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: closetFavorite.length,
              itemBuilder: (BuildContext context, int index) {
                final item = closetFavorite[index];
                return GlassContainer(
                    borderRadius: BorderRadius.circular(15),
                    width: 150,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: 140,
                            height: 140,
                            child: CacheImage(imageURL: item.imageURL),
                          ),
                        ),
                      ],
                    ));
              },
            ),
          );
  }
}
