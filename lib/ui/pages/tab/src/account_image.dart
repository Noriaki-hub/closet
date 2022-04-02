import 'package:closet_app_xxx/controllers/pages/tab_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountImage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountImage =
        ref.watch(tabPageProvider.select((value) => value.image));
    return SizedBox(
        height: 30,
        width: 30,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              accountImage,
              fit: BoxFit.cover,
            )));
  }
}
