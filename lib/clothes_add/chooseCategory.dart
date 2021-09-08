import 'package:flutter/material.dart';

import 'package:closet_app_xxx/clothes_add/Bottoms.dart';
import 'package:closet_app_xxx/clothes_add/Outer.dart';
import 'package:closet_app_xxx/clothes_add/Tops.dart';
import 'Footwear.dart';
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
                              child: Image.network(
                                  'https://cdn.pixabay.com/photo/2016/12/06/09/30/blank-1886001__340.png'),
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
                              child: Image.network(
                                  'https://cdn.pixabay.com/photo/2016/12/06/09/30/blank-1886001__340.png'),
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
                              child: Image.network(
                                  'https://cdn.pixabay.com/photo/2016/12/06/09/30/blank-1886001__340.png'),
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
                              child: Image.network(
                                  'https://cdn.pixabay.com/photo/2016/12/06/09/30/blank-1886001__340.png'),
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
                              child: Image.network(
                                  'https://cdn.pixabay.com/photo/2016/12/06/09/30/blank-1886001__340.png'),
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