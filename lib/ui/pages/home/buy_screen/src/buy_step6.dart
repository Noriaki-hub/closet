
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../controllers/pages/buy_page_controller.dart';


class BuyStep6 extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final year = ref.watch(
        BuyPageProvider.select((value) => value.year));
    final month = ref.watch(
        BuyPageProvider.select((value) => value.month));
    final day = ref.watch(BuyPageProvider.select((value) => value.day));
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
            child: const Text('選択', style: TextStyle(color: Colors.black),),
            onPressed: () async {
              var selectedDate = DateTime.now();
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2018),
                lastDate: DateTime(2030),
              );
              if(pickedDate != null){
                await ref.read(BuyPageProvider.notifier).selectDate(selectedDate: pickedDate);
              }
            },
          ),
        )
      ],
    );
  }

}