import 'dart:ui';
import 'package:closet_app_xxx/clothes_sell/SellPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'EditInfo.dart';
import 'closet_model.dart';

class ClothesInfo extends StatelessWidget {

  final Closet clothes;
  final ClosetModel model;

  ClothesInfo(this.clothes, this.model);

  String? selling;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          height: 50,
          width: 50,
          child: InkWell(
              onTap: () {
                back(context);
              },
              child: Container(

                child: Center(
                    child: Text("Back",
                      style: TextStyle(color: Colors.black),
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
        width: 80,
        height: 200,
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
                Expanded(
                  child: ListView(
                    children: [

                      ListTile(
                        onTap: () async {
                          final result =
                          await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  EditPage(clothes),
                              )
                          );
                          if (result) {
                            back(context);
                          }
                        },
                        title: Text("Edit"),
                      ),

                      ListTile(
                        onTap: () async {
                          final result =
                          await _showDialog(context);
                          if (result) {
                            back(context);
                          }
                        },
                        title: Text('Delete'),
                      ),

                      Container(
                          child: clothes.selling != "" ?
                              ListTile(
                                title: Text(''),
                              ):
                          ListTile(
                            onTap: () async {
                              var result =
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      SellPage2(clothes,),
                                  )
                              );
                              if (result) {
                                Navigator.pop(context, true);
                              }
                            },
                            title: Text("Sell"),
                          )

                      ),

                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),

      body: Center(
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
                        child: ClipRRect(
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

  back(context) {
    Navigator.pop(context, true);
  }

  Future delete() async{
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    users.doc(user!.uid).collection('clothes').doc(clothes.id).delete(
    );
  }


  Future _showDialog(context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("確認"),
          content: Text("削除してよろしいですか？"),
          actions: [
            TextButton(
                child: Text("Yes"),
                onPressed: () async{
                  await delete();
                  Navigator.pop(context, true);
                  Navigator.pop(context, true);
      }
            ),
            TextButton(
              child: Text("No"),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        );
      },
    );
  }
}