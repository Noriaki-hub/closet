import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SellCloset extends StatelessWidget {

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
            SellAllCloset(),
            SellTopsCloset(),
            SellBottomsCloset(),
            SellOuterCloset(),
            SellFootwearCloset(),
            SellAccessoriesCloset(),
          ],
        ),
      ),
    );
  }
}

class SellAllCloset extends StatelessWidget {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid).collection('clothes').where(
      'sellGet', isEqualTo: 'yes').snapshots();


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
                              Text('¥' + data['selling'],
                                style: TextStyle(
                                  color: Colors.blue[800],
                                ),
                              ),
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

class SellTopsCloset extends StatelessWidget {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid).collection('clothes').where(
      'sellGet', isEqualTo: 'yes').where('category', isEqualTo: 'Tops').snapshots();


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
                              Text('¥' + data['selling'],
                                style: TextStyle(
                                  color: Colors.blue[800],
                                ),
                              ),
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



class SellBottomsCloset extends StatelessWidget {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid).collection('clothes').where(
      'sellGet', isEqualTo: 'yes').where('category', isEqualTo: 'Bottoms').snapshots();


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
                              Text('¥' + data['selling'],
                                style: TextStyle(
                                  color: Colors.blue[800],
                                ),
                              ),
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


class SellOuterCloset extends StatelessWidget {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid).collection('clothes').where(
      'sellGet', isEqualTo: 'yes').where('category', isEqualTo: 'Outer').snapshots();


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
                              Text('¥' + data['selling'],
                                style: TextStyle(
                                  color: Colors.blue[800],
                                ),
                              ),
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



class SellFootwearCloset extends StatelessWidget {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid).collection('clothes').where(
      'sellGet', isEqualTo: 'yes').where('category', isEqualTo: 'Footwear').snapshots();


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
                              Text('¥' + data['selling'],
                                style: TextStyle(
                                  color: Colors.blue[800],
                                ),
                              ),
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


class SellAccessoriesCloset extends StatelessWidget {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid).collection('clothes').where(
      'sellGet', isEqualTo: 'yes').where('category', isEqualTo: 'Accessories').snapshots();


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
                              Text('¥' + data['selling'],
                                style: TextStyle(
                                color: Colors.blue[800],
                              ),
                              ),
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

