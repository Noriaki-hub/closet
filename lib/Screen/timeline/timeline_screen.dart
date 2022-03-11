import 'package:closet_app_xxx/Screen/timeline/src/time_line_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

User? current = FirebaseAuth.instance.currentUser;


class TimeLineScreen extends HookConsumerWidget {


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Colors.brown.shade50,

      body: Center(
        child: TimeLineList(),
      ),

    );
  }
}





