
import 'package:closet_app_xxx/totalPriceModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'clothes.dart';



class BuyTotal extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TotalPriceModel>(create: (_) =>
        TotalPriceModel()
          ..fetchClothesList(),
        ),
        ChangeNotifierProvider<TopsTotal>(create: (_) =>
        TopsTotal()
          ..fetchClothesListTops(),
        ),
        ChangeNotifierProvider<BottomsTotal>(create: (_) =>
        BottomsTotal()..fetchClothesListBottoms(),
        )
      ],
      child: Scaffold(
        body: Center(
            child: Column(
              children: [
                Consumer<TotalPriceModel>(builder: (context, model, child) {
                  final List<Clothes>? clothes2 = model.clothes2;

                  if (clothes2 == null) {
                    return CircularProgressIndicator();
                  }

                  final sum = clothes2
                      .map<int>((clothes) => int.parse(clothes.price))
                      .reduce((curr, next) => curr + next);

                  String sum2 = "$sum";

                  return
                    ListTile(
                      leading: Text('total'),
                      trailing: Text(sum2),
                    );
                }),

                Consumer<TopsTotal>(builder: (context, model, child) {
                  final List<Clothes>? topsclothes2 = model.topsclothes2;
                  if (topsclothes2 == null) {
                    return CircularProgressIndicator();
                  }
                  final topsSum = topsclothes2
                      .map<int>((topsclothes) => int.parse(topsclothes.price))
                      .reduce((curr, next) => curr + next);

                  String topsSum2 = "$topsSum";


                  return
                    ListTile(
                      leading: Text('Tops'),
                      trailing: Text(topsSum2),
                    );
                }),
                Consumer<BottomsTotal>(builder: (context, model, child) {
                  final List<Clothes>? bottomsclothes2 = model.bottomsclothes2;
                  if (bottomsclothes2 == null) {
                    return CircularProgressIndicator();
                  }
                  final bottomsSum = bottomsclothes2
                      .map<int>((bottomsclothes) => int.parse(bottomsclothes.price))
                      .reduce((curr, next) => curr + next);

                  String bottomsSum2 = "$bottomsSum";


                  return
                    ListTile(
                      leading: Text('Bottoms'),
                      trailing: Text(bottomsSum2),
                    );
                }),
              ],
            )
        ),
      ),
    );
  }
}


class sellTotal extends StatelessWidget {

  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('clothes').snapshots();

  var listItem = ["Tops", "Outer", "bottoms", "Footwear", "accessories",];

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
                    return Text("Loading");
                  }

                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Padding(
                          child: Text(listItem[index],
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
