import 'dart:io';
import 'package:closet_app_xxx/model/home/controllers/buy_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'BuyStep5.dart';


class BuyStep4 extends HookConsumerWidget {

  final maxLines = 5;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown.shade100,
          iconTheme: const IconThemeData(
            color: Colors.grey,
          ),
            title: Center(
              child: Column(
                children: [
                  Text('STEP', style: TextStyle(fontSize: 15),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        child: Text('1', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade400,
                        foregroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 15,
                        child: Text('2', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade400,
                        foregroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 15,
                        child: Text('3', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade400,
                        foregroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 18,
                        child: Text('4', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade200,
                        foregroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 15,
                        child: Text('5', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade400,
                        foregroundColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(onPressed: () {
                Navigator.popUntil(context,(route) => route.isFirst );
              }, icon: Icon(Icons.close))
            ]
        ),
        body: Container(
          color: Colors.brown.withOpacity(0.2),
          child: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.all(12),
                    height: maxLines * 24.0,
                    child: TextField(
                      maxLines: maxLines,
                      decoration: InputDecoration(
                          labelText: "詳細",
                          hintText: "Box Logo Hooded Sweatshirt Black",
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          )
                      ),
                      onChanged: (text) {
                        ref.read(BuyItemsProvider.notifier).description(text);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: OutlinedButton(
                      child: const Text('Next'),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: const BorderSide(),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BuyStep5(),
                            )
                        );
                      },
                    ),
                  ),
                ]
            ),
          ),
        )
    );
  }
}