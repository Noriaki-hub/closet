import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../controllers/pages/clothes_edit_page_controller.dart';

class PriceTextField extends HookConsumerWidget{

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final price = ref.watch(ClothesEditPageProvider.select((value) => value.clothes?.price));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('購入額', style: TextStyle(fontWeight: FontWeight.bold),),
        Container(
          width: 250,
          child: TextField(
            controller: TextEditingController(text: price),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                )
            ),
            onChanged: (text) async{
              await ref.read(ClothesEditPageProvider.notifier).price(price: text);
            },
          ),
        ),
      ],
    );
  }
}
