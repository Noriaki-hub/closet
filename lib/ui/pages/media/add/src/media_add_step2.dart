

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../controllers/pages/media_add_page_controller.dart';


class MediaAddStep2 extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 250,
      child: TextField(
        decoration: InputDecoration(
            hintText: "Supreme",
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            )
        ),
        onChanged: (text) {
          ref.read(MediaAddPageProvider.notifier).name( name: text);
        },
      ),
    );
  }

}
