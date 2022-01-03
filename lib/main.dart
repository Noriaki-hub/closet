import 'package:closet_app_xxx/Screen/home_screen/home_screen.dart';
import 'package:closet_app_xxx/clothes_buy/BuyStep1.dart';
import 'package:closet_app_xxx/clothes_buy/BuyStep2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/login_screen.dart';





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


      // darkTheme: ThemeData.dark(),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {

            return const SizedBox();
          }
          if (snapshot.hasData) {

            return HomeScreen();
          }

          return LoginScreen();
        },
      ),

    routes: <String, WidgetBuilder> {
    "/BuyPage": (BuildContext context) => BuyPage(),
    "/buypage2": (BuildContext context) =>  HomeScreen()
    }
    );
  }
}












