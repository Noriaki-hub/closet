import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

User? current = FirebaseAuth.instance.currentUser;


class TimeLineScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: Container(
        height: 800,
        width: double.infinity,
        decoration:  BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.white60,
                  BlendMode.dstATop),
              image: AssetImage('images/timeline.png'),
              fit: BoxFit.cover,
            )),
      )
    );
  }
}



