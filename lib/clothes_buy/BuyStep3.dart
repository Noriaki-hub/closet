import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BuyStep4.dart';

class BuyStep3 extends StatefulWidget {

  String? category;
  File? imageFile;
  BuyStep3(this.imageFile, this.category, );

  @override
  State<StatefulWidget> createState() {
    return _BuyStep3(imageFile, category);
  }
}

class _BuyStep3 extends State<BuyStep3> {

  String? category;
  File? imageFile;
  _BuyStep3(this.imageFile, this.category);

  String? brands;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        title: Text("Brands",
            style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Brands Name",
                    hintText: "Supreme",
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )
                ),
                onChanged: (text) {
                  brands = text;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: OutlinedButton(
                child: const Text('Next'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(),
                ),
                onPressed: () {
                  brands!= null
                      ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuyStep4(imageFile, category, brands),
                      )
                  )
                      : _showDialog();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future _showDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          content: Text("ノーブランドでよろしいですか"),
            actions: [
              TextButton(
                  child: Text("Yes"),
                  onPressed: () {
                    brands = 'unknown';
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BuyStep4(imageFile, category, brands),
                        )
                    );
                  }
              ),
              TextButton(
                child: Text("No"),
                onPressed: () => Navigator.pop(context)
              ),
            ]
        );
      },
    );
  }
}