import 'package:cloud_firestore/cloud_firestore.dart';
import 'clothes_add/chooseCategory.dart';
import 'auth/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth/login_screen.dart';

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

  void userImage() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection('userinfo')
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: loggedInUser.image != null
                          ? Image.network(loggedInUser.image!)
                          : Container(
                          child:Center(
                            child :
                              Text(
                                'No image',
                              ),
                          ),

                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey
                          ),

                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("${loggedInUser.firstName} ${loggedInUser
                              .secondName}",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              )),
                          Text("${loggedInUser.email}",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                    )
                  ]
              ),
              SizedBox(
                height: 15,
              ),
              ActionChip(
                  label: Text("Logout"),
                  onPressed: () {
                    logout(context);
                  }),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: RaisedButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BuyPage(),
                          )
                      );
                    }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: RaisedButton(onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BuyPage(),
                            )
                        );
                      }
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
