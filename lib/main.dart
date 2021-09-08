import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'totalPricePage/totalPrice.dart';
import 'clothes_add/chooseCategory.dart';
import 'login_page.dart';


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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

// SingleTickerProviderStateMixinを使用。後述
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  late PageController _pageController;

  // ページインデックス保存用
  int _screen = 0;

  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.book),
        title: const Text('add'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.cloud),
        title: const Text('total'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.cake),
        title: const Text('closet'),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    // コントローラ作成
    _pageController = PageController(
      initialPage: _screen,
    );
  }

  @override
  void dispose() {
    // コントローラ破棄
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      // Appbar
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("",
          style: TextStyle(fontSize: 16),
        ),
      ),
      // ),

      body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _screen = index;
            });
          },
          children: [
            FirstPage(),
            SecondPage(),
            ThirdPage(),
          ]),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _screen,
        onTap: (index) {
          setState(() {
            _screen = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeOut);
          });
        },
        items: myBottomNavBarItems(),
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
                  MaterialPageRoute(builder: (context) => LoginPage(),
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

  final _tab = <Tab> [
    Tab( text:'Buy'),
    Tab( text:'Sell'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          flexibleSpace: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TabBar(
                  tabs: _tab,
                )
              ],
            ),
          ),
          ),

        body: TabBarView(
          children: <Widget>[
            BuyTotal(),
            sellTotal(),
          ],
        ),
      ),
    );
  }
}





class ThirdPage extends StatelessWidget {

  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('clothes').where('closetGet', isEqualTo: 'ok').snapshots();


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
          return CircularProgressIndicator();
        }

        return
           GridView.count(
            crossAxisCount: 2,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String,dynamic> data = document.data()! as Map<String,dynamic>;
              return  Container(
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
                              Text('¥'+data['price']),
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