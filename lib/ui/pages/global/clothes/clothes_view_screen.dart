import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/controllers/pages/global/clothes_view_page_controller.dart';
import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/ui/libs/cache_image.dart';
import 'package:closet_app_xxx/ui/libs/floating_action_button_animation.dart';
import 'package:closet_app_xxx/ui/libs/like/like_button.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/pages/global/account/account_page.dart';
import 'package:closet_app_xxx/ui/pages/global/brand/brand_view_page.dart';
import 'package:closet_app_xxx/ui/pages/global/clothes/clothes_edit_page.dart';
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
    final brand =
        ref.watch(clothesViewPageProvider.select((value) => value.brand));
    final currentUserId =
        ref.watch(userProvider.select((value) => value.user.uid));
    final isFavoriteState = ref.watch(
        clothesViewPageProvider.select((value) => value.isFavoriteState));
    final buyingFormState = ref.watch(
        clothesViewPageProvider.select((value) => value.buyingFormState));

    return clothes == null || brand == null
        ? Loading()
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
                                          brandId: clothes.brandId,
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
            backgroundColor: Colors.grey.shade50,
            body: SingleChildScrollView(
              child: SizedBox(
                height: 1100,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 2 / 3,
                        child: GestureDetector(
                            child: CacheImage(imageURL: clothes.imageURL)),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 10, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildTitleArea(),
                            divider(),
                            buildAccountArea(),
                            divider(),
                            buildOtherArea(),
                            divider(),
                            buildComponentArea(),
                            divider(),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          );
  }

  Widget divider() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: const Divider(
        thickness: 1,
        color: Colors.black45,
      ),
    );
  }

  Widget buildTitleArea() {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final description = ref.watch(clothesViewPageProvider
          .select((value) => value.clothes?.description));
      final itemId = ref.watch(
          clothesViewPageProvider.select((value) => value.clothes?.itemId));
      final brand =
          ref.watch(clothesViewPageProvider.select((value) => value.brand));
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextButton(
            onPressed: () {
              if (brand != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BrandViewPage(brand: brand)));
              }
            },
            child: Text(brand?.brand_name_en ?? '')),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 300,
              child: Text(
                description ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20),
              ),
            ),
            itemId == null ? Container() : LikeButton(itemId: itemId)
          ],
        )
      ]);
    });
  }

  Widget buildAccountArea() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final user =
            ref.watch(clothesViewPageProvider.select((value) => value.user));
        return InkWell(
          onTap: (() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AccountPage(userId: user.uid)));
          }),
          child: Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      user.image,
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                width: 10,
              ),
              Text(user.name)
            ],
          ),
        );
      },
    );
  }

  Widget buildOtherArea() {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final clothesList = ref
          .watch(clothesViewPageProvider.select((value) => value.clothesList));

      return SizedBox(
        height: 100,
        child: clothesList.isEmpty
            ? Container()
            : GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: (4 / 3),
                ),
                itemCount: clothesList.length,
                itemBuilder: (BuildContext context, int index) {
                  final clothes = clothesList[index];
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClothesViewScreen(
                                      clothes: clothes,
                                    )));
                      },
                      child: SizedBox(
                        child: CacheImage(imageURL: clothes.imageURL),
                      ),
                    ),
                  );
                }),
      );
    });
  }

  Widget buildComponentArea() {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final clothes =
          ref.watch(clothesViewPageProvider.select((value) => value.clothes));

      return clothes == null
          ? Container()
          : Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    OutlinedButton(
                      onPressed: null,
                      child: Column(
                        children: [
                          Text(
                            '購入額',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('¥${clothes.price}'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    OutlinedButton(
                      onPressed: null,
                      child: Column(
                        children: [
                          Text(
                            '購入日',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                              '${clothes.year}/${clothes.month}/${clothes.day}'),
                        ],
                      ),
                    ),
                  ]),
                  !clothes.isSell
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              OutlinedButton(
                                onPressed: null,
                                child: Column(
                                  children: [
                                    Text(
                                      '売却額',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('¥${clothes.selling}'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              OutlinedButton(
                                onPressed: null,
                                child: Column(
                                  children: [
                                    Text(
                                      '売却日',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        '${clothes.sellingYear}/${clothes.sellingMonth}/${clothes.sellingDay}'),
                                  ],
                                ),
                              ),
                            ]),
                ],
              ),
            );
    });
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
