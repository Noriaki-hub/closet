import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

User? current = FirebaseAuth.instance.currentUser;


class TimeLineScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown.shade50,

    );
  }
}



