import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../controllers/pages/buy_page_controller.dart';



class BuyStep3 extends HookConsumerWidget {

  List<String> categories = ['Tops', 'Bottoms', 'Outer', 'Footwear', 'Accessories', 'Others'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryState = ref.watch(BuyPageProvider.select((value) => value.category));
    return Container(
      height: 300,
      width: 200,
      child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            final category = categories[index];
            return OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),//角の丸み
                ),
                side: BorderSide(
                    color: categoryState != category ? Colors.black45: Colors.lightBlueAccent
                ),
              ),
              child: Text(
                category, style: TextStyle(color: Colors.black),),
              onPressed: () async{
                 await ref.read(BuyPageProvider.notifier).category(category);
              },
            );
          }
      ),
    );
  }
}
