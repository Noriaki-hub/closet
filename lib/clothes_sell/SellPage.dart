import 'package:closet_app_xxx/clothes_buy/clothes_model.dart';
import 'package:closet_app_xxx/clothes_sell/SellModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class SellPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SellModel>(create: (_) =>
        SellModel()..fetchSellClothesList(),
        ),
      ],
      child: Scaffold(
        body: Center(
            child: Consumer<SellModel>(builder: (context, model, child) {
              final List<Clothes>? clothes2 = model.clothes2;

              if (clothes2 == null) {
                return CircularProgressIndicator();
              }
              final List<Widget> widgets = clothes2
                  .map(
                    (clothes) => ListTile(
                    title: Text(clothes.brands),
                    subtitle: Text(clothes.category),
                    leading: Image.network(clothes.imageURL),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SellPage2(clothes),
                            )
                        );
                      },
                    ),
                  )
              .toList();

              return
                Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.blue[900],
                  ),
                  body: Center(
                    child:
                    ListView(
                      children: widgets,
                    )
                  ),



                );
            })
        ),
      ),
    );
  }
}


class SellPage2 extends StatelessWidget {

  final Clothes clothes;
  SellPage2(this.clothes);

  String selling = '';

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid).collection('clothes').where(
      'closetGet', isEqualTo: 'ok').where(
      'selling', isEqualTo: '0').snapshots();


  Future sellAdd() async{
    final users= await FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;

    users.doc(user!.uid).collection('clothes').doc(clothes.id).update({
     'selling': selling,
    },);
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
                body: Container(
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
                          ],
                        )
                    )
                ),
              );
            },
          ),
        )
    );
  }
}