import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/share.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/libs/web_view.dart';
import 'package:closet_app_xxx/ui/pages/global/account/account_page.dart';
import 'package:closet_app_xxx/ui/pages/home/timeline/src/delete_share_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Tile extends HookConsumerWidget {
  Tile({required this.share, required this.user});

  final UserModel user;
  final Share share;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userProvider.select((value) => value.user.uid));
    return user.image == ''
        ? Loading()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AccountPage(
                                userId: user.uid,
                              ),
                            ));
                      }),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Image.network(
                                          user.image,
                                          width: 25,
                                          height: 25,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(user.name)
                                  ],
                                )),
                          ),
                          Text(
                            'シェアしました',
                            style: TextStyle(color: Colors.black45),
                          )
                        ],
                      ),
                    ),
                    share.uid != userId
                        ? Container()
                        : DeleteShareButton(share.itemId, share.genre)
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewScreen(
                            genre: share.genre,
                            url: share.url,
                          ),
                        ));
                  },
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Image.network(
                          share.image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(share.title),
                  ),
                )
              ],
            ),
          );
  }
}
