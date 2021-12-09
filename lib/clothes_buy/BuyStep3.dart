import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyStep3 extends StatefulWidget {

  String? category;
  File? imageFile;
  BuyStep3(this.imageFile, this.category);

  @override
  State<StatefulWidget> createState() {
    return _BuyStep3(imageFile, category);
  }
}

class _BuyStep3 extends State<BuyStep3> {

  String? category;
  File? imageFile;
  _BuyStep3(this.imageFile, this.category);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text("BUY"),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.white,

        child: Column(
          children: [
            Image.file(imageFile!),
            Text(category!)
          ],
        ),
      ),
    );
  }
}