import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/ui/libs/like_button.dart';
import 'package:closet_app_xxx/ui/pages/home/clothes/clothes_edit_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../controllers/pages/clothes_view_page_controller.dart';
import '../../../../models/clothes.dart';
import '../../../libs/floating_action_button_animation.dart';



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
        ClothesViewPageProvider.overrideWithProvider(
          ClothesViewPageProviderFamily(
            ClothesViewPageProviderArg( clothes: clothes, userId: userId),
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
    final clothes = ref.watch(
        ClothesViewPageProvider.select((value) => value.clothes));
    final currentUserId = ref.watch(
        userProvider.select((value) => value.user.uid));
    final isFavoriteState = ref.watch(
        ClothesViewPageProvider.select((value) => value.isFavoriteState));
    final buyingFormState = ref.watch(
        ClothesViewPageProvider.select((value) => value.buyingFormState));

    return clothes == null ? Scaffold():
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown.shade50,
          leading: IconButton(onPressed: () {
            Navigator.pop(context, false);
          }, icon: Icon(Icons.close),),
        ),
        floatingActionButton:
        clothes.uid == currentUserId ?
        ExpandableFab(
          distance: 112.0,
          children: [
            isFavoriteState ?

            ActionButton(
              onPressed: () async {
                await ref.read(ClothesViewPageProvider.notifier)
                    .changeFavoriteStateFalse();
              },
              icon: Icon(LineIcons.starAlt, color: Colors.yellow,),
            ) :


            ActionButton(
              onPressed: () async {
                await ref.read(ClothesViewPageProvider.notifier)
                    .changeFavoriteStateTrue();
              },
              icon: Icon(LineIcons.starAlt,
                color: isFavoriteState ? Colors.yellow : Colors.black,),
            ),


            ActionButton(
              onPressed: () async {
                final result = await _showDialog(context);
                if (result) {
                  ref.read(ClothesViewPageProvider.notifier).deleteClothes();
                  Navigator.pop(context, true);
                }
              }, icon: Icon(LineIcons.alternateTrashAlt),
            ),

            ActionButton(
                onPressed: () async {
                  final result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          ClothesEditPage(itemId: clothes.itemId,)));
                  if (result) {
                    ref.read(ClothesViewPageProvider.notifier).fetchClothes();
                  }
                },
                icon: const Icon(LineIcons.edit)),


          ],
        ) : Container(),
        backgroundColor: Colors.brown.shade50,
        body: SingleChildScrollView(
          child: SizedBox(
            height: 1000,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    width: double.infinity,
                    height: size.height * 1/2,

                    child: GestureDetector(
                        child: Image.network(
                          clothes.imageURL,
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 80,
                    color: Colors.white.withOpacity(0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 2/3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Text(clothes.brands,
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),),
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
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text('詳細', style: TextStyle(
                        fontSize: 15),),
                  ),
                  Container(
                    height: 100, width: double.infinity,
                    color: Colors.white.withOpacity(0.5),
                    child: Text(clothes.description
                      ,
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
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text('購入形態', style: TextStyle(
                        fontSize: 15),),
                  ),
                  Container(
                    height: 50, width: double.infinity,
                    color: Colors.white.withOpacity(0.5),
                    child: Center(
                      child: Text(buyingFormState,
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
                  SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text('購入日'),
                      ),
                      Container(
                        height: 50, color: Colors.white.withOpacity(0.5),
                        child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(clothes.year + '/' + clothes.month + '/' +
                                    clothes.day, style: TextStyle(
                                    fontSize: 20),),
                                Row(
                                  children: [
                                    Text(
                                      clothes.price,
                                      style: TextStyle(fontSize: 20,),
                                      textAlign: TextAlign.right,
                                    ),
                                    Text('円')
                                  ],
                                ),
                              ],
                            )
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text('売却日'),
                      ),
                      Container(
                          height: 50, color: Colors.white.withOpacity(0.5),
                          child: Center(
                              child: clothes.isSell ? Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  Text(clothes.sellingYear + '/' +
                                      clothes.sellingMonth + '/' +
                                      clothes.sellingDay,
                                    style: TextStyle(fontSize: 20),),
                                  Row(
                                    children: [
                                      Text(
                                        clothes.selling,
                                        style: TextStyle(fontSize: 20,),
                                        textAlign: TextAlign.right,
                                      ),
                                      Text('円')
                                    ],
                                  ),
                                ],
                              ) : Text('まだ売却していません')
                          )
                      ),
                    ],
                  )
                ]
            ),
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