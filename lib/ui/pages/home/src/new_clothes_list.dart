import 'package:closet_app_xxx/controllers/pages/timeline/ranking_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/cache_image.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
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

    return newClothesList.isEmpty
        ? Loading()
        : CarouselSlider.builder(
            itemCount: newClothesList.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              final clothesMap = newClothesList[itemIndex];
              return Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12)),
                child: SingleChildScrollView(
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      SizedBox(
                        height: 400,
                        child:
                            CacheImage(imageURL: clothesMap.clothes.imageURL),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2), //色
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Image.network(
                                        clothesMap.user.image,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(clothesMap.user.name,   style: TextStyle(color: Colors.white),),
                              ],
                            ),
                            Text(
                              '購入日' +
                                  clothesMap.clothes.month +
                                  '/' +
                                  clothesMap.clothes.day,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 400,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
            ));
  }
}
