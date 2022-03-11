import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../controllers/pages/clothes_view_page_controller.dart';
import '../../models/clothes.dart';

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




class _ClothesViewScreen extends HookConsumerWidget{

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clothes = ref.watch(ClothesViewPageProvider.select((value) => value.clothesForPublic));
    final currentUserId = ref.watch(userProvider.select((value) => value.user.uid));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade50,
        title:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(clothes.year, style: TextStyle(
                  fontSize: 10,
                ),),
                Text(clothes.month + '/' + clothes.day , style: TextStyle(
                  fontSize: 15,
                ),),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)
              ),
              height: 48,
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('購入額', style: TextStyle(
                    fontSize: 10,),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(clothes.price, style: TextStyle(fontSize: 15),)
                    ],
                  ),
                ],
              ),
            ),
            clothes.isSell ?
            Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)
              ),
              height: 48,
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('売却額', style: TextStyle(
                    fontSize: 10,),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(clothes.selling)
                    ],
                  ),
                ],
              ),
            ):Container()
          ]
      ),
        leading: IconButton(onPressed: () { Navigator.pop(context, true); }, icon: Icon(Icons.close),),
      ),
      floatingActionButton:
      clothes.uid == currentUserId ?
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.brown.shade50,
            onPressed: (){},
            child: Icon(LineIcons.edit),
          ),
          SizedBox(height: 10,),
          clothes.isFavorite ?

          FloatingActionButton(
            backgroundColor: Colors.yellow,
            onPressed: (){
              ref.read(ClothesViewPageProvider.notifier).changeFavoriteStateFalse();

            },
            child: Icon(LineIcons.starAlt),
          ):

          FloatingActionButton(
          backgroundColor: Colors.brown.shade50,
          onPressed: (){
            ref.read(ClothesViewPageProvider.notifier).changeFavoriteStateTrue();

          },
          child: Icon(LineIcons.starAlt),
        ),
        ],
      ):Container(),
      backgroundColor: Colors.brown.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(12),
                child: GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          color: Colors.white,
                          child: Image.network(
                            clothes.imageURL,
                            width: 500,
                            height: 500,
                            fit: BoxFit.cover,
                          )
                      ),
                    )
                ),
              ),
              Container(
                width: 250,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('ブランド', style: TextStyle(fontSize: 10),),
                      ],
                    ),
                    TextField(
                      cursorHeight: 10,
                      controller: TextEditingController(
                          text: clothes.brands),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          )
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                width: 250,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('詳細', style: TextStyle(fontSize: 10),),
                      ],
                    ),
                    TextField(
                      cursorHeight: 10,
                      controller: TextEditingController(
                          text: clothes.description),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),

    );
  }

}