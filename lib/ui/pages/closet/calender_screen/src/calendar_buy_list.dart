import 'package:closet_app_xxx/controllers/pages/home/calendar_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/list_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalenderBuyList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buyClothesMap =
        ref.watch(calendarPageProvider.select((value) => value.buyClothesMap));
         final buyClothesList =
        buyClothesMap.entries.map((e) => ClothesBrand(e.key, e.value)).toList();

    return ListView.builder(
        itemCount: buyClothesList.length,
        itemBuilder: (BuildContext context, int index) {
          final map = buyClothesList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.white.withOpacity(0.5),
              leading: SizedBox(
                  width: 50,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        map.clothes.imageURL,
                        fit: BoxFit.cover,
                      ))),
              title: Text(map.brand.brand_name_en),
              subtitle: Text(map.clothes.description),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(map.clothes.price.toString() + '円'),
                  Text(
                    map.clothes.month + '/' + map.clothes.day,
                    style: TextStyle(fontWeight: FontWeight.w100),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
