import 'package:closet_app_xxx/ui/libs/widgets.dart';
import 'package:closet_app_xxx/ui/libs/navigation.dart';
import 'package:closet_app_xxx/ui/pages/global/account/account_page.dart';
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
    return InkWell(
      onTap: () => Navigation().transition(
          context: context, widget: AccountPage(userId: statusMap.user.uid)),
      child: GlassContainer(
        borderRadius: BorderRadius.circular(12),
        width: double.infinity,
        height: 50,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
          islike
              ? Row(
                  children: [
                    Icon(
                      LineIcons.heartAlt,
                      size: 18,
                      color: Colors.red,
                    ),
                    Text(statusMap.status.likedCount.toString()),
                    SizedBox(
                      width: 10,
                    )
                  ],
                )
              : Row(
                  children: [
                    Text(statusMap.status.buying.toString() + '円'),
                    SizedBox(
                      width: 10,
                    )
                  ],
                )
        ]),
      ),
    );
  }
}
