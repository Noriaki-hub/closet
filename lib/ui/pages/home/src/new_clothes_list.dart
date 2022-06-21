import 'package:closet_app_xxx/controllers/pages/timeline/ranking_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/widgets.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/libs/navigation.dart';
import 'package:closet_app_xxx/ui/pages/global/clothes/clothes_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'ranking_list_model.dart';

class NewClothesList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newClothesMap =
        ref.watch(rankingPageProvider.select((value) => value.newClothesMap));
    final newClothesList =
        newClothesMap.entries.map((e) => Ranking(e.key, e.value)).toList();
    final navigation = Navigation();

    return newClothesList.isEmpty
        ? Loading()
        : CarouselSlider(
            items: newClothesList.map((clothes) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                      onTap: () {
                        navigation.transition(
                            context: context,
                            widget:
                                ClothesViewScreen(clothes: clothes.clothes));
                      },
                      child: GlassContainer(
                        borderRadius: BorderRadius.circular(12),
                        height: 0,
                        width: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 300,
                                width: 250,
                                child: Image.network(
                                  clothes.clothes.imageURL,
                                  fit: BoxFit.cover,
                                )),
                          ],
                        ),
                      ));
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ));
  }
}
