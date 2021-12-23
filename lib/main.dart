import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:closet_app_xxx/closet/closet_buy.dart';
import 'package:closet_app_xxx/home_screen.dart';
import 'package:closet_app_xxx/totalPricePage/sellTotal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/login_screen.dart';
import 'closet/closet_sell.dart';
import 'clothes_buy/BuyStep3.dart';
import 'totalPricePage/buyTotal.dart';




void main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());

}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}


class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();

}

// SingleTickerProviderStateMixinを使用。後述
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  late PageController _pageController;

  // ページインデックス保存用
  int _screen = 0;

  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        title: const Text('Home'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.bar_chart),
        title: const Text('total'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.image_outlined),
        title: const Text('closet'),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    // コントローラ作成
    _pageController = PageController(
      initialPage: _screen,
    );
  }

  @override
  void dispose() {
    // コントローラ破棄
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _screen = index;
            });
          },
          children: [
            HomeScreen(),
            SecondPage(),
            ThirdPage(),
          ]),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _screen,
        onTap: (index) {
          setState(() {
            _screen = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeOut);
          });
        },
        items: myBottomNavBarItems(),
      ),
    );
  }
}







class SecondPage extends StatelessWidget {

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





class ThirdPage extends StatelessWidget{
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