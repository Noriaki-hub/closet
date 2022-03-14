import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200, width: 200,child: Image.asset('images/logo.png')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('images/google_logo.png', width: 30, height: 30,),
                        Text('Login with Google', style: TextStyle(color: Colors.black),),
                      ],
                    ),
                    onPressed: () async {
                      await ref.read(userProvider.notifier).signInWithGoogle();
                      await ref.read(userProvider.notifier).fetchCurrentUser();
                      final user = await ref.watch(
                          userProvider.select((value) => value.user));
                      if (user.uid == '') {
                        ref.read(userProvider.notifier).register();
                      }
                    },
                  ),
                ),
              )

            ],
          )
      ),
    );
  }
}

