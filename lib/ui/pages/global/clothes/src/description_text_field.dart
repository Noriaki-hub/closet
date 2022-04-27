import 'package:closet_app_xxx/controllers/pages/global/clothes_edit_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DescriptionTextField extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final description = ref.watch(
        clothesEditPageProvider.select((value) => value.clothes?.description));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '詳細',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          width: 250,
          child: TextField(
            maxLines: 3,
            controller: TextEditingController(text: description),
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
                  .description(description: text);
            },
          ),
        ),
      ],
    );
  }
}
