import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/ui/pages/login/developer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:line_icons/line_icons.dart';

class LoginScreen extends StatefulWidget {
  @override
  createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    // Can't show a dialog in initState, delaying initialization
    WidgetsBinding.instance?.addPostFrameCallback((_) => initPlugin());
  }

  Future<void> initPlugin() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      await Future.delayed(const Duration(milliseconds: 200));
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                        width: size.width * 1 / 4,
                        child: Image.asset("images/logo.png")),
                  ),
                  IconButton(
                      onPressed: () {
                        _showDialog();
                      },
                      icon: Icon(LineIcons.cog))
                ],
              ),
              SizedBox(
                  width: size.width * 4 / 5,
                  child: Image.asset('images/logo2.png')),
              Column(
                children: [
                  SignInButton(
                    Buttons.Google,
                    onPressed: () async {
                      await ref.read(userProvider.notifier).signInWithGoogle();
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Platform.isAndroid
                      ? Container()
                      : SignInButton(
                          Buttons.Apple,
                          onPressed: () async {
                            await ref
                                .read(userProvider.notifier)
                                .signInWithApple();
                          },
                        )
                ],
              ),
            ],
          )),
        );
      },
    );
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return DeveloperLogin();
      },
    );
  }
}
