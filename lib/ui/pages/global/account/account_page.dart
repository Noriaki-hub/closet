import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/controllers/pages/global/account_page_controller.dart';
import 'package:closet_app_xxx/controllers/pages/tab_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/app_colors.dart';
import 'package:closet_app_xxx/ui/libs/widgets.dart';
import 'package:closet_app_xxx/ui/libs/divider.dart';
import 'package:closet_app_xxx/ui/libs/floating_action_button_animation.dart';

import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/pages/follow/src/follow_screen.dart';
import 'package:closet_app_xxx/ui/pages/follow/src/follower_screen.dart';
import 'package:closet_app_xxx/ui/pages/global/account/src/account_closet.dart';
import 'package:closet_app_xxx/ui/pages/global/account/src/account_favorite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'account_edit_page.dart';
import 'src/closet/closet_page.dart';

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
        accountPageProvider.overrideWithProvider(
          accountPageProviderFamily(
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
    final state = ref.watch(accountPageProvider);
    return GlassScaffold(
      appBar: GlassAppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        title: Text(
          state.user.id,
          style: TextStyle(color: AppColors.text),
        ),
      ),
      floatingActionButton: state.isMenu
          ? buildFABMyAccount()
          : !state.isBlock
              ? buildFABOtherAccount()
              : buildFABreBlock(),
      body: state.user.uid == ''
          ? Center(child: Loading())
          : SingleChildScrollView(
              child: Column(
                children: [
                  GlassContainer(
                      height: 1500,
                      width: double.infinity,
                      borderRadius: BorderRadius.zero,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          GlassContainer(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            width: double.infinity,
                            height: 280,
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 200,
                                  child: Image.network(
                                    state.user.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
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
                                            state.user.name,
                                            style: TextStyle(
                                                color: AppColors.text,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
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
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return FollowPage(
                                                  userId: state.user.uid,
                                                );
                                              }));
                                            },
                                            child: Column(
                                              children: [
                                                Text(state.follow),
                                                const Text(
                                                  'フォロー',
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return FollowerPage(
                                                  userId: state.user.uid,
                                                );
                                              }));
                                            },
                                            child: Column(
                                              children: [
                                                Text(state.follower),
                                                const Text(
                                                  'フォロワー',
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          state.isBlock
                              ? Text('ブロックしています')
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        FollowButton(userId: state.user.uid),
                                        DividerWidget(),
                                        Wrap(
                                          spacing: 10,
                                          children: [
                                            OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10), //角の丸み
                                                ),
                                                side: const BorderSide(
                                                    color: Colors.black45),
                                              ),
                                              child: const Text(
                                                'クローゼットをみる',
                                                style: TextStyle(
                                                    color: Colors.black54),
                                              ),
                                              onPressed: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return ClosetPage(
                                                    userId: state.user.uid,
                                                  );
                                                }));
                                              },
                                            ),
                                            state.instaUrl == ''
                                                ? Container()
                                                : OutlinedButton(
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10), //角の丸み
                                                      ),
                                                      side: const BorderSide(
                                                          color:
                                                              Colors.black45),
                                                    ),
                                                    child: SizedBox(
                                                      width: 100,
                                                      child: Row(
                                                        children: [
                                                          Icon(LineIcons
                                                              .instagram),
                                                          const Text(
                                                            'Instagram',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black54),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    onPressed: () async {
                                                      if (!await launch(
                                                          'https://www.instagram.com/' +
                                                              state.instaUrl))
                                                        throw 'アクセスできませんでした';
                                                    },
                                                  ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          state.intro,
                                          maxLines: 3,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GlassContainer(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          width: 120,
                                          height: 30,
                                          child: Center(
                                            child: Text(
                                              'お気に入り',
                                              style: TextStyle(
                                                  color: AppColors.text),
                                            ),
                                          ),
                                        ),
                                        state.user.uid == ''
                                            ? Container()
                                            : SizedBox(
                                                width: double.infinity,
                                                height: 200,
                                                child: AccountFavorite()),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        GlassContainer(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          width: 160,
                                          height: 30,
                                          child: Center(
                                            child: Text(
                                              '最近購入したもの',
                                              style: TextStyle(
                                                  color: AppColors.text),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            width: double.infinity,
                                            height: 200,
                                            child: AccountCloset()),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        GlassContainer(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          width: 120,
                                          height: 30,
                                          child: Center(
                                            child: Text(
                                              '収支',
                                              style: TextStyle(
                                                  color: AppColors.text),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 50,
                                          color: Colors.white.withOpacity(0.5),
                                          child: Center(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text('購入額'),
                                              SizedBox(
                                                width: 150,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      state.buying,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                    const Text('円')
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 50,
                                          color: Colors.white.withOpacity(0.5),
                                          child: Center(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text('売却額'),
                                              SizedBox(
                                                width: 150,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      state.selling,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                    const Text('円')
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      ))
                ],
              ),
            ),
    );
  }

  Widget buildFABMyAccount() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return ExpandableFab(
          distance: 112.0,
          children: [
            Column(
              children: [
                ActionButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountEditPage()));
                    if (result) {
                      await ref
                          .read(accountPageProvider.notifier)
                          .fetchAccountPageData();
                      await ref
                          .read(tabPageProvider.notifier)
                          .fetchAccountImage();
                    }
                  },
                  icon: Icon(LineIcons.editAlt),
                ),
                Text(
                  '編集',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            Column(
              children: [
                ActionButton(
                  onPressed: () async {
                    final result = await _showDialog(context, value: 'logout');
                    if (result) {
                      await ref.read(userProvider.notifier).logout();
                      Navigator.pop(context);
                    }
                  },
                  icon: Icon(LineIcons.alternateSignOut),
                ),
                Text(
                  'ログアウト',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ],
        );
      },
    );
  }

  Widget buildFABOtherAccount() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return ExpandableFab(
          distance: 112.0,
          children: [
            Column(
              children: [
                ActionButton(
                  onPressed: () async {
                    final result = await _showDialog(context, value: 'flag');
                    if (result) {
                      await ref.read(accountPageProvider.notifier).flagUser();
                    }
                  },
                  icon: Icon(
                    LineIcons.flag,
                    color: Colors.red,
                  ),
                ),
                Text(
                  '報告',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            Column(
              children: [
                ActionButton(
                  onPressed: () async {
                    final result = await _showDialog(context, value: 'block');
                    if (result) {
                      await ref.read(accountPageProvider.notifier).blockUser();
                    }
                  },
                  icon: Icon(
                    LineIcons.ban,
                    color: Colors.red,
                  ),
                ),
                Text(
                  'ブロック',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ],
        );
      },
    );
  }

  Widget buildFABreBlock() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return FloatingActionButton(
          backgroundColor: Colors.grey.shade50,
          onPressed: () async {
            final result = await _showDialog(context, value: 'reBlock');
            if (result) {
              await ref.read(accountPageProvider.notifier).reblockUser();
            }
          },
          child: Icon(
            LineIcons.ban,
            color: Colors.green,
          ),
        );
      },
    );
  }

  _showDialog(context, {required String value}) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: value == 'logout'
              ? Text('ログアウトしますか？')
              : value == 'block'
                  ? Text('ブロックしますか？')
                  : value == 'flag'
                      ? Text('報告しますか？')
                      : Text('ブロックを解除しますか？'),
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
