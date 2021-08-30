import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class buyTotal extends StatelessWidget {

  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('clothes').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }


              final sum = snapshot.data!.docs
                  .map<int>((doc) => int.parse(doc["price"]))
                  .reduce((curr, next) => curr + next);

              String sum2 = "$sum";

              return Center(
                child: Column(
                  children: [
                    Text("¥" + sum2)],
              )
              );
            }
          )
        )
    );
  }
}






















class sellTotal extends StatelessWidget {

  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('clothes').snapshots();

  var listItem = ["Tops", "Outer", "bottoms", "Footwear", "accessories", ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Center(
            child: StreamBuilder<QuerySnapshot>(
                stream: _usersStream,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Padding(
                          child: Text( listItem[index],
                          ),
                          padding: EdgeInsets.all(20.0),),
                      );
                    },
                    itemCount: listItem.length,
                  );
                }
            )
        )
    );
  }
}
