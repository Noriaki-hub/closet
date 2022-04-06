import 'package:closet_app_xxx/controllers/pages/calendar_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalenderSellList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellClothesList = ref
        .watch(calendarPageProvider.select((value) => value.sellClothesList));
    return ListView.builder(
        itemCount: sellClothesList.length,
        itemBuilder: (BuildContext context, int index) {
          final clothes = sellClothesList[index];
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
                    clothes.imageURL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(clothes.brands),
                  ],
                ),
              ),
              subtitle: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(clothes.description),
                  ],
                ),
              ),
              trailing: Column(
                children: [
                  Text(clothes.price.toString()),
                  Text(
                    clothes.year + '/' + clothes.month + '/' + clothes.day,
                    style: TextStyle(fontWeight: FontWeight.w100),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
