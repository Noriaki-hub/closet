import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/controllers/pages/shop_log_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/user_info.dart';
import 'package:closet_app_xxx/ui/libs/web_view.dart';
import 'package:closet_app_xxx/ui/pages/timeline/share/src/delete_share_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShopTimeLineList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userProvider.select((value) => value.user.uid));
    final timeLineList =
        ref.watch(shopLogPageProvider.select((value) => value.timeLineList));
    return timeLineList.isEmpty
        ? Center(
            child: Text(
              '現在ログはありません',
              style: TextStyle(color: Colors.black45),
            ),
          )
        : ListView.builder(
            itemCount: timeLineList.length,
            itemBuilder: (BuildContext context, int index) {
              final timeLine = timeLineList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      UserInfo(userId: timeLine.uid),
                                    ],
                                  )),
                            ),
                            Text(
                              'シェアしました',
                              style: TextStyle(color: Colors.black45),
                            )
                          ],
                        ),
                        timeLine.uid != userId
                            ? Container()
                            : DeleteShareButton(timeLine.itemId, timeLine.genre)
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WebViewScreen(
                                genre: timeLine.genre,
                                url: timeLine.url,
                              ),
                            ));
                      },
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Image.network(
                              timeLine.image,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(timeLine.title),
                      ),
                    )
                  ],
                ),
              );
            });
  }
}
