import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SellCloset extends StatelessWidget {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid).collection('clothes').where(
      'selling', isNotEqualTo: '0').snapshots();


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

              return
                GridView.count(
                  crossAxisCount: 2,
                  children: snapshot.data!.docs.map((
                      DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()! as Map<
                        String,
                        dynamic>;
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.grey,
                            offset: Offset(5.0, 5.0),
                            blurRadius: 10.0,
                          )
                        ],
                      ),

                      child: SingleChildScrollView(
                        child: Column(
                            children: <Widget>[
                              Image.network(data['imageURL']),
                              Text(data['brands']),
                              Text('¥' + data['selling']),
                            ]
                        ),
                      ),
                    );
                  }).toList(),
                );
            },
          ),
        )
    );
  }
}