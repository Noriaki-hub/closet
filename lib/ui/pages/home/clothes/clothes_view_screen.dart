import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/controllers/pages/home/clothes_view_page_controller.dart';
import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/ui/libs/cache_image.dart';
import 'package:closet_app_xxx/ui/libs/floating_action_button_animation.dart';
import 'package:closet_app_xxx/ui/libs/like/like_button.dart';
import 'package:closet_app_xxx/ui/pages/home/clothes/clothes_edit_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class ClothesViewScreen extends StatelessWidget {
  ClothesViewScreen({
    Key? key,
    this.userId,
    required this.clothes,
  }) : super(key: key);

  final String? userId;
  final Clothes clothes;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        clothesViewPageProvider.overrideWithProvider(
          clothesViewPageProviderFamily(
            ClothesViewPageProviderArg(clothes: clothes, userId: userId),
          ),
        ),
      ],
      child: _ClothesViewScreen(),
    );
  }
}

class _ClothesViewScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final clothes =
        ref.watch(clothesViewPageProvider.select((value) => value.clothes));
    final currentUserId =
        ref.watch(userProvider.select((value) => value.user.uid));
    final isFavoriteState = ref.watch(
        clothesViewPageProvider.select((value) => value.isFavoriteState));
    final buyingFormState = ref.watch(
        clothesViewPageProvider.select((value) => value.buyingFormState));

    return clothes == null
        ? Scaffold()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.brown.shade50,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                icon: Icon(Icons.close),
              ),
            ),
            floatingActionButton: clothes.uid == currentUserId
                ? ExpandableFab(
                    distance: 112.0,
                    children: [
                      isFavoriteState
                          ? ActionButton(
                              onPressed: () async {
                                await ref
                                    .read(clothesViewPageProvider.notifier)
                                    .changeFavoriteStateFalse();
                              },
                              icon: Icon(
                                LineIcons.starAlt,
                                color: Colors.yellow,
                              ),
                            )
                          : ActionButton(
                              onPressed: () async {
                                await ref
                                    .read(clothesViewPageProvider.notifier)
                                    .changeFavoriteStateTrue();
                              },
                              icon: Icon(
                                LineIcons.starAlt,
                                color: isFavoriteState
                                    ? Colors.yellow
                                    : Colors.black,
                              ),
                            ),
                      ActionButton(
                        onPressed: () async {
                          final result = await _showDialog(context);
                          if (result) {
                            ref
                                .read(clothesViewPageProvider.notifier)
                                .deleteClothes();
                            Navigator.pop(context, true);
                          }
                        },
                        icon: Icon(LineIcons.alternateTrashAlt),
                      ),
                      ActionButton(
                          onPressed: () async {
                            final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ClothesEditPage(
                                          itemId: clothes.itemId,
                                        )));
                            if (result) {
                              ref
                                  .read(clothesViewPageProvider.notifier)
                                  .fetchClothes();
                            }
                          },
                          icon: const Icon(LineIcons.edit)),
                    ],
                  )
                : Container(),
            backgroundColor: Colors.brown.shade50,
            body: SingleChildScrollView(
              child: SizedBox(
                height: 1500,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 2 / 3,
                        child: GestureDetector(
                            child: CacheImage(imageURL: clothes.imageURL)),
                      ),
                      Container(
                        width: double.infinity,
                        height: 80,
                        color: Colors.white.withOpacity(0.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: size.width * 2 / 3,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Text(
                                        clothes.brands,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: LikeButton(itemId: clothes.itemId),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          '詳細',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: double.infinity,
                        color: Colors.white.withOpacity(0.5),
                        child: Text(
                          clothes.description,
                          style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.0075,
                              height: 1.5),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          '購入形態',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.white.withOpacity(0.5),
                        child: Center(
                          child: Text(
                            buyingFormState,
                            style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.0075,
                                height: 1.5),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text('購入日'),
                          ),
                          Container(
                            height: 50,
                            color: Colors.white.withOpacity(0.5),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  clothes.year +
                                      '/' +
                                      clothes.month +
                                      '/' +
                                      clothes.day,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      clothes.price.toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                    Text('円')
                                  ],
                                ),
                              ],
                            )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text('売却日'),
                          ),
                          Container(
                              height: 50,
                              color: Colors.white.withOpacity(0.5),
                              child: Center(
                                  child: clothes.isSell
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              clothes.sellingYear +
                                                  '/' +
                                                  clothes.sellingMonth +
                                                  '/' +
                                                  clothes.sellingDay,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  clothes.selling.toString(),
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                                Text('円')
                                              ],
                                            ),
                                          ],
                                        )
                                      : Text('まだ売却していません'))),
                        ],
                      )
                    ]),
              ),
            ),
          );
  }

  _showDialog(context) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('削除しますか？'),
          actions: [
            CupertinoDialogAction(
              child: Text('はい'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            CupertinoDialogAction(
              child: Text('いいえ'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ],
        );
      },
    );
  }
}
