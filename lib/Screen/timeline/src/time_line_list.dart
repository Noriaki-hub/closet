import 'package:closet_app_xxx/controllers/pages/time_line_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../home/home_page.dart';

class TimeLineList extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeLineList = ref.watch(TimeLinePageProvider.select((value) => value.timeLineList));
    return ListView.builder(
        itemCount: timeLineList.length,
        itemBuilder: (BuildContext context, int index) {
          final timeLine = timeLineList[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomePage(userId: timeLine.uid),
                        )
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            color: Colors.white,
                            child: Image.network(
                              timeLine.userImage,
                              width: 35,
                              height: 35,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text(timeLine.userName)
                      ],
                    ),
                  ),
                ),
                Container(
                    height: 500,
                    width: double.infinity,
                    child: ClipRRect(borderRadius: BorderRadius.circular(12),child: Image.network(timeLine.imageURL,fit: BoxFit.cover,),
                  ),),
                Container(
                  height: 100,
                  width: double.infinity,
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
                        SizedBox(height: 20,),
                        Text(timeLine.description)
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
