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
        backgroundColor: Colors.grey[300],
        title: Text("BUY"),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                highlightColor: Colors.grey,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tops(),
                      )
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: SingleChildScrollView(
                            child: Image(
                              image: AssetImage(
                                  'images/Tops.png'),
                            )
                        ),
                      ),

                      Expanded(
                          child: Container(
                            width: 100,
                            child: Center(
                              child: Text(
                                  'Tops',
                                  style: TextStyle(
                                    fontSize: 20,
                                  )
                              ),
                            )
                          )

                      )
                    ],

                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
              height: 0,
              indent: 0,
              endIndent: 0,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                highlightColor: Colors.grey,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Bottoms(),
                      )
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: SingleChildScrollView(
                            child: Image(
                              image: AssetImage(
                                  'images/Bottoms.png'),
                            )
                        ),
                      ),

                      Expanded(
                          child: Container(
                              width: 100,
                              child: Center(
                                child: Text(
                                    'Bottoms',
                                    style: TextStyle(
                                      fontSize: 20,
                                    )
                                ),
                              )
                          )
                      )
                    ],

                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
              height: 0,
              indent: 0,
              endIndent: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                highlightColor: Colors.grey,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Outer(),
                      )
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: SingleChildScrollView(
                            child: Image(
                              image: AssetImage(
                                  'images/Outer.png'),
                            )
                        ),
                      ),


                      Expanded(
                          child: Container(
                              width: 100,
                              child: Center(
                                child: Text(
                                    'Outer',
                                    style: TextStyle(
                                      fontSize: 20,
                                    )
                                ),
                              )
                          )
                      )
                    ],

                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
              height: 0,
              indent: 0,
              endIndent: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                highlightColor: Colors.grey,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Footwear(),
                      )
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: SingleChildScrollView(
                            child: Image(
                              image: AssetImage(
                                  'images/Footwear.png'),
                            )
                        ),
                      ),

                      Expanded(
                          child: Container(
                              width: 100,
                              child: Center(
                                child: Text(
                                    'Footwear',
                                    style: TextStyle(
                                      fontSize: 20,
                                    )
                                ),
                              )
                          )
                      )
                    ],

                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
              height: 0,
              indent: 0,
              endIndent: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                highlightColor: Colors.grey,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Accessories(),
                      )
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: SingleChildScrollView(
                            child: Image(
                              image: AssetImage(
                                  'images/Accessories.png'),
                            )
                        ),
                      ),

                      Expanded(
                          child: Container(
                              width: 100,
                              child: Center(
                                child: Text(
                                    'Accessories',
                                    style: TextStyle(
                                      fontSize: 20,
                                    )
                                ),
                              )
                          )
                      )
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
              height: 0,
              indent: 0,
              endIndent: 0,
            ),

          ],
        ),
      ),
    );
  }
}