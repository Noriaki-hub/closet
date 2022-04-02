import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/pages/tab/tab.dart';
import 'package:closet_app_xxx/ui/pages/tutorial.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'ui/pages/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale("en"),
            const Locale("ja"),
          ],
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.grey,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          // darkTheme: ThemeData.dark(),
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Loading();
              }
              if (snapshot.hasData) {
                return Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    final isFirstLogin = ref.watch(
                        userProvider.select((value) => value.isFirstLogin));
                    final user =
                        ref.watch(userProvider.select((value) => value.user));
                    return user.uid == ''
                        ? Loading()
                        : isFirstLogin
                            ? TutorialPage()
                            : BottomTabPage();
                  },
                );
              }
              return LoginScreen();
            },
          )),
    );
  }
}
