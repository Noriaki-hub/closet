import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class AccountScreen extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider.select((value) => value.user));
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade50,
        actions: [
          IconButton(onPressed: ()async{
            await ref.read(userProvider.notifier).logout();
            Navigator.pop(context);
          }, icon: Icon(LineIcons.alternateSignOut))
        ],
      ),
      body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             ClipRRect(
               borderRadius: BorderRadius.circular(80),
               child: Container(
                 color: Colors.white,
                 child: Image.network(
                   user.image,
                   width: 300,
                   height: 300,
                   fit: BoxFit.fitHeight,
                 ),
               ),
             )
           ],
         ),
      ),
    );
  }

}