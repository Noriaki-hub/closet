import 'package:closet_app_xxx/controllers/pages/home/calendar_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/list_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalenderSellList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final sellClothesMap =
        ref.watch(calendarPageProvider.select((value) => value.sellClothesMap));
         final sellClothesList =
        sellClothesMap.entries.map((e) => ClothesBrand(e.key, e.value)).toList();
    return ListView.builder(
        itemCount: sellClothesList.length,
        itemBuilder: (BuildContext context, int index) {
          final map = sellClothesList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.white.withOpacity(0.5),
              leading: SizedBox(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    map.clothes.imageURL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(map.clothes.brandId.toString()),
                  ],
                ),
              ),
              subtitle: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(map.clothes.description),
                  ],
                ),
              ),
              trailing: Column(
                children: [
                  Text(map.clothes.price.toString()),
                  Text(
                    map.clothes.year + '/' + map.clothes.month + '/' + map.clothes.day,
                    style: TextStyle(fontWeight: FontWeight.w100),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
