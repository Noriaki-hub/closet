import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Clothes_Info.dart';
import 'closet_model.dart';



class SellCloset extends StatelessWidget {

  final _tab = <Tab> [
    Tab( text:'All'),
    Tab(  icon:
    ImageIcon(AssetImage('images/Tops.png'),),
    ),
    Tab(  icon:
    ImageIcon(AssetImage('images/Bottoms.png'),),
    ),
    Tab(  icon:
    ImageIcon(AssetImage('images/Outer.png'),),
    ),
    Tab(  icon:
    ImageIcon(AssetImage('images/Footwear.png'),),
    ),
    Tab(  icon:
    ImageIcon(AssetImage('images/Accessories.png'),),
    ),
  ];




  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title:  TabBar(
            tabs: _tab,
            labelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BubbleTabIndicator(
              indicatorHeight: 25.0,
              indicatorColor: Colors.grey,
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SellAllCloset(),
            SellTopsCloset(),
            SellBottomsCloset(),
            SellOuterCloset(),
            SellFootwearCloset(),
            SellAccessoriesCloset(),
          ],
        ),
      ),
    );
  }
}

class SellAllCloset extends StatefulWidget {
  @override
  State<SellAllCloset> createState() => _SellAllCloset();
}

class _SellAllCloset extends State<SellAllCloset> {





  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClosetModel>(create: (_) =>
        ClosetModel()..fetchClosetListSell(),
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
                  onTap: () async{
                    var result =
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) => ClothesInfo(
                            clothes,model
                        ),
                      ),
                    );
                    if (result){
                      model.fetchClosetListSell();
                    }
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


                                child: clothes.assetURL != '' ?
                                Image.asset(clothes.assetURL)
                                    : Image.network(clothes.imageURL,fit: BoxFit.cover,)

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

class SellTopsCloset extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClosetModel>(create: (_) =>
        ClosetModel()..fetchClosetListSellT(),
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
                      onTap: () async{
                        var result =
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) => ClothesInfo(
                                clothes,model
                            ),
                          ),
                        );
                        if (result){
                          model.fetchClosetListSellT();
                        }
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


                                child: clothes.assetURL != '' ?
                                Image.asset(clothes.assetURL)
                                    : Image.network(clothes.imageURL,fit: BoxFit.cover,)
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



class SellBottomsCloset extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClosetModel>(create: (_) =>
        ClosetModel()..fetchClosetListSellB(),
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
                      onTap: () async{
                        var result =
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) => ClothesInfo(
                                clothes,model
                            ),
                          ),
                        );
                        if (result){
                          model.fetchClosetListSellB();
                        }
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


                                child: clothes.assetURL != '' ?
                                Image.asset(clothes.assetURL)
                                    : Image.network(clothes.imageURL,fit: BoxFit.cover,)
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


class SellOuterCloset extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClosetModel>(create: (_) =>
        ClosetModel()..fetchClosetListSellO(),
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
                      onTap: () async{
                        var result =
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) => ClothesInfo(
                                clothes,model
                            ),
                          ),
                        );
                        if (result){
                          model.fetchClosetListSellO();
                        }
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


                                child: clothes.assetURL != '' ?
                                Image.asset(clothes.assetURL)
                                    : Image.network(clothes.imageURL,fit: BoxFit.cover,)
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



class SellFootwearCloset extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClosetModel>(create: (_) =>
        ClosetModel()..fetchClosetListSellF(),
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
                      onTap: () async{
                        var result =
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) => ClothesInfo(
                                clothes,model
                            ),
                          ),
                        );
                        if (result){
                          model.fetchClosetListSellF();
                        }
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


                                child: clothes.assetURL != '' ?
                                Image.asset(clothes.assetURL)
                                    : Image.network(clothes.imageURL,fit: BoxFit.cover,)
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


class SellAccessoriesCloset extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClosetModel>(create: (_) =>
        ClosetModel()..fetchClosetListSellA(),
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
                      onTap: () async{
                        var result =
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) => ClothesInfo(
                                clothes,model
                            ),
                          ),
                        );
                        if (result){
                          model.fetchClosetListSellA();
                        }
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


                                child: clothes.assetURL != '' ?
                                Image.asset(clothes.assetURL)
                                    : Image.network(clothes.imageURL,fit: BoxFit.cover,)
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