import 'package:closet_app_xxx/repositories/develop/develop_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DevelopPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
          child: OutlinedButton(
        onPressed: () {
          ref.read(developRepositoryProvider).addUserStatusAllClothes();
        },
        child: Text('done'),
      )),
    );
  }
}
