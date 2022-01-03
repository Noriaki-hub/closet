import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:closet_app_xxx/closet/closet_buy.dart';
import 'package:closet_app_xxx/closet/closet_sell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClosetScreen extends StatelessWidget{
  final _tab = <Tab> [
    Tab( text:'Hold'),
    Tab( text:'Sold'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          leading: SizedBox(
            height: 50,
            width: 50,
            child: InkWell(
                onTap: (){
                  Navigator.pop(context, true);
                },
                child: Container(

                  child: Center(
                      child: Text("Back",
                        style :TextStyle(color: Colors.black),
                      )
                  ),
                )
            ),
          ),
          automaticallyImplyLeading: false,
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
            BuyCloset(),
            SellCloset(),
          ],
        ),
      ),
    );
  }



}