
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'status_map_model.dart';

class UserTile extends StatelessWidget {
  UserTile(
      {required this.statusMap, required this.islike, required this.listNum});

  final StatusMapModel statusMap;
  final bool islike;
  final int listNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      color: Colors.grey.withOpacity(0.1),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(LineIcons.crown),
            SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.network(
                    statusMap.user.image,
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 5,
            ),
            Text(statusMap.user.name)
          ],
        ),
        islike ?
        Row(
          children: [
            Icon(LineIcons.heartAlt, size: 18,color: Colors.red,),
            Text(statusMap.status.likedCount.toString()),
            SizedBox(
              width: 10,
            )
          ],
        ):
        Row(
          children: [
            Text(statusMap.status.buying.toString() + '円'),
            SizedBox(
              width: 10,
            )
          ],
        )
      ]),
    );
  }
}
