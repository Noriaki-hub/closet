import 'package:closet_app_xxx/model/clothes_model.dart';
import 'package:closet_app_xxx/totalPricePage/sellTotal_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class SellTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SellTotalPriceModel>(create: (_) =>
        SellTotalPriceModel()..fetchSellClothesList(),
        ),
        ChangeNotifierProvider<SellTopsTotal>(create: (_) =>
        SellTopsTotal()..fetchSellClothesListTops(),
        ),
        ChangeNotifierProvider<SellBottomsTotal>(create: (_) =>
        SellBottomsTotal()..fetchSellClothesListBottoms(),
        ),
        ChangeNotifierProvider<SellOuterTotal>(create: (_) =>
        SellOuterTotal()..fetchSellClothesListOuter(),
        ),
        ChangeNotifierProvider<SellFootwearTotal>(create: (_) =>
        SellFootwearTotal()..fetchSellClothesListFootwear(),
        ),
        ChangeNotifierProvider<SellAccessoriesTotal>(create: (_) =>
        SellAccessoriesTotal()..fetchSellClothesListAccessories(),
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
                    child: Consumer<SellTotalPriceModel>(builder: (context, model, child) {
                      final List<Clothes>? clothes2 = model.clothes2;

                      if (clothes2 == null) {
                        return CircularProgressIndicator();
                      }

                      final sum = clothes2
                          .map<int>((clothes) => int.parse(clothes.selling))
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

                Consumer<SellTopsTotal>(builder: (context, model, child) {
                  final List<Clothes>? topsclothes2 = model.topsclothes2;

                  if (topsclothes2 == null) {
                    return CircularProgressIndicator();
                  }
                  final topsSum = topsclothes2
                      .map<int>((topsclothes) => int.parse(topsclothes.selling))
                      .reduce((curr, next) => curr + next);

                  String topsSum2 = "$topsSum";


                  return
                    ListTile(
                      leading: Text('Tops'),
                      trailing: Text(topsSum2),
                    );
                }),
                Consumer<SellBottomsTotal>(builder: (context, model, child) {
                  final List<Clothes>? bottomsclothes2 = model.bottomsclothes2;
                  if (bottomsclothes2 == null) {
                    return CircularProgressIndicator();
                  }
                  final bottomsSum = bottomsclothes2
                      .map<int>((bottomsclothes) => int.parse(bottomsclothes.selling))
                      .reduce((curr, next) => curr + next);

                  String bottomsSum2 = "$bottomsSum";



                  return
                    ListTile(
                      leading: Text('Bottoms'),
                      trailing: Text(bottomsSum2),
                    );

                }),
                Consumer<SellOuterTotal>(builder: (context, model, child) {
                  final List<Clothes>? outerclothes2 = model.outerclothes2;
                  if (outerclothes2 == null) {
                    return CircularProgressIndicator();
                  }
                  final outerSum = outerclothes2
                      .map<int>((outerclothes) => int.parse(outerclothes.selling))
                      .reduce((curr, next) => curr + next);

                  String outerSum2 = "$outerSum";


                  return
                    ListTile(
                      leading: Text('Outer'),
                      trailing: Text(outerSum2),
                    );
                }),
                Consumer<SellFootwearTotal>(builder: (context, model, child) {
                  final List<Clothes>? footwearclothes2 = model.footwearclothes2;
                  if (footwearclothes2 == null) {
                    return CircularProgressIndicator();
                  }
                  final footwearSum = footwearclothes2
                      .map<int>((footwearclothes) => int.parse(footwearclothes.selling))
                      .reduce((curr, next) => curr + next);

                  String footwearSum2 = "$footwearSum";


                  return
                    ListTile(
                      leading: Text('Footwear'),
                      trailing: Text(footwearSum2),
                    );
                }),
                Consumer<SellAccessoriesTotal>(builder: (context, model, child) {
                  final List<Clothes>? accessoriesclothes2 = model.accessoriesclothes2;
                  if (accessoriesclothes2 == null) {
                    return CircularProgressIndicator();
                  }
                  final accessoriesSum = accessoriesclothes2
                      .map<int>((accessoriesclothes) => int.parse(accessoriesclothes.selling))
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



