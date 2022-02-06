import 'package:closet_app_xxx/Screen/friends/friends_search_screen.dart';
import 'package:closet_app_xxx/model/CustomExeption.dart';
import 'package:closet_app_xxx/model/auth/current_controller.dart';
import 'package:closet_app_xxx/model/friends/controllers/profileClothesList_controller.dart';
import 'package:closet_app_xxx/model/friends/models/profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';



class ProfileScreen extends HookConsumerWidget {

  String image;
  String name;
  String id;
  String uid;

  ProfileScreen(this.image, this.name, this.id, this.uid);


  @override
  Widget  build(BuildContext context, WidgetRef ref) {

    final user = ref.watch(currentUserProvider);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(id, style: TextStyle(
              color: Colors.black
          ),),
        ),

        body: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(

                  children: [


                    Container(
                      height: 200,
                      width: 400,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.white70,
                                BlendMode.dstATop),
                            image: AssetImage('images/closet_image.png'),
                            fit: BoxFit.cover,
                          )),
                      child: Row(
                          children: [

                            SizedBox(width: 10,),
                            Column(
                              children: [
                                SizedBox(height: 50,),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Container(
                                    decoration: BoxDecoration(
                                    ),
                                    child: Image.network(
                                      image,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(name)
                              ],
                            ),
                          ]
                      ),

                    ),

                    SizedBox(height: 20,),


                    Container(

                      height: 30,

                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          uid != user.uid ?
                          InkWell(
                            onTap: (){
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue.withOpacity(0.3)),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue.withOpacity(0.2),
                                ),
                                width: 100,
                                child: Center(child: Text('フレンド申請',style: TextStyle(fontWeight: FontWeight.bold),))),
                          )
                              :
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.withOpacity(0.3)),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.2),
                              ),
                              width: 150,
                              child: Center(child: Text('マイプロフィール',style: TextStyle(fontWeight: FontWeight.bold),))),],
                      ),
                    ),
                    SizedBox(height: 20,),

                    Container(
                      height: 20,
                      color: Colors.white,
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Text('最近の購入品'
                            , style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),),

                        Container(
                          height: 150,
                        child: Column(
                          children: [
                            Expanded(
                              child: _ItemList(
                              ),
                            ),
                          ],
                        )
                    ),

                    SizedBox(height: 40,),


                    Container(
                        height: 20,
                        color: Colors.white,
                        child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Text('お気に入り'
                                , style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ]
                        )
                    ),
                    Container(
                      height: 150,
                        child: Column(
                          children: [
                            Expanded(
                              child: _ItemList(
                              ),
                            ),
                          ],
                        )
                    ),
                    Text(user.name)

                
                  ]
              ),
            )
        )
    );
  }
}

// class _User extends HookConsumerWidget {
//   const _User({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final user = ref.watch(currentUserProvider);
//     return  Text(user.name);
//   }
// }




class  _ItemList extends HookConsumerWidget {
  const _ItemList ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemListState = ref.watch(clothesListControllerProvider);
    final filteredItemList = ref.watch(clothesListProvider);
    return itemListState.when(
      data: (items) => items.isEmpty ? Center(
          child: Icon(Icons.search,
            size: 200,
            color: Colors.grey.withOpacity(0.2),
          )
      )
          : ListView.builder(

          scrollDirection: Axis.horizontal,
          itemCount: filteredItemList.length,
          itemBuilder: (BuildContext context, int index) {

            final item = filteredItemList[index];

            return ProviderScope(
              overrides: [_currentItem.overrideWithValue(item)],
              // アイテムタイルの表示
              child: _ItemTile(),
            );
          }),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, _) => _ItemListError(
        message: error is CustomException ? error.message! : 'Something went wrong',
      ),
    );
  }
}
final _currentItem = Provider<Profile>((_) => throw UnimplementedError());
// アイテムタイル
class _ItemTile extends HookConsumerWidget {
  const _ItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(_currentItem);
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          border: Border.all(color: Colors.black45),
          ),
        child:  item.assetURL != '' ?
            Image.asset(item.assetURL, fit: BoxFit.contain,)
                : Image.network(item.imageURL,fit: BoxFit.cover,),
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
              onPressed: () => ref
                  .read(clothesListControllerProvider.notifier)
                  .getClothesList(uid),
              child: Text('Retry')
          ),
        ],
      ),
    );
  }
}
