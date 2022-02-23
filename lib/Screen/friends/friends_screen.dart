
import 'package:closet_app_xxx/Screen/friends/profile_screen.dart';
import 'package:closet_app_xxx/Screen/friends/request_screen.dart';
import 'package:closet_app_xxx/model/CustomExeption.dart';
import 'package:closet_app_xxx/model/friends/controllers/friends_controller.dart';
import 'package:closet_app_xxx/model/friends/models/friends_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FriendsScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            height: 800,
            width: double.infinity,
            decoration:  BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.white60,
                      BlendMode.dstATop),
                  image: AssetImage('images/friends.png'),
                  fit: BoxFit.cover,
                )),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.white.withOpacity(0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RequestScreen(),
                            )
                        );
                      })
                    ],
                  ),
                ),
                Expanded(child: ItemList())
              ],
            ),
          ),
        ),
      ),
    );
  }
}





// アイテムリスト
class ItemList extends HookConsumerWidget {
  const ItemList ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(friendsListProvider);
    return items.when(
      data: (items) => items.isEmpty ? Text(
        'No friends',
        style: TextStyle(fontSize: 20.0),
      )
          : ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            return InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProfileScreen(item),
                    )
                );
              },
              child: ListTile(
                key: ValueKey(item.uid),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    decoration: BoxDecoration(
                    ),
                    child: Image.network(
                      item.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(item.name),
              ),
            );
          }),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, _) => ItemListError(
        message: error is CustomException ? error.message! : 'Something went wrong',
      ),
    );
  }
}


class ItemListError extends HookConsumerWidget {
  final String message;

  const ItemListError({
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
                  .read(friendsListProvider.notifier)
                  .retrieveItems(),
              child: Text('Retry')
          ),
        ],
      ),
    );
  }
}