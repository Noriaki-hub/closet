import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:closet_app_xxx/totalPricePage/buyTotal.dart';
import 'package:closet_app_xxx/totalPricePage/sellTotal.dart';
import 'package:flutter/material.dart';

class TotalScreen extends StatelessWidget {

  final _tab = <Tab> [
    Tab( text:'Buy'

    ),
    Tab( text:'Sell'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(45),
                  child: TabBar(
                    tabs: _tab,
                    labelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BubbleTabIndicator(
                      indicatorHeight: 25.0,
                      indicatorColor: Colors.grey,
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                      // Other flags
                      // indicatorRadius: 1,
                      // insets: EdgeInsets.all(1),
                      // padding: EdgeInsets.all(10)
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        body: TabBarView(
          children: <Widget>[
            BuyTotal(),
            SellTotal(),
          ],
        ),
      ),
    );
  }
}