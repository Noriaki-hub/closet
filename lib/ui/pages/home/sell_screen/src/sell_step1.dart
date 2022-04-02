import 'package:closet_app_xxx/controllers/pages/sell_page_controller.dart';
import 'package:closet_app_xxx/ui/pages/home/sell_screen/src/sell_list.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class SellStep1 extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedClothes =
        ref.watch(sellPageProvider.select((value) => value.selectedClothes));

    return Column(
      children: [
        selectedClothes == null
            ? Container()
            : ListTile(
                tileColor: Colors.white.withOpacity(0.5),
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      selectedClothes.imageURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(selectedClothes.brands),
                    ],
                  ),
                ),
                subtitle: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(selectedClothes.description),
                    ],
                  ),
                ),
                trailing: Column(
                  children: [
                    Text(selectedClothes.price),
                    Text(
                      selectedClothes.year +
                          '/' +
                          selectedClothes.month +
                          '/' +
                          selectedClothes.day,
                      style: TextStyle(fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
              ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), //角の丸み
              ),
              side: const BorderSide(color: Colors.black45),
            ),
            child: Text(
              '選択',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              _showPicker(context);
            },
          ),
        )
      ],
    );
  }

  void _showPicker(
    context,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return SafeArea(child: SellList());
        });
  }
}
