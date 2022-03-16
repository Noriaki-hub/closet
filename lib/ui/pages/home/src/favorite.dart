import 'package:closet_app_xxx/controllers/pages/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ClosetFavorite extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final closetFavorite = ref.watch(HomePageProvider.select((value) => value.closetFavorite));
    return GridView.builder(
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
        return Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      color: Colors.white,
                      child: Image.network(
                        item.imageURL,
                        fit: BoxFit.cover,
                      )
                  ),
                )
            )
        );
      },
    );
  }

}