import 'package:flutter/material.dart';
import 'BuyStep2.dart';


class BuyPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _BuyPage();
  }
}

class _BuyPage extends State<BuyPage> {

 String? category;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        title: Text("Categories",
            style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              color: Colors.grey,
              thickness: 1,
              height: 0,
              indent: 0,
              endIndent: 0,
            ),

            InkWell(
              highlightColor: Colors.grey,
              onTap: () {
                category = 'Tops';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BuyStep2(category),
                    )
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
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

            InkWell(
              highlightColor: Colors.grey,
              onTap: () {
                category = 'Bottoms';
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BuyStep2(category),
                    )
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
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
            InkWell(
              highlightColor: Colors.grey,
              onTap: () {
                category = 'Outer';
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BuyStep2(category),
                    )
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
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
            InkWell(
              highlightColor: Colors.grey,
              onTap: () {
                category = 'Footwear';
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BuyStep2(category),
                    )
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
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
            InkWell(
              highlightColor: Colors.grey,
              onTap: () {
                category = 'Accessories';
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BuyStep2(category),
                    )
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
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