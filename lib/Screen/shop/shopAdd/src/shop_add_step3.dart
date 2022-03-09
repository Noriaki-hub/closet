

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../controllers/pages/shop_add_page_controller.dart';

class ShopAddStep3 extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 250,
      child: TextField(
        decoration: InputDecoration(
            hintText: "http://example.com/",
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            )
        ),
        onChanged: (text) {
          ref.read(ShopAddPageProvider.notifier).url(url: text);
        },
      ),
    );
  }

}
