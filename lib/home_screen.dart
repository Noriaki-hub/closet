import 'dart:ui';
import 'package:closet_app_xxx/clothes_sell/SellPage.dart';
import 'package:closet_app_xxx/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth/login_screen.dart';
import 'clothes_buy/chooseCategory.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }



  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
        ),
      drawerScrimColor: Colors.transparent,
      drawer: Container(
        width: 300,
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
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: loggedInUser.image == null
                              ? Text('No image')
                              : Image.network(
                            loggedInUser.image!,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),

                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("${loggedInUser.firstName}",
                          ),

                          Text("${loggedInUser.email}"
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.home,
                          color: Colors.black,
                        ),
                        title: Text("Home Page"),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        title: Text("Profile Page"),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                        title: Text("Settings"),
                      ),
                      ListTile(
                        onTap: () {
                          logout(context);
                        },
                        leading: Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
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

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: RaisedButton(
                          child: Text(
                              'Buy',
                              style: TextStyle(
                                fontSize: 50,
                              )
                          ),
                          onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BuyPage(),
                            )
                        );
                      }
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: RaisedButton(
                          child: Text(
                              'Sell',
                              style: TextStyle(
                                fontSize: 50,
                              )
                          ),
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SellPage(),
                                )
                            );
                      }
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void pushWithReloadByReturn(BuildContext context)  { // [*2]
      Navigator.push( // [*3]
      context,
      new MaterialPageRoute<bool>( // [*4]
        builder: (BuildContext context) => SecondPage(),
      ),
    );
  }




  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}

