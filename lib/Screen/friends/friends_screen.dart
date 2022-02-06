import 'package:closet_app_xxx/Screen/friends/friends_search_screen.dart';
import 'package:closet_app_xxx/model/CustomExeption.dart';
import 'package:closet_app_xxx/model/friends/controllers/friends_controller.dart';
import 'package:closet_app_xxx/model/friends/models/friends_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FriendsScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: Colors.grey.withOpacity(0.1),
          ),

          Expanded(
              child: Container(
                  child: ItemList())),
        ],
      ),
    );
  }
}



final currentItem = Provider<Friends>((_) => throw UnimplementedError());

// アイテムリスト
class ItemList extends HookConsumerWidget {
  const ItemList ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemListState = ref.watch(friendsListControllerProvider);
    final filteredItemList = ref.watch(friendsListProvider);
    return itemListState.when(
      data: (items) => items.isEmpty ? Center(
        child: Text(
          'Tap + to add an item',
          style: TextStyle(fontSize: 20.0),
        ),
      )
          : ListView.builder(
          itemCount: filteredItemList.length,
          itemBuilder: (BuildContext context, int index) {
            final item = filteredItemList[index];
            return ProviderScope(
              overrides: [currentItem.overrideWithValue(item)],
              // アイテムタイルの表示
              child: ItemTile(),
            );
          }),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, _) => ItemListError(
        message: error is CustomException ? error.message! : 'Something went wrong',
      ),
    );
  }
}

// アイテムタイル
class ItemTile extends HookConsumerWidget {
  const ItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentItem);
    return ListTile(
        key: ValueKey(item.id),
        leading: Container(width: 50,
          child: Image.asset("images/user.png",
            fit: BoxFit.cover,),
        ),
        title: Text(item.name),
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
                  .read(friendsListControllerProvider.notifier)
                  .retrieveItems(),
              child: Text('Retry')
          ),
        ],
      ),
    );
  }
}