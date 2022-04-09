import 'package:closet_app_xxx/controllers/pages/timeline/ranking_page_controller.dart';
import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/ui/libs/cache_image.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/pages/home/account/account_page.dart';
import 'package:closet_app_xxx/ui/pages/home/clothes/clothes_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Tile extends HookConsumerWidget {
  Tile({
    required this.clothes,
    required this.user,
  });

  final UserModel user;
  final Clothes clothes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return user.image == ''
        ? Loading()
        : GridTile(
            header: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountPage(
                        userId: user.uid,
                      ),
                    ));
              },
              child: GridTileBar(
                backgroundColor: Colors.white,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.network(
                        user.image,
                        fit: BoxFit.cover,
                      )),
                ),
                title: Text(
                  user.name,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            child: InkWell(
              onTap: () async {
                final result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return ClothesViewScreen(clothes: clothes);
                }));
                if (result) {
                  ref.read(rankingPageProvider.notifier).fetch();
                }
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CacheImage(
                    imageURL: clothes.imageURL,
                  )),
            ),
            footer: GridTileBar(
                backgroundColor: Colors.white,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(clothes.brands,
                        style: TextStyle(color: Colors.black45)),
                    Text(clothes.year + '/' + clothes.month + '/' + clothes.day,
                        style: TextStyle(color: Colors.black45)),
                  ],
                )));
  }
}
