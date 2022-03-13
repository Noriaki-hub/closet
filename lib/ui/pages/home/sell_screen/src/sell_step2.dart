

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../controllers/pages/sell_page_controller.dart';


class SellStep2 extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.all(12),
      child: TextField(
        decoration: InputDecoration(
            hintText: "10000",
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            )
        ),
        onChanged: (text) {
          ref.read(SellPageProvider.notifier).selling(selling: text);
        },
      ),
    );
  }

}