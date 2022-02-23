import 'package:closet_app_xxx/Screen/Tab.dart';
import 'package:closet_app_xxx/Screen/home/home_screen.dart';
import 'package:closet_app_xxx/model/auth/current/current_controller.dart';
import 'package:closet_app_xxx/model/auth/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerから値を受け取る
    final infoText = ref.watch(infoTextProvider);
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final current = ref.watch(currentUserControllerProvider);

    return Scaffold(

      body: Container(

        child: Center(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(
                  height: 80,
                  width: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/logo.png'),
                        fit: BoxFit.cover,
                )
        )
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "メールアドレス",
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        )
                    ),
                    onChanged: (String value) {
                      // Providerから値を更新
                      ref.read(emailProvider.notifier).state = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "パスワード",
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        )
                    ),
                    onChanged: (String value) {
                      // Providerから値を更新
                      ref.read(passwordProvider.notifier).state = value;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(infoText),
                ),

                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.grey.shade100; //タップ中の色
                          }
                          return Colors.transparent; //通常時の色
                        },
                      ),
                    ),
                    child: Text('ログイン', style: TextStyle(color: Colors.blueGrey),),
                    onPressed: () async {
                      try {
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        await auth.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        await ref.watch(currentUserControllerProvider.notifier).getSearchUser();
                        await Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                            return BottomTabPage();
                          }),
                        );
                      } catch (e) {
                        // Providerから値を更新
                        ref.read(infoTextProvider.notifier).state =
                        "ログインに失敗しました：${e.toString()}";
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}