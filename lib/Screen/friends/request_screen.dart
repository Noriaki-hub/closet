import 'package:closet_app_xxx/model/friends/controllers/friendsRequestedList_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/CustomExeption.dart';
import '../home/profile_screen/search_profile_screen.dart';

class RequestScreen extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        child: RequestList(),
      ),
    );
  }

}

class RequestList extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(friendsRequestedListProvider);
    return list.when(
        data: (items) => items.isEmpty ?
        Center(
          child: Text('No request')
        ):ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {

              final item = items[index];

              return InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SearchProfileScreen(item.image, item.name, item.uid),
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
                      child: Image.network(
                        item.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );;
            }),

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
                  ref.read(friendsRequestedListProvider.notifier)
                      .fetchList(),
              child: Text('Retry')
          ),
        ],
      ),
    );
  }
}
