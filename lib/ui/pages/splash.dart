import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userProvider.select((value) => value.user));
   return Scaffold(
     body: Center(
       child: Image.asset('images/logo.png'),
     ),
   );
  }
}