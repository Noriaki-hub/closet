
import 'package:closet_app_xxx/ui/pages/home/account/account_page.dart';
import 'package:closet_app_xxx/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../controllers/pages/follower_page_controller.dart';



class FollowerPage extends StatelessWidget {
  FollowerPage({
    Key? key,
    this.userId,
  }) : super(key: key);

  final String? userId;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        FollowerPageProvider.overrideWithProvider(
          FollowerPageProviderFamily(
            FollowerPageProviderArg(userId: userId),
          ),
        ),
      ],
      child: _FollowerPage(userId: userId),
    );
  }
}



class _FollowerPage extends HookConsumerWidget {
  _FollowerPage({Key? key, this.userId}) : super(key: key);
  final String? userId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,

      body: RefreshIndicator(
        onRefresh: () async{
          await ref.read(FollowerPageProvider.notifier).fetchUserFollowers();
        },
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Expanded(child: ItemList())
            ],
          ),
        ),
      ),
    );
  }
}






class ItemList extends HookConsumerWidget {
  const ItemList ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followers = ref.watch(FollowerPageProvider.select((value) => value.followers));
    return ListView.builder(
        itemCount: followers.length,
        itemBuilder: (BuildContext context, int index) {
          final user= followers[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AccountPage(userId: user.uid),
                    )
                );
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

