import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          title: Text("Confirmation",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                    child: CircleAvatar(
                        radius: 155,
                        backgroundColor: Colors.black54,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.file(
                            imageFile!,
                            width: 300,
                            height: 300,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                    )
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
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        )
                    ),
                    onChanged: (text) {
                      price = text;
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
                    onPressed: () async{
                      await _uploadFirebase();
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                  ),
                ),
              ]
          ),
        )
    );
  }


  Future _uploadFirebase() async {
    final imageURL = await _uploadImageFile();
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    users.doc(user!.uid).collection('clothes').add(
      {
        'brands': brands,
        'price': price,
        'category': category,
        'imageURL': imageURL,
        'description' : description,
        'updateAt': Timestamp.now(),

        'buyGet': buyGet,
        'sellGet': sellGet,
        'selling': '0'

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



