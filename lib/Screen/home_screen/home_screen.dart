import 'dart:ui';
import 'package:closet_app_xxx/Screen/closet_screen/closet_screen.dart';
import 'package:closet_app_xxx/Screen/home_screen/home_screen_model.dart';
import 'package:closet_app_xxx/clothes_sell/SellPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../../auth/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../auth/login_screen.dart';
import '../../clothes_buy/BuyStep1.dart';
import '../expenses_screen/expenses_screen.dart';

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
    return MultiProvider(providers: [
      ChangeNotifierProvider<HomeModel>(create: (_) =>
      HomeModel()
        ..getNumberAll(),

      ),

    ],

        child: Consumer<HomeModel>(
            builder: (context, model, child) {
              final String? clothesNumber = model
                  .clothes?.length.toString();

              final String? clothesNumberTops = model
                  .clothesTops?.length
                  .toString();

              final String? clothesNumberBottoms = model
                  .clothesBottoms?.length
                  .toString();

              final String? clothesNumberOuter = model
                  .clothesOuter?.length
                  .toString();

              final String? clothesNumberFootwear = model
                  .clothesFootwear?.length
                  .toString();

              final String? clothesNumberAccessories = model
                  .clothesAccessories?.length
                  .toString();

              if (clothesNumber == null) {
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: Colors.grey,
                        )
                    ),
                  ),
                );
              }

              if (clothesNumberTops ==
                  null) {
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: Colors.grey,
                        )
                    ),
                  ),
                );
              }

              if (clothesNumberBottoms ==
                  null) {
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: Colors.grey,
                        )
                    ),
                  ),
                );
              }

              if (clothesNumberOuter ==
                  null) {
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: Colors.grey,
                        )
                    ),
                  ),
                );
              }

              if (clothesNumberFootwear ==
                  null) {
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: Colors.grey,
                        )
                    ),
                  ),
                );
              }

              if (clothesNumberAccessories ==
                  null) {
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: Colors.grey,
                        )
                    ),
                  ),
                );
              }


              return

                Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                      backgroundColor: Colors.white70
                  ),

                  body: Center(
                    child: SingleChildScrollView(
                      child: Column(

                        children: <Widget>[

                          Container(
                            width: 400,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.1)
                            ),
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Container(
                                      decoration: BoxDecoration(
                                      ),
                                      child: loggedInUser.image == null
                                          ? CircleAvatar()
                                          : Image.network(
                                        loggedInUser.image!,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("${loggedInUser.firstName}",
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,

                                        ),
                                      ),


                                      Container(
                                        width: 200,
                                        height: 36,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                10),
                                            color: Colors.grey.withOpacity(
                                                0.1)),
                                        child: Column(
                                            children: [


                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                          width: 20,
                                                          height: 10,
                                                          child: Text('ALL'
                                                            ,
                                                            style: TextStyle(
                                                                fontSize: 9
                                                            ),
                                                          )
                                                      ),
                                                      Text(clothesNumber)
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                          width: 10,
                                                          height: 10,
                                                          child: Image.asset(
                                                            'images/Tops.png',
                                                            fit: BoxFit
                                                                .contain,
                                                          )
                                                      ),
                                                      Text(clothesNumberTops)
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                          width: 10,
                                                          height: 10,
                                                          child: Image.asset(
                                                            'images/Bottoms.png',
                                                            fit: BoxFit
                                                                .contain,
                                                          )
                                                      ),
                                                      Text(clothesNumberBottoms)
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                          width: 10,
                                                          height: 10,
                                                          child: Image.asset(
                                                            'images/Outer.png',
                                                            fit: BoxFit
                                                                .contain,
                                                          )
                                                      ),
                                                      Text(clothesNumberOuter)
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                          width: 10,
                                                          height: 10,
                                                          child: Image.asset(
                                                            'images/Footwear.png',
                                                            fit: BoxFit
                                                                .contain,
                                                          )
                                                      ),
                                                      Text(
                                                          clothesNumberFootwear)
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                          width: 10,
                                                          height: 10,
                                                          child: Image.asset(
                                                            'images/Accessories.png',
                                                            fit: BoxFit
                                                                .contain,
                                                          )
                                                      ),
                                                      Text(
                                                          clothesNumberAccessories)
                                                    ],
                                                  )

                                                ],
                                              )


                                            ]
                                        ),
                                      )

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 50,
                          ),

                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                    children: [
                                      InkWell(
                                          onTap: () async {
                                            final result = await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      BuyPage(),
                                                )
                                            );
                                            if (result) {
                                              model.getNumberAll();


                                            }
                                          },
                                          child: Container(
                                            width: 150,
                                            height: 150,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(20),
                                                color: Colors.grey.withOpacity(
                                                    0.1)
                                            ),
                                            child:
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,

                                              children: [
                                                Image.asset("images/buy.png",
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ],
                                            ),
                                          )
                                      ),
                                      Container(
                                        child: Center(
                                            child: Text('Buy', style: TextStyle(
                                                fontWeight: FontWeight.bold),)),
                                      ),
                                    ]
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () async{
                                          final result = await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SellPage(),
                                              )
                                          );
                                          if (result){

                                            model.getNumberAll();



                                          }
                                        },
                                        child: Container(
                                          width: 150,
                                          height: 150,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(20),
                                              color: Colors.grey.withOpacity(
                                                  0.1)
                                          ),
                                          child:
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,

                                            children: [
                                              Image.asset("images/sell.png",
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                    Container(
                                      child: Center(
                                          child: Text('Sell', style: TextStyle(
                                              fontWeight: FontWeight.bold),)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      InkWell(
                                          onTap: () async{
                                            final result = await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ClosetScreen(),
                                                )
                                            );
                                            if (result){

                                             model.getNumberAll();



                                            }
                                          },
                                          child: Container(
                                            width: 150,
                                            height: 150,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(20),
                                                color: Colors.grey.withOpacity(
                                                    0.1)
                                            ),
                                            child:
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,

                                              children: [
                                                Image.asset("images/closet.png",
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ],
                                            ),
                                          )
                                      ),
                                      Container(
                                        child: Center(
                                            child: Text(
                                              'Closet', style: TextStyle(
                                                fontWeight: FontWeight.bold),)),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ExpensesPage(),
                                                )
                                            );
                                          },
                                          child: Container(
                                            width: 150,
                                            height: 150,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(20),
                                                color: Colors.grey.withOpacity(
                                                    0.1)
                                            ),
                                            child:
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,

                                              children: [
                                                Image.asset(
                                                  "images/Expenses.png",
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ],
                                            ),
                                          )
                                      ),
                                      Container(
                                        child: Center(child: Text(
                                          'Expenses', style: TextStyle(
                                            fontWeight: FontWeight.bold),)),
                                      )
                                    ],
                                  ),
                                ]
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                );
            }
        )
    );
  }


  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }


}

