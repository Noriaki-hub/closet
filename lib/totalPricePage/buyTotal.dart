import 'package:closet_app_xxx/clothes_buy/clothes_model.dart';
import 'package:closet_app_xxx/totalPricePage/buyTotal_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class BuyTotal extends StatelessWidget {
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

                Padding(
                  padding: const EdgeInsets.all(50),
                  child: SizedBox(
                    height: 100,
                    child: Consumer<TotalPriceModel>(builder: (context, model, child) {
                      final List<Clothes>? clothes2 = model.clothes2;

                      if (clothes2 == null) {
                        return CircularProgressIndicator();
                      }

                      final sum = clothes2
                          .map<int>((clothes) => int.parse(clothes.price))
                          .reduce((curr, next) => curr + next);

                      String sum2 = "$sum";



                      return
                        Center(
                          child: Container(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text('¥$sum2',
                                style: TextStyle(fontSize: 100),
                        ),
                        )
                      )
                        );
                    }),
                  ),
                ),

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


