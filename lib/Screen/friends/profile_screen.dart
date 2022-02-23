import 'package:closet_app_xxx/Screen/Auth/login_screen.dart';
import 'package:closet_app_xxx/Screen/datePicker.dart';
import 'package:closet_app_xxx/model/CustomExeption.dart';
import 'package:closet_app_xxx/model/home/controllers/calender_controller.dart';
import 'package:closet_app_xxx/model/home/controllers/clothes_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/User/models/user_model.dart';
import '../../model/friends/models/friends_model.dart';
import '../../model/home/controllers/recent_controller.dart';


class ProfileScreen extends HookConsumerWidget {

  UserModel friends ;

  ProfileScreen(this.friends);

  PickDate date = PickDate();


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        clothesListProvider.overrideWithProvider(clothesListProviderFamily(friends.uid))
      ],
      child: Scaffold(

        body: RefreshIndicator(
          onRefresh: () async {
            return await ref.refresh(clothesListProvider);
          },
          child: Container(
            color: Colors.white,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 900,
                      width: double.infinity,
                      decoration:  BoxDecoration(
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.white60,
                                BlendMode.dstATop),
                            image: AssetImage('images/clo.png'),
                            fit: BoxFit.cover,
                          )),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              height: 300,
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    color: Colors.white.withOpacity(0.5),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 45,),
                                        Container(
                                          width: 400,
                                          height: 50,
                                          child: Row(
                                            children: [
                                              SizedBox(width: 20),
                                              Text(date.yearNowPicker(),style: TextStyle(
                                                fontSize: 15,
                                              ),),
                                              SizedBox(width: 5,),
                                              Text(date.monthNowPicker (),style: TextStyle(
                                                fontSize: 20,
                                              ),),
                                              SizedBox(width: 10,),
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
                                                    Text('Purchased',style: TextStyle(
                                                      fontSize: 10,),),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        calenderBuy()
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 20,),
                                              Container(
                                                height: 48,
                                                width: 120,
                                                decoration: BoxDecoration(
                                                    color: Colors.white.withOpacity(0.5),
                                                    borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text('Sold',style: TextStyle(
                                                      fontSize: 10,),),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        calenderSell()
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),

                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    height: 110,
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10,),
                                        Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.white.withOpacity(0.5)
                                          ),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Text(friends.name, style: TextStyle(
                                                  fontSize: 20,
                                                ),),
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(100),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                    ),
                                                    child: Image.network(
                                                      friends.image,
                                                      width: 80,
                                                      height: 80,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                ],
                              ),
                            ),

                            Row(
                              children: [
                                SizedBox(width: 5,),
                                Container(width: 100, decoration : BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)
                                ),child: Center(child: Text('Favorite'))),
                              ],
                            ),
                            Container(height: 200,width: double.infinity,child: Recent()),

                            SizedBox(height: 60,),

                            Row(
                              children: [
                                SizedBox(width: 5,),
                                Container(width: 100, decoration : BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)
                                ),child: Center(child: Text('Recent'))),
                              ],
                            ),
                            Container(height: 200,width: double.infinity,child: Recent())
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                        height: 700,
                        width: double.infinity,
                        child: Column(
                          children: [
                            ClosetController(friends: friends),
                            Expanded(child: _ItemList())
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context).pushReplacement(

      MaterialPageRoute(builder: (context) => LoginPage(),
        fullscreenDialog: true,
      ));
}

class calenderBuy extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(calenderProvider);
    return listState.when(
      data : (items) {
        double sum = 0;
        if(items.isNotEmpty){
          sum = items.map<double>((clothes) => double.parse(clothes.price))
              .reduce((curr, next) => curr + next);
        }
        return Text(sum.floor().toString(),style: TextStyle(fontSize: 15,));
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, _) =>
          _ItemListError(
            message: error is CustomException
                ? error.message!
                : 'Something went wrong',
          ),
    );
  }
}


class calenderSell extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(calenderSellProvider);
    return listState.when(
      data : (items) {
        double sum = 0;
        if(items.isNotEmpty){
          sum = items.map<double>((clothes) => double.parse(clothes.selling))
              .reduce((curr, next) => curr + next);
        }
        return Text(sum.floor().toString(),style: TextStyle(fontSize: 15,));
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, _) =>
          _ItemListError(
            message: error is CustomException
                ? error.message!
                : 'Something went wrong',
          ),
    );
  }
}

class Recent extends HookConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemListState = ref.watch(recentListProvider);
    return itemListState.when(
      data: (items) =>
      items.isEmpty ?
      Container() :
      Container(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length >= 4 ? 4 : items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            return
              Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            width: 120,
                            color: Colors.white,
                            child: Image.network(
                              item.imageURL,
                              fit: BoxFit.cover,
                            )
                        ),
                      )
                  ),
              );
          },
        ),
      ),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, _) =>
          _ItemListError(
            message: error is CustomException
                ? error.message!
                : 'Something went wrong',
          ),
    );
  }
}

class ClosetController extends HookConsumerWidget {

  ClosetController ({required this.friends, Key? key}) : super(key: key);

  final UserModel friends;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8)
      ),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              OutlineButton(
                child: const Text('All'),
                onPressed: () {
                  ref.read(clothesListProvider.notifier).fetchClothesList(userId: friends.uid);
                },
              ),
              OutlineButton(
                child: const Text('Tops'),
                onPressed: () {
                  ref.read(clothesListProvider.notifier).fetchClothesListCategory(category: 'Tops', userId: friends.uid);
                },
              ),
              OutlineButton(
                child: const Text('Bottoms'),
                onPressed: () {
                  ref.read(clothesListProvider.notifier).fetchClothesListCategory(category: 'Bottoms', userId: friends.uid);
                },
              ),
              OutlineButton(
                child: const Text('Outer'),
                onPressed: () {
                  ref.read(clothesListProvider.notifier).fetchClothesListCategory(category: 'Outer', userId: friends.uid);
                },
              ),
              OutlineButton(
                child: const Text('Footwear'),
                onPressed: () {
                  ref.read(clothesListProvider.notifier).fetchClothesListCategory(category: 'Footwear', userId: friends.uid);
                },
              ),
              OutlineButton(
                child: const Text('Accessories'),
                onPressed: () {
                  ref.read(clothesListProvider.notifier).fetchClothesListCategory(category: 'Accessories', userId: friends.uid);
                },
              ),
            ]
            ,
          ),
        ),
      )
      ,
    );
  }

}


class _ItemList extends HookConsumerWidget {
  const _ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemListState = ref.watch(clothesListProvider);
    return itemListState.when(
      data: (items) => items.isEmpty ?
      Container(child: Text('empty'),):
      GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 0.765
        ),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return GridTile(
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Image.network(item.imageURL,fit: BoxFit.contain,)),
          );
        },
      ),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, _) => _ItemListError(
        message: error is CustomException ? error.message! : 'Something went wrong',
      ),
    );
  }
}


class _ItemListError extends HookConsumerWidget {
  final String message;

  const _ItemListError({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
              onPressed: () =>
                  ref.read(clothesListProvider),
              child: Text('Retry')
          ),
        ],
      ),
    );
  }
}




