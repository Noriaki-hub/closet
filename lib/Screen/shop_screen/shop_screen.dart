import 'package:flutter/material.dart';


class ShopScreen extends StatelessWidget {


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
                image: AssetImage('images/shop.png'),
                fit: BoxFit.cover,
              )),
        )
    );
  }
}

