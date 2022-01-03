import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';


class BuyStep5 extends StatefulWidget {

  String? category;
  File? imageFile;
  String? brands;
  String? description;
  BuyStep5(this.imageFile, this.category, this.brands, this.description);

  @override
  State<StatefulWidget> createState() {
    return _BuyStep5(imageFile, category, brands, description);
  }
}

class _BuyStep5 extends State<BuyStep5> {

  String? category;
  File? imageFile;
  String? brands;
  String? description;

  _BuyStep5(this.imageFile, this.category, this.brands, this.description);

  String? price;

  String buyGet = 'yes';
  String sellGet = 'no';

  final maxLines = 5;
  
  String assets = '';

  String _assets(){
    switch (category) {
      case ('Tops'):
        assets = 'images/Tops.png';
        break;
      case ('Bottoms'):
        assets = 'images/Bottoms.png';
        break;
      case ('Outer'):
        assets = 'images/Outer.png';
        break;
      case ('Footwear'):
        assets = 'images/Footwear.png';
        break;
      case ('Accessories'):
        assets = 'images/Accessories.png';
        break;
    }
    return assets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          title: Text("Confirmation",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
             SizedBox(
              height: 50,
              width: 50,
              child: InkWell(
                  onTap: (){
                    _showDialog2();

                  },
                  child: Container(

                    child: Center(
                        child: Text("Cancel",
                          style :TextStyle(color: Colors.red),
                        )
                    ),
                  )
              ),
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.all(12),
                    child: GestureDetector(
                        child:
                        CircleAvatar(
                          radius: 155,
                          backgroundColor: Colors.black54,
                          child:  ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Container(
                              color: Colors.white,
                              child: imageFile != null ?
                              Image.file(
                                imageFile!,
                                width: 300,
                                height: 300,
                                fit: BoxFit.fitHeight,
                              )
                                  :
                                  Image.asset(
                                 _assets(),
                                    width: 300,
                                    height: 300,
                                    fit: BoxFit.fitHeight,
                                  )
                            ),
                          )
                        )
                    ),
                  ),
                  Container(
                    width: 250,
                    child: TextField(
                      controller: TextEditingController(text: brands),
                      decoration: InputDecoration(
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
                  Container(
                    margin: EdgeInsets.all(12),
                    height: maxLines * 24.0,
                    width: 250,
                    child: TextField(
                      controller: TextEditingController(text: description),
                      maxLines: maxLines,
                      decoration: InputDecoration(
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
                  Container(
                    width: 250,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '¥',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.black45,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.black,
                            )
                        ),
                      ),
                      onChanged: (text){
                        price = text;
                      }
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
                        price != null ?
                            upload()
                        : _showDialog();
                      },
                    ),
                  ),
                ]
            ),
          ),
        )
    );
  }

  Future upload() async {
    int count = 0;
    await _uploadFirebase();
    Navigator.popUntil(context, (_) => count++ >= 7);
  }

  Future _showDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("エラー"),
          content: Text("金額を入力してください"), actions: [
            TextButton(
            child: Text("OK"),
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
          content: Text("中断しますか？"),
          actions: [
          TextButton(
            child: Text("Yes"),
            onPressed: () => Navigator.pushNamed(context, 'BuyPage')
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


  Future _uploadFirebase() async {
    String? imageURL;
    String? assetURL;

    imageFile != null ?
    imageURL = await _uploadImageFile()
    : imageURL = '';

    imageFile != null ?
        assetURL = ''
    : assetURL = _assets();



    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    users.doc(user!.uid).collection('clothes').add(
      {
        'brands': brands,
        'price': price,
        'category': category,
        'imageURL': imageURL,
        'assetURL' : assetURL,
        'description' : description,
        'updateAt': Timestamp.now(),


        'buyGet': buyGet,
        'sellGet': sellGet,
        'selling': ''

      },
    );
  }


  Future<String> _uploadImageFile() async {
    User? user = FirebaseAuth.instance.currentUser;

    final userEmail = user!.email;
    final storage = FirebaseStorage.instance;
    TaskSnapshot snapshot = await storage
        .ref()
        .child("userinfo/$userEmail/$brands")
        .putFile(imageFile!);
    final String downloadUrl =
    await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }



}



