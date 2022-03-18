import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../controllers/pages/clothes_edit_page_controller.dart';

class SellDatePickField extends HookConsumerWidget{


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clothes = ref.watch(ClothesEditPageProvider.select((value) => value.clothes));
    final selectedDate = ref.watch(ClothesEditPageProvider.select((value) => value.selectedDateForSell));
    final state = ref.watch(ClothesEditPageProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('売却日', style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(
          width: 250,
          child: Column(
            children: [
              selectedDate == null?
              Text(clothes.year + '/' + clothes.month + '/' + clothes.day, style: TextStyle(fontSize: 25),):
              Text(state.sellingYear + '/' + state.sellingMonth + '/' + state.sellingDay, style: TextStyle(fontSize: 25),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), //角の丸み
                    ),
                    side: const BorderSide(
                        color: Colors.black45
                    ),
                  ),
                  child: Text('選択', style: TextStyle(color: Colors.black),),
                  onPressed: () async {
                    var selectedDate = DateTime.now();
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2018),
                      lastDate: DateTime(2030),
                    );
                    if(pickedDate != null){
                      await ref.read(ClothesEditPageProvider.notifier).selectSellDate(selectedDate: pickedDate);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

}
