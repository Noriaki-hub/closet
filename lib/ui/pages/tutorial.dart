import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TutorialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return OverBoard(
            buttonColor: Colors.black45,
            pages: pages,
            showBullets: true,
            skipCallback: () async {
              await ref.read(userProvider.notifier).changeIsFirstLogin();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
            finishCallback: () async {
              await ref.read(userProvider.notifier).changeIsFirstLogin();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          );
        },
      ),
    );
  }

  final pages = [
    PageModel(
        titleColor: Colors.black45,
        bodyColor: Colors.black45,
        color: Colors.white,
        imageAssetPath: 'images/closet.png',
        title: 'Closetへようこそ',
        body: 'チュートリアルです。左下のSKIPで飛ばすこともできます。',
        doAnimateImage: true),
    PageModel(
        titleColor: Colors.black45,
        bodyColor: Colors.black45,
        color: Colors.white,
        imageAssetPath: 'images/home.png',
        title: 'クローゼットを管理',
        body: '自分のクローゼットが管理できます。友達のクローゼットを覗くこともできます。',
        doAnimateImage: true),
    PageModel(
        titleColor: Colors.black45,
        bodyColor: Colors.black45,
        color: Colors.white,
        imageAssetPath: 'images/calendar.png',
        title: '収支を管理',
        body: '今までの購入額と売却額、また具体的な詳細リストが閲覧できます',
        doAnimateImage: true),
    PageModel.withChild(
        child: Padding(
            padding: EdgeInsets.only(bottom: 25.0),
            child: Text(
              "さあ、始めましょう",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 32,
              ),
            )),
        color: Colors.white,
        doAnimateChild: true)
  ];
}
