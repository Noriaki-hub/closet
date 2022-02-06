
import 'package:closet_app_xxx/Screen/home/profile_screen/search_profile_screen.dart';
import 'package:closet_app_xxx/model/CustomExeption.dart';
import 'package:closet_app_xxx/model/friends/controllers/friends_search_controller.dart';
import 'package:closet_app_xxx/model/friends/models/friends_search_model.dart';
import 'package:closet_app_xxx/model/friends/controllers/profileClothesList_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


String? searchedId;
String uid = '';


class FriendsSearchScreen extends HookConsumerWidget {


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(

      body: Center(
        child: Column(

          children: [
            Container(
              height: 100,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              color: Colors.grey.withOpacity(0.1),
              child: Column(
                children: [
                  SizedBox(height: 45,),
                  Row(
                      children: [
                        SizedBox(width: 10,),

                        Container(
                            height: 35,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey.withOpacity(0.1)
                            ),
                            child: Row(
                                children:
                                [


                                  Icon(Icons.search,
                                  color: Colors.grey,
                                  ),
                                  Flexible(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'ID',
                                        border: InputBorder.none,
                                      ),
                                      onChanged: (text) {
                                        searchedId = text;
                                        ref.read(
                                            searchUserListControllerProvider
                                                .notifier)
                                            .getSearchUser(searchedId);
                                      },
                                    ),
                                  ),
                                ]
                            )

                        ),
                        SizedBox(width: 10,),
                        TextButton(onPressed: () {
                          Navigator.pop(context,);
                        },
                            child: Text("Cancel",
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            )
                        )
                      ]


                  ),


                ],
              ),

            ),


            Expanded(
              child: Container(
                
                child: Center(

                  child: _ItemList(),
                ),
              ),
            )

          ],
        ),
      ),

    );
  }
}

class _ItemList extends HookConsumerWidget {
  const _ItemList ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemListState = ref.watch(searchUserListControllerProvider);
    final filteredItemList = ref.watch(filteredUserListProvider);
    return itemListState.when(
      data: (items) => items.isEmpty ? Center(
        child: Icon(Icons.search,
          size: 200,
          color: Colors.grey.withOpacity(0.2),
        )
      )
          : ListView.builder(
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
final _currentItem = Provider<FriendsSearch>((_) => throw UnimplementedError());
// アイテムタイル
class _ItemTile extends HookConsumerWidget {
  const _ItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(_currentItem);
    return InkWell(
      onTap: (){
        uid = item.uid;
        ref.read(clothesListControllerProvider.notifier)
            .getClothesList(uid);

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProfileScreen(item.image, item.name, item.id, item.uid),
            )
        );
      },
      child: ListTile(
        title: Text(item.name),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            decoration: BoxDecoration(

            ),
            child: item.image == ''
                ? Image.asset('images/user.png')
                : Image.network(
              item.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
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
                  ref
                      .read(searchUserListControllerProvider.notifier)
                      .getSearchUser(searchedId),
              child: Text('Retry')
          ),
        ],
      ),
    );
  }
}




