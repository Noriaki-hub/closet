import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdatePage extends StatelessWidget {
   final String _url = 'https://apps.apple.com/jp/app/closet-%E3%81%BF%E3%82%93%E3%81%AA%E3%81%AE%E3%82%AF%E3%83%AD%E3%83%BC%E3%82%BC%E3%83%83%E3%83%88%E3%82%92%E8%A6%8B%E3%81%AB%E8%A1%8C%E3%81%93%E3%81%86/id1615574653';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '最新バージョンにアップデートをお願いします'
          ),
          OutlinedButton(onPressed: ()async{
            if (!await launch(_url)) throw 'Could not launch $_url';
          }, child: Text('App Store'))
        ],
      )),
    );
  }
}
