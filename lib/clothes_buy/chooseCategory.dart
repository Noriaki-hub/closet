import 'package:flutter/material.dart';
import 'Bottoms.dart';
import 'Footwear.dart';
import 'Outer.dart';
import 'Tops.dart';
import 'accessories.dart';




class BuyPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _BuyPage();
  }
}

class _BuyPage extends State<BuyPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("BUY"),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute<Null>(
                                settings: const RouteSettings(name: "/my-page-2"),
                                builder: (BuildContext context) => Tops(),
                                fullscreenDialog: true, // ダイアログで表示するかどうか
                              ),
                            );
                          },
                          // 対象の画像を記述
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: SingleChildScrollView(
                              child: Image(
                                image: AssetImage(
                                    'images/Tops.png'),
                            )
                            ),
                          ),
                        ),

                        Text('Tops')
                      ],

                    ),
                  ),

                  Container(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute<Null>(
                                settings: const RouteSettings(name: "/my-page-2"),
                                builder: (BuildContext context) => Bottoms(),
                                fullscreenDialog: true, // ダイアログで表示するかどうか
                              ),
                            );
                          },
                          // 対象の画像を記述
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: SingleChildScrollView(
                              child: Image(
                                image: AssetImage(
                                    'images/Bottoms.png'),
                              )
                             ),
                          ),
                        ),

                        Text('Bottom')
                      ],

                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute<Null>(
                                settings: const RouteSettings(name: "/my-page-2"),
                                builder: (BuildContext context) => Outer(),
                                fullscreenDialog: true, // ダイアログで表示するかどうか
                              ),
                            );
                          },
                          // 対象の画像を記述
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: SingleChildScrollView(
                              child: Image(
                                image: AssetImage(
                                    'images/Outer.png'),
                              )
                            ),
                          ),
                        ),

                        Text('Outer')
                      ],

                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute<Null>(
                                settings: const RouteSettings(name: "/my-page-2"),
                                builder: (BuildContext context) => Footwear(),
                                fullscreenDialog: true, // ダイアログで表示するかどうか
                              ),
                            );
                          },
                          // 対象の画像を記述
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: SingleChildScrollView(
                              child: Image(
                                image: AssetImage(
                                    'images/Footwear.png'),
                              )
                            ),
                          ),
                        ),

                        Text('Footwear')
                      ],

                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute<Null>(
                                settings: const RouteSettings(name: "/my-page-2"),
                                builder: (BuildContext context) => Accessories(),
                                fullscreenDialog: true, // ダイアログで表示するかどうか
                              ),
                            );
                          },
                          // 対象の画像を記述
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: SingleChildScrollView(
                              child: Image(
                                image: AssetImage(
                                    'images/Accessories.png'),
                              )
                            ),
                          ),
                        ),

                        Text('accessories')
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}