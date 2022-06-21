import 'package:flutter/material.dart';

class Navigation {
  void transition({required BuildContext context, required Widget widget}) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(child: child, scale: animation);
        },
      ),
    );
  }
}
