import 'package:closet_app_xxx/closet/closet_buy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'closet_model.dart';

class ClothesInfo extends StatelessWidget {

  final Closet clothes;
  final ClosetModel model;
  ClothesInfo(this.clothes, this.model,);



  String selling = '';

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid).collection('clothes').where(
      'buyGet', isEqualTo : 'yes').snapshots();


  Future sellAdd() async{
    final users= await FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;

    users.doc(user!.uid).collection('clothes').doc(clothes.id).update({
      'selling': selling,
      'sellGet' : 'yes',
      'buyGet' : 'no',
    },);
  }

  Future delete() async {
    final users = await FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;

    users.doc(user!.uid).collection('clothes').doc(clothes.id).delete();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
        ),
        body: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              return Scaffold(
                body: Stack(
                  children: [
                    Hero(
                      tag: 'hello' + clothes.id,
                      child: Container(
                          height: double.infinity,
                          color: Colors.white,
                          child: Center(


                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.network(clothes.imageURL),

                                  Text(clothes.brands),


                                  TextField(
                                    onChanged: (text){
                                      selling = text;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Selling price",
                                    ),
                                  ),

                                  FlatButton(
                                    onPressed: () async {
                                      await sellAdd();
                                      Navigator.popUntil(context, (route) => route.isFirst);
                                    },
                                    child: Text("sell"),
                                    color: Colors.blueAccent,
                                  ),
                                  FlatButton(
                                    onPressed: () async {
                                      await showConfirmDialog(context, clothes, model);
                                    },
                                    child: Text("delete"),
                                    color: Colors.blueAccent,
                                  ),
                                ],
                              )
                          )
                      ),
                    ),
                  ]
                ),
              );
            },
          ),
        )
    );
  }

  Future showConfirmDialog(
      BuildContext context,
      Closet clothes,
      ClosetModel model,
      ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("削除の確認"),
          content: Text("『${clothes.brands}』を削除しますか？"),
          actions: [
            TextButton(
              child: Text("いいえ"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text("はい"),
              onPressed: () async {
                // modelで削除
                await delete();
                Navigator.popUntil(context, (route) => route.isFirst);
                final snackBar = SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('${clothes.brands}を削除しました'),
                );
                model.fetchClosetList();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
        );
      },
    );
  }
}

