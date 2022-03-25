import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class LoginScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(width: size.width * 1/4,
                        child: Image.asset("images/logo.png")),
                  ),
                ],
              ),
              SizedBox(width: size.width*4/5,child: Image.asset('images/logo2.png')),
              Padding(
                padding: const EdgeInsets.only(right: 50, left: 50),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), //角の丸み
                    ),
                    side: const BorderSide(
                        color: Colors.black45
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/google_logo.png', width: 30, height: 30,),
                      Text('Login with Google', style: TextStyle(color: Colors.black),),
                    ],
                  ),
                  onPressed: () async {
                    await ref.read(userProvider.notifier).signInWithGoogle();
                  },
                ),
              )
            ],
          )
      ),
    );
  }
}

