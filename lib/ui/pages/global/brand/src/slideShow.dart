import 'package:closet_app_xxx/controllers/pages/global/brand_view_page_controller.dart';
import 'package:closet_app_xxx/controllers/pages/timeline/ranking_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/cache_image.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/pages/global/account/account_page.dart';
import 'package:closet_app_xxx/ui/pages/global/clothes/clothes_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:line_icons/line_icons.dart';

class SlideShow extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clothesList =
        ref.watch(brandViewPageProvider.select((value) => value.clothesList));

    return clothesList.isEmpty
        ? Center(
            child: Icon(
            LineIcons.tShirt,
            size: 50,
          ))
        : CarouselSlider.builder(
            itemCount: clothesList.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              final clothes = clothesList[itemIndex];
              return Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12)),
                child: SingleChildScrollView(
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ClothesViewScreen(clothes: clothes)));
                        },
                        child: SizedBox(
                          height: 400,
                          child: CacheImage(imageURL: clothes.imageURL),
                        ),
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
