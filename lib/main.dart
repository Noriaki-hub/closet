

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'addClothes.dart';



void main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Welcome to Flutter',
        home: Home() //画面遷移をする部分を下のように別のクラスで定義し、それを読み込む
    );
  }
}


class Home extends StatelessWidget {

  final _tab = <Tab> [
    Tab( text:'Add'),
    Tab( text:'total'),
    Tab( text: 'archive',)
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Clothes"),
          bottom: TabBar(
            tabs: _tab,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            FirstPage(),
            SecondPage(),
            ThirdPage(),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            RaisedButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuyPage(),
                  )
              );
            }
            ),
            RaisedButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SellPage(),
                  )
              );
            }
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
      ),
    );
  }
}



class ThirdPage extends StatelessWidget {

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

        return
           GridView.count(
            crossAxisCount: 2,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String,dynamic> data = document.data()! as Map<String,dynamic>;
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey,
                      offset: new Offset(5.0, 5.0),
                      blurRadius: 10.0,
                    )
                  ],
                ),
                child: Column(
                    children: <Widget>[
                      Image.network(data['imageURL']),
                      Text(data['brands']),
                      Text('¥'+data['price']),
                    ]
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