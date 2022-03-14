import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/ui/libs/follow_button.dart';
import 'package:closet_app_xxx/ui/pages/home/account/src/account_closet.dart';
import 'package:closet_app_xxx/ui/pages/home/account/src/account_favorite.dart';
import 'package:closet_app_xxx/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../controllers/pages/account_page_controller.dart';
import '../../../libs/floating_action_button_animation.dart';
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
                    ref.read(AccountPageProvider.notifier).fetchAccountPageData();
                  }
                }, icon: Icon(LineIcons.editAlt),
              ),
              Text('編集', style: TextStyle(color: Colors.grey),)],
          ),
          Column(
            children: [
              ActionButton(
                onPressed: () async {
                  await ref.read(userProvider.notifier).logout();
                  Navigator.pop(context);
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
                height: 1000,
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
                                    width: 120,
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
                              left: 125.0,
                              top: 215.0,
                              child: FollowButton(userId: state.user.uid)),
                          Positioned(
                              left: 280.0,
                              top: 225.0,
                              child: Container(
                                height: 50,
                                width: 200,
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(state.follow),
                                        Text('フォロー',
                                          style: TextStyle(fontSize: 10),),
                                      ],
                                    ),
                                    SizedBox(width: 20,),
                                    Column(

                                      children: [
                                        Text(state.follower),
                                        Text('フォロワー',
                                          style: TextStyle(fontSize: 10),),
                                      ],
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
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

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
                                  child: Text('クローゼットをみる',
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
                            Text('お気に入り',
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            state.user.uid == '' ?
                            Container() :
                            SizedBox(width: double.infinity,
                                height: 200, child: AccountFavorite()),

                            Text('最近購入したもの', style: TextStyle(
                                fontWeight: FontWeight.bold)),
                            SizedBox(width: double.infinity,
                                height: 200, child: AccountCloset()),
                            Text('今までの収支額', style: TextStyle(
                                fontWeight: FontWeight.bold),),
                            Row(

                              children: [
                                Container(width: 180,
                                  height: 100,
                                  color: Colors.white.withOpacity(0.5),
                                  child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: Text('購入額')
                                          ),
                                          SizedBox(width: 100, child: Text(
                                            state.buying,
                                            style: TextStyle(fontSize: 20,),
                                            textAlign: TextAlign.right,
                                          )),
                                          Text('円')
                                        ],
                                      )
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Container(width: 180,
                                  height: 100,
                                  color: Colors.white.withOpacity(0.5),
                                  child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: Text('売却額')
                                          ),
                                          SizedBox(width: 100, child: Text(
                                            state.selling,
                                            style: TextStyle(fontSize: 20,),
                                            textAlign: TextAlign.right,
                                          )),
                                          Text('円')
                                        ],
                                      )
                                  ),
                                ),
                              ],
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
}