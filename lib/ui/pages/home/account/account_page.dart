

import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/controllers/pages/tab_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/follow_button.dart';
import 'package:closet_app_xxx/ui/pages/follow/src/follow_screen.dart';
import 'package:closet_app_xxx/ui/pages/home/account/src/account_closet.dart';
import 'package:closet_app_xxx/ui/pages/home/account/src/account_favorite.dart';
import 'package:closet_app_xxx/ui/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../controllers/pages/account_page_controller.dart';
import '../../../libs/floating_action_button_animation.dart';
import '../../follow/src/follower_screen.dart';
import 'account_edit_page.dart';

class AccountPage extends StatelessWidget {
  AccountPage({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;


  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        AccountPageProvider.overrideWithProvider(
          AccountPageProviderFamily(
            AccountPageProviderArg(userId: userId),
          ),
        ),
      ],
      child: _AccountPage(),
    );
  }
}



class _AccountPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(AccountPageProvider);
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        title: Text('プロフィール', style: TextStyle(color: Colors.black45),),
        backgroundColor: Colors.brown.shade50,
      ),
      floatingActionButton: state.isMenu ? ExpandableFab(
        distance: 112.0,
        children: [
          Column(
            children: [
              ActionButton(
                onPressed: () async {
                  final result = await Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => AccountEditPage()));
                  if (result) {
                    await ref.read(AccountPageProvider.notifier).fetchAccountPageData();
                    await ref.read(TabPageProvider.notifier).fetchAccountImage();
                  }
                }, icon: Icon(LineIcons.editAlt),
              ),
              Text('編集', style: TextStyle(color: Colors.grey),)],
          ),
          Column(
            children: [
              ActionButton(
                onPressed: () async {
                  final result = await _showDialog(context);
                  if(result){
                    await ref.read(userProvider.notifier).logout();
                   Navigator.pop(context);
                  }
                },
                icon: Icon(LineIcons.alternateSignOut),
              ),
              Text('ログアウト', style: TextStyle(color: Colors.grey),)],
          ),
        ],
      ) : Container(),
      body: state.user.uid == ''
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 1200,
                child: Column(
                  children: [
                    Container(
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: Stack(
                        children: [
                          SizedBox(width: double.infinity, height: 200,
                            child: Image.network(state.user.image, fit: BoxFit
                                .cover,),),

                          Positioned(
                            left: 20.0,
                            top: 150.0,
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  color: Colors.white,
                                  child: Image.network(
                                    state.user.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20.0,
                            top: 225.0,
                            child: SingleChildScrollView(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      state.user.name, style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              left: 220.0,
                              top: 225.0,
                              child: Container(
                                height: 50,
                                width: 200,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                              return FollowPage(
                                                userId: state.user.uid,);
                                            }));
                                      },
                                      child: Column(
                                        children: [
                                          Text(
                                              state.follow
                                          ),
                                          const Text('フォロー',
                                            style: TextStyle(fontSize: 10),),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 20,),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                              return FollowerPage(
                                                userId: state.user.uid,);
                                            }));
                                      },
                                      child: Column(

                                        children: [
                                          Text(
                                              state.follower
                                          ),
                                          const Text('フォロワー',
                                            style: TextStyle(fontSize: 10),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            const  SizedBox(height: 20,),
                            const Text('ID',style: TextStyle(fontWeight: FontWeight.bold), ),
                            Text(state.user.id),
                            const  SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FollowButton(userId: state.user.uid),

                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), //角の丸み
                                    ),
                                    side: const BorderSide(
                                        color: Colors.black45
                                    ),
                                  ),
                                  child: const Text('クローゼットをみる',
                                    style: TextStyle(color: Colors.black),),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return HomePage(
                                            userId: state.user.uid,);
                                        }));
                                  },
                                ),
                              ],
                            ),
                            const Text('お気に入り',
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            state.user.uid == '' ?
                            Container() :
                            SizedBox(width: double.infinity,
                                height: 200, child: AccountFavorite()),

                            const Text('最近購入したもの', style: TextStyle(
                                fontWeight: FontWeight.bold)),
                            SizedBox(width: double.infinity,
                                height: 200, child: AccountCloset()),
                            const Text('今までの収支額', style: TextStyle(
                                fontWeight: FontWeight.bold),),
                            const SizedBox(height: 20,),
                            Container(
                              height: 50,
                              color: Colors.white.withOpacity(0.5),
                              child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    children: [
                                      const Text('購入額'),
                                      SizedBox(
                                        width: 150,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              state.buying,
                                              style: TextStyle(fontSize: 20,),
                                              textAlign: TextAlign.right,
                                            ),
                                            const Text('円')
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Container(
                              height: 50,
                              color: Colors.white.withOpacity(0.5),
                              child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    children: [
                                      const Text('売却額'),
                                      SizedBox(
                                        width: 150,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                             Text(
                                              state.selling,
                                              style: TextStyle(fontSize: 20,),
                                              textAlign: TextAlign.right,
                                            ),
                                            const Text('円')
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

  _showDialog(context) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('ログアウトしますか？'),
          actions: [
            CupertinoDialogAction(
              child: Text('はい'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            CupertinoDialogAction(
              child: Text('いいえ'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ],
        );
      },
    );
  }
}