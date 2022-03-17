
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../controllers/component/like_button_controller.dart';
import '../../models/user.dart';
import '../pages/home/account/account_page.dart';

class LikeButton extends StatelessWidget {
  LikeButton({
    Key? key,
    required String itemId,
  }) : _itemId = itemId, super(key: key);

  final String _itemId;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        LikeButtonProvider.overrideWithProvider(
          LikeButtonProviderFamily(
            LikeButtonProviderArg(itemId: _itemId),
          ),
        ),
      ],
      child: _LikeButton(),
    );
  }
}

class _LikeButton extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likes = ref.watch(
        LikeButtonProvider.select((value) => value.likes));
    final myLikeState = ref.watch(
        LikeButtonProvider.select((value) => value.myLikeState));
    return
    Column(
      children: [
        Row(
          children: [
            myLikeState.isNotEmpty ?
            IconButton(onPressed: (){ref.read(LikeButtonProvider.notifier).deleteLike();}, icon: Icon(LineIcons.heartAlt, color: Colors.red,)) :
            IconButton(onPressed: (){ref.read(LikeButtonProvider.notifier).addLike();}, icon: Icon(LineIcons.heartAlt, color: Colors.grey,),),
            Text(
            likes.length.toString()
            )
          ],
        ),
        InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> LikeUsers(likes)));
            },child: Text('いいねした人',style: TextStyle(fontSize: 10),))
      ],
    );
  }
}

class LikeUsers extends StatelessWidget{
  LikeUsers(this.likes);
  List <UserModel>  likes;
  @override
  Widget build(BuildContext context, ) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.brown.shade50,),
      body: Center(
        child: ListView.builder(
            itemCount: likes.length,
            itemBuilder: (BuildContext context, int index) {
              final user= likes[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: ()async{
                    final result = await Navigator.push(
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
        ),
      ),
    );
  }

}