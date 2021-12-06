

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Clothes_Info.dart';
import 'closet_model.dart';


class MyStatelessWidget extends StatelessWidget {

  final _tab = <Tab> [
    Tab( text:'All'),
    Tab( text:'Tops'),
    Tab( text:'Bottoms'),
    Tab( text:'Outer'),
    Tab( text:'Footwear'),
    Tab( text:'Accessories'),
  ];




  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:  TabBar(
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
        ),
        body: TabBarView(
          children: <Widget>[
            BuyAllCloset(),
            BuyTopsCloset(),
            BuyBottomsCloset(),
            BuyOuterCloset(),
            BuyFootwearCloset(),
            BuyAccessoriesCloset(),
          ],
        ),
      ),
    );
  }
}

class BuyAllCloset extends StatefulWidget {
  @override
  State<BuyAllCloset> createState() => _BuyAllCloset();
}

class _BuyAllCloset extends State<BuyAllCloset> {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClosetModel>(create: (_) =>
        ClosetModel()..fetchClosetList(),
        ),
      ],
      child: Scaffold(
        body: Center(
            child: Consumer<ClosetModel>(builder: (context, model, child) {
              final List<Closet>? closet2 = model.closet2;

              if (closet2 == null) {
                return CircularProgressIndicator();
              }
              final List<Widget> widgets = closet2
                  .map(
                    (clothes) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) => ClothesInfo(
                              clothes,
                              model,
                            ),
                          ),
                        );
                      },

                      child: Stack(
                        children: [
                          Hero(
                            tag: 'hello' + clothes.id,
                            child:  Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black45),
                              ),
                              child: GridTile(

                                footer: GridTileBar(
                                  // backgroundColor: Colors.black54,
                                  // title: Text(
                                  //   clothes.brands,
                                  // ),
                                ),


                                  child: Image.network(clothes.imageURL,fit: BoxFit.cover,),
                                ),
                            ),
                            ),
                        ]
                      ),
                    ),
              )
                  .toList();

              return
                Scaffold(
                  body: Center(
                      child: GridView.count(
                          crossAxisCount: 3,
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

class BuyTopsCloset extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClosetModel>(create: (_) =>
        ClosetModel()..fetchClosetListT(),
        ),
      ],
      child: Scaffold(
        body: Center(
            child: Consumer<ClosetModel>(builder: (context, model, child) {
              final List<Closet>? closet2 = model.closet2;

              if (closet2 == null) {
                return CircularProgressIndicator();
              }
              final List<Widget> widgets = closet2
                  .map(
                    (clothes) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) => ClothesInfo(
                          clothes,
                          model,
                        ),
                      ),
                    );
                  },

                  child: Stack(
                      children: [
                        Hero(
                          tag: 'hello' + clothes.id,
                          child:  Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black45),
                            ),
                            child: GridTile(

                              footer: GridTileBar(
                                // backgroundColor: Colors.black54,
                                // title: Text(
                                //   clothes.brands,
                                // ),
                              ),


                              child: Image.network(clothes.imageURL,fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              )
                  .toList();

              return
                Scaffold(
                  body: Center(
                      child: GridView.count(
                        crossAxisCount: 3,
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



class BuyBottomsCloset extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClosetModel>(create: (_) =>
        ClosetModel()..fetchClosetListB(),
        ),
      ],
      child: Scaffold(
        body: Center(
            child: Consumer<ClosetModel>(builder: (context, model, child) {
              final List<Closet>? closet2 = model.closet2;

              if (closet2 == null) {
                return CircularProgressIndicator();
              }
              final List<Widget> widgets = closet2
                  .map(
                    (clothes) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) => ClothesInfo(
                          clothes,
                          model,
                        ),
                      ),
                    );
                  },

                  child: Stack(
                      children: [
                        Hero(
                          tag: 'hello' + clothes.id,
                          child:  Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black45),
                            ),
                            child: GridTile(

                              footer: GridTileBar(
                                // backgroundColor: Colors.black54,
                                // title: Text(
                                //   clothes.brands,
                                // ),
                              ),


                              child: Image.network(clothes.imageURL,fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              )
                  .toList();

              return
                Scaffold(
                  body: Center(
                      child: GridView.count(
                        crossAxisCount: 3,
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


class BuyOuterCloset extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClosetModel>(create: (_) =>
        ClosetModel()..fetchClosetListO(),
        ),
      ],
      child: Scaffold(
        body: Center(
            child: Consumer<ClosetModel>(builder: (context, model, child) {
              final List<Closet>? closet2 = model.closet2;

              if (closet2 == null) {
                return CircularProgressIndicator();
              }
              final List<Widget> widgets = closet2
                  .map(
                    (clothes) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) => ClothesInfo(
                          clothes,
                          model,
                        ),
                      ),
                    );
                  },

                  child: Stack(
                      children: [
                        Hero(
                          tag: 'hello' + clothes.id,
                          child:  Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black45),
                            ),
                            child: GridTile(

                              footer: GridTileBar(
                                // backgroundColor: Colors.black54,
                                // title: Text(
                                //   clothes.brands,
                                // ),
                              ),


                              child: Image.network(clothes.imageURL,fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              )
                  .toList();

              return
                Scaffold(
                  body: Center(
                      child: GridView.count(
                        crossAxisCount: 3,
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



class BuyFootwearCloset extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClosetModel>(create: (_) =>
        ClosetModel()..fetchClosetListF(),
        ),
      ],
      child: Scaffold(
        body: Center(
            child: Consumer<ClosetModel>(builder: (context, model, child) {
              final List<Closet>? closet2 = model.closet2;

              if (closet2 == null) {
                return CircularProgressIndicator();
              }
              final List<Widget> widgets = closet2
                  .map(
                    (clothes) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) => ClothesInfo(
                          clothes,
                          model,
                        ),
                      ),
                    );
                  },

                  child: Stack(
                      children: [
                        Hero(
                          tag: 'hello' + clothes.id,
                          child:  Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black45),
                            ),
                            child: GridTile(

                              footer: GridTileBar(
                                // backgroundColor: Colors.black54,
                                // title: Text(
                                //   clothes.brands,
                                // ),
                              ),


                              child: Image.network(clothes.imageURL,fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              )
                  .toList();

              return
                Scaffold(
                  body: Center(
                      child: GridView.count(
                        crossAxisCount: 3,
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


class BuyAccessoriesCloset extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClosetModel>(create: (_) =>
        ClosetModel()..fetchClosetListA(),
        ),
      ],
      child: Scaffold(
        body: Center(
            child: Consumer<ClosetModel>(builder: (context, model, child) {
              final List<Closet>? closet2 = model.closet2;

              if (closet2 == null) {
                return CircularProgressIndicator();
              }
              final List<Widget> widgets = closet2
                  .map(
                    (clothes) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) => ClothesInfo(
                          clothes,
                          model,
                        ),
                      ),
                    );
                  },

                  child: Stack(
                      children: [
                        Hero(
                          tag: 'hello' + clothes.id,
                          child:  Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black45),
                            ),
                            child: GridTile(

                              footer: GridTileBar(
                                // backgroundColor: Colors.black54,
                                // title: Text(
                                //   clothes.brands,
                                // ),
                              ),


                              child: Image.network(clothes.imageURL,fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              )
                  .toList();

              return
                Scaffold(
                  body: Center(
                      child: GridView.count(
                        crossAxisCount: 3,
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