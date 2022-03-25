import 'package:closet_app_xxx/ui/libs/like_button.dart';
import 'package:closet_app_xxx/ui/libs/user_info.dart';
import 'package:closet_app_xxx/controllers/pages/time_line_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../home/clothes/clothes_view_screen.dart';

class TimeLineList extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final timeLineList = ref.watch(TimeLinePageProvider.select((value) => value.timeLineList));
    return timeLineList.isEmpty? Center(child: Text('現在ログはありません', style: TextStyle(color: Colors.black45),),):
    ListView.builder(
        itemCount: timeLineList.length,
        itemBuilder: (BuildContext context, int index) {
          final timeLine = timeLineList[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                UserInfo(userId: timeLine.uid),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ClothesViewScreen(clothes: timeLine,)));
                  },
                  child: Container(
                      height: size.height * 2/3,
                      // width: double.infinity,
                      child: ClipRRect(borderRadius: BorderRadius.circular(12),child: Image.network(timeLine.imageURL,fit: BoxFit.cover,),
                    ),),
                ),
                Container(
                  height: 120,
                  color: Colors.brown.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(timeLine.brands, style: TextStyle(fontSize: 18),),
                            Text(
                              timeLine.year + '/' + timeLine.month +
                                  '/' + timeLine.day,
                            style: TextStyle(fontWeight: FontWeight.w100),)],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(width:200,child: Text(timeLine.description)),
                            LikeButton(itemId: timeLine.itemId)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

}
