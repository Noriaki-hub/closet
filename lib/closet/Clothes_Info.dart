import 'dart:ui';

import 'package:closet_app_xxx/clothes_sell/SellPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'closet_model.dart';

class ClothesInfo extends StatelessWidget {

  final Closet clothes;
  final ClosetModel model;

  ClothesInfo(this.clothes, this.model);

  String? selling;


  Future sellUpload(context) async{
    await _uploadFirebase();
    Navigator.popUntil(context, (route) => route.isFirst);
  }



  Future _uploadFirebase() async{
    final users= await FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;

    users.doc(user!.uid).collection('clothes').doc(clothes.id).update({
      'selling': selling,
      'sellGet' : 'yes',
      'buyGet' : 'no',
    },);
  }

  Future _showDialog(context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("エラー"),
          content: Text("金額を入力してください"),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  Future _showDialog2(context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("詳細"),
          content: Text(clothes.description),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
        height: 50,
        width: 50,
        child: InkWell(
            onTap: (){
              Navigator.pop(context, true);
              },
            child: Container(

              child: Center(
                  child: Text("Back",
                    style :TextStyle(color: Colors.black),
                  )
              ),
            )
        ),
      ),
        title: Text(clothes.brands,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,


        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
      ),
      drawerScrimColor: Colors.transparent,
      endDrawer: Container(
        width: 100,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Color.fromARGB(180, 250, 250, 250),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(31, 38, 135, 0.4),
                blurRadius: 8.0,
              )
            ],
            border: Border(
                right: BorderSide(
                  color: Colors.white70,
                ))),
        child: Stack(
          children: [
            SizedBox(
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4.0,
                    sigmaY: 4.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.grey.withOpacity(0.0),
                          Colors.white.withOpacity(0.2),
                        ])),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                DrawerHeader(
                  child: Row(
                    children: [

                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {},
                        title: Text("Home Page"),
                      ),
                      ListTile(
                        onTap: () {},

                        title: Text("Profile Page"),
                      ),
                      ListTile(
                        onTap: () {},
                        title: Text("Settings"),
                      ),
                      ListTile(
                        onTap: () {},
                        title: Text("Log Out"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),

      body:Center(
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
                              child: clothes.assetURL != '' ?
                              Image.asset(clothes.assetURL, width: 300,
                                height: 300,
                                fit: BoxFit.fitHeight,)
                                  : Image.network(clothes.imageURL, width: 300,
                                height: 300,
                                fit: BoxFit.fitHeight,),
                            )
                        )
                    )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: 250,
                height: 150,
                child: Text(clothes.description),
              )
            ]
        ),
      ),
    );
  }
  }