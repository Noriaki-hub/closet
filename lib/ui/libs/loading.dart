
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    const spinkit = SpinKitWave(
      color: Colors.black45,
      size: 50.0,
    );
   return Scaffold(
     backgroundColor: Colors.brown.shade50,
     body: Center(
       child: spinkit,
     ),
   );
  }

}