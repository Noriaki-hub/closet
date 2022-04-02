import 'package:closet_app_xxx/controllers/pages/calendar_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalenderBuyList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buyClothesList =
        ref.watch(calendarPageProvider.select((value) => value.buyClothesList));
    return ListView.builder(
        itemCount: buyClothesList.length,
        itemBuilder: (BuildContext context, int index) {
          final clothes = buyClothesList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.white.withOpacity(0.5),
              leading: SizedBox(
                  width: 50,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        clothes.imageURL,
                        fit: BoxFit.cover,
                      ))),
              title: Text(clothes.brands),
              subtitle: Text(clothes.description),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(clothes.price + '円'),
                  Text(
                    clothes.month + '/' + clothes.day,
                    style: TextStyle(fontWeight: FontWeight.w100),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
