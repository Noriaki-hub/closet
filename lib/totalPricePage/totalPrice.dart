
import 'package:closet_app_xxx/totalPricePage/totalPriceModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../clothes_add/clothes_model.dart';
import 'package:pie_chart/pie_chart.dart';



class BuyTotal extends StatelessWidget {


  Map<String, double> dataMap = {
    "Tops": 1,
    "Bottoms": 1,
    "Outer": 2,
    "Footwear": 2,
    "Accessories": 2,
  };


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TotalPriceModel>(create: (_) =>
        TotalPriceModel()..fetchClothesList(),
        ),
        ChangeNotifierProvider<TopsTotal>(create: (_) =>
        TopsTotal()..fetchClothesListTops(),
        ),
        ChangeNotifierProvider<BottomsTotal>(create: (_) =>
        BottomsTotal()..fetchClothesListBottoms(),
        ),
        ChangeNotifierProvider<OuterTotal>(create: (_) =>
        OuterTotal()..fetchClothesListOuter(),
        ),
        ChangeNotifierProvider<FootwearTotal>(create: (_) =>
        FootwearTotal()..fetchClothesListFootwear(),
        ),
        ChangeNotifierProvider<AccessoriesTotal>(create: (_) =>
        AccessoriesTotal()..fetchClothesListAccessories(),
        ),
      ],
      child: Scaffold(
        body: Center(
            child: Column(
              children: [
                PieChart(dataMap: dataMap),

                Consumer<TotalPriceModel>(builder: (context, model, child) {
                  final List<Clothes>? clothes2 = model.clothes2;

                  if (clothes2 == null) {
                    return CircularProgressIndicator();
                  }

                  final sum = clothes2
                      .map<double>((clothes) => double.parse(clothes.price))
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
                Consumer<OuterTotal>(builder: (context, model, child) {
                  final List<Clothes>? outerclothes2 = model.outerclothes2;
                  if (outerclothes2 == null) {
                    return CircularProgressIndicator();
                  }
                  final outerSum = outerclothes2
                      .map<int>((outerclothes) => int.parse(outerclothes.price))
                      .reduce((curr, next) => curr + next);

                  String outerSum2 = "$outerSum";


                  return
                    ListTile(
                      leading: Text('Outer'),
                      trailing: Text(outerSum2),
                    );
                }),
                Consumer<FootwearTotal>(builder: (context, model, child) {
                  final List<Clothes>? footwearclothes2 = model.footwearclothes2;
                  if (footwearclothes2 == null) {
                    return CircularProgressIndicator();
                  }
                  final footwearSum = footwearclothes2
                      .map<int>((footwearclothes) => int.parse(footwearclothes.price))
                      .reduce((curr, next) => curr + next);

                  String footwearSum2 = "$footwearSum";


                  return
                    ListTile(
                      leading: Text('Footwear'),
                      trailing: Text(footwearSum2),
                    );
                }),
                Consumer<AccessoriesTotal>(builder: (context, model, child) {
                  final List<Clothes>? accessoriesclothes2 = model.accessoriesclothes2;
                  if (accessoriesclothes2 == null) {
                    return CircularProgressIndicator();
                  }
                  final accessoriesSum = accessoriesclothes2
                      .map<int>((accessoriesclothes) => int.parse(accessoriesclothes.price))
                      .reduce((curr, next) => curr + next);

                  String accessoriesSum2 = "$accessoriesSum";


                  return
                    ListTile(
                      leading: Text('Accessories'),
                      trailing: Text(accessoriesSum2),
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
