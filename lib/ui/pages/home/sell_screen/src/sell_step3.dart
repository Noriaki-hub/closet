import 'package:closet_app_xxx/controllers/pages/sell_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';



class SellStep3 extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final year = ref.watch(
        SellPageProvider.select((value) => value.sellingYear));
    final month = ref.watch(
        SellPageProvider.select((value) => value.sellingMonth));
    final day = ref.watch(SellPageProvider.select((value) => value.sellingDay));
    return Column(
      children: [
        year == '' ?
            Container():
        Text(year + '/' + month + '/' + day, style: TextStyle(fontSize: 25),),
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
                await ref.read(SellPageProvider.notifier).selectDate(selectedDate: pickedDate);
              }
            },
          ),
        )
      ],
    );
  }

}