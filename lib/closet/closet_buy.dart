
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Clothes_Info.dart';
import 'closet_model.dart';


class MyStatelessWidget extends StatelessWidget {

  final _tab = <Tab> [
    Tab( text:'All'),
    Tab( text:'Tops'),
    Tab( text:'Bottoms'),
    Tab( text:'Outer'),
    Tab( text:'Footwear'),
    Tab( text:'Accessories'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:  TabBar(
            tabs: _tab,
            labelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BubbleTabIndicator(
              indicatorHeight: 25.0,
              indicatorColor: Colors.grey,
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              // Other flags
              // indicatorRadius: 1,
              // insets: EdgeInsets.all(1),
              // padding: EdgeInsets.all(10)
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            BuyAllCloset(),
            BuyTopsCloset(),
            BuyBottomsCloset(),
            BuyOuterCloset(),
            BuyFootwearCloset(),
            BuyAccessoriesCloset(),
          ],
        ),
      ),
    );
  }
}

class BuyAllCloset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClosetModel>(create: (_) =>
        ClosetModel()..fetchClosetList(),
        ),
      ],
      child: Scaffold(
        body: Center(
            child: Consumer<ClosetModel>(builder: (context, model, child) {
              final List<Closet>? closet2 = model.closet2;

              if (closet2 == null) {
                return CircularProgressIndicator();
              }
              final List<Widget> widgets = closet2
                  .map(
                    (clothes) => InkWell(
                      highlightColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ClothesInfo(clothes),
                            )
                        );
                      },
                      child: Container(
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
                          child: Image.network(clothes.imageURL)
                        ),
                      ),
                    ),
              )
                  .toList();

              return
                Scaffold(
                  body: Center(
                      child:
                      GridView.count(
                        crossAxisCount: 2,
                        children: widgets,
                      ),
                  ),
                );
            })
        ),
      ),
    );
  }
}

class BuyTopsCloset extends StatelessWidget {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid).collection('clothes')
      .where('buyGet', isEqualTo : 'yes')
      .where('category', isEqualTo: 'Tops').snapshots();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                              Text('¥' + data['price']),
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



class BuyBottomsCloset extends StatelessWidget {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid).collection('clothes')
      .where('buyGet', isEqualTo : 'yes')
      .where('category', isEqualTo: 'Bottoms').snapshots();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                              Text('¥' + data['price']),
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


class BuyOuterCloset extends StatelessWidget {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid).collection('clothes')
      .where('buyGet', isEqualTo : 'yes')
      .where('category', isEqualTo: 'Outer').snapshots();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                              Text('¥' + data['price']),
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



class BuyFootwearCloset extends StatelessWidget {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid).collection('clothes')
      .where('buyGet', isEqualTo : 'yes')
      .where('category', isEqualTo: 'Footwear').snapshots();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                              Text('¥' + data['price']),
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


class BuyAccessoriesCloset extends StatelessWidget {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid).collection('clothes')
      .where('buyGet', isEqualTo : 'yes')
      .where('category', isEqualTo: 'Accessories').snapshots();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                              Text('¥' + data['price']),
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