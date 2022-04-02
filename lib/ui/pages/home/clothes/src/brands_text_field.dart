import 'package:closet_app_xxx/controllers/pages/clothes_edit_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BrandsTextField extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brands = ref.watch(
        clothesEditPageProvider.select((value) => value.clothes?.brands));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ブランド',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          width: 250,
          child: TextField(
            controller: TextEditingController(text: brands),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                )),
            onChanged: (text) async {
              await ref
                  .read(clothesEditPageProvider.notifier)
                  .brands(brands: text);
            },
          ),
        ),
      ],
    );
  }
}
