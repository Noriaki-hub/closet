import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BuyStep5.dart';

class BuyStep4 extends StatefulWidget {

  String? category;
  File? imageFile;
  String? brands;
  BuyStep4(this.imageFile, this.category, this.brands,);

  @override
  State<StatefulWidget> createState() {
    return _BuyStep4(imageFile, category, brands);
  }
}

class _BuyStep4 extends State<BuyStep4> {
  String? category;
  File? imageFile;
  String? brands;
  _BuyStep4(this.imageFile, this.category, this.brands);

  String? description;
  final maxLines = 5;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        title: Text("Description",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Container(
            margin: EdgeInsets.all(12),
            height: maxLines * 24.0,
          child: TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
                labelText: "Description",
                hintText: "Box Logo Hooded Sweatshirt Black",
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                )
            ),
            onChanged: (text) {
              description = text;
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
                  description!= null
                      ?
                 _showDialog()
                  : _showDialog2();
                },
              ),
            ),
        ]
      ),
      )
    );
  }


  Future _showDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("確認"),
          content: Text("こちらの説明でよろしでしょうか？"),
          actions: [
            TextButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BuyStep5(imageFile, category, brands, description),
                      )
                  );
                }
            ),
            TextButton(
              child: Text("No"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }


  Future _showDialog2() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("確認"),
          content: Text("説明書きは不要ですか？"),
          actions: [
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                description = '';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BuyStep5(imageFile, category, brands, description),
                    )
                );
              }
            ),
            TextButton(
              child: Text("No"),
              onPressed: () => Navigator.pop(context),
            ),
        ],
        );
      },
    );
  }


}