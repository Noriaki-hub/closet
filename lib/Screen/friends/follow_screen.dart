
import 'package:closet_app_xxx/Screen/friends/friends_search_screen.dart';
import 'package:closet_app_xxx/Screen/home/home_page.dart';
import 'package:closet_app_xxx/controllers/pages/follow_page_controller.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class FollowPage extends StatelessWidget {
  FollowPage({
    Key? key,
    this.userId,
  }) : super(key: key);

  final String? userId;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        FollowPageProvider.overrideWithProvider(
          FollowPageProviderFamily(
            FollowPageProviderArg(userId: userId),
          ),
        ),
      ],
      child: _FollowPage(userId: userId),
    );
  }
}



class _FollowPage extends StatelessWidget {
  _FollowPage({Key? key, this.userId}) : super(key: key);
  final String? userId;
  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Expanded(child: ItemList())
          ],
        ),
      ),
    );
  }
}






class ItemList extends HookConsumerWidget {
  const ItemList ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final follows = ref.watch(FollowPageProvider.select((value) => value.follows));
    return ListView.builder(
          itemCount: follows.length,
          itemBuilder: (BuildContext context, int index) {
            final user= follows[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: ()async{
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HomePage(userId: user.uid),
                      )
                  );
                  if(result){
                    ref.read(FollowPageProvider.notifier).fetchFollows();
                  }
                },
                child: ListTile(
                  key: ValueKey(user.uid),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      decoration: BoxDecoration(
                      ),
                      child: Image.network(
                        user.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(user.name),
                ),
              ),
            );
          }
          );

  }
}

