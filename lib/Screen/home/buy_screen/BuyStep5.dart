
import 'package:closet_app_xxx/model/home/controllers/buy_controller.dart';
import 'package:closet_app_xxx/model/home/controllers/calender_controller.dart';
import 'package:closet_app_xxx/model/home/controllers/clothes_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';




class BuyStep5 extends HookConsumerWidget {

  User? user = FirebaseAuth.instance.currentUser;

  final maxLines = 3;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(BuyItemsProvider);


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
                        radius: 15,
                        child: Text('4', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade400,
                        foregroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 18,
                        child: Text('5', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade200,
                        foregroundColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              }, icon: Icon(Icons.close))
            ]
        ),
        body: Container(
          color: Colors.brown.withOpacity(0.2),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.all(12),
                      child: GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                                color: Colors.white,
                                child: Image.file(
                                  items.imageFile!,
                                  width: 300,
                                  height: 300,
                                  fit: BoxFit.fitHeight,
                                )
                            ),
                          )
                      ),
                    ),
                    Container(
                      width: 250,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('ブランド', style: TextStyle(fontSize: 10),),
                            ],
                          ),
                          TextField(
                            cursorHeight: 10,
                            controller: TextEditingController(
                                text: items.brands),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                )
                            ),
                            onChanged: (text) {
                              ref.read(BuyItemsProvider.notifier).brands(text);
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(12),
                      width: 250,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('詳細', style: TextStyle(fontSize: 10),),
                            ],
                          ),
                          TextField(
                            cursorHeight: 10,
                            controller: TextEditingController(
                                text: items.description),
                            maxLines: maxLines,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                )
                            ),
                            onChanged: (text) {
                              ref.read(BuyItemsProvider.notifier).description(
                                  text);
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(12),
                      width: 250,
                      child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '¥',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: items.price != '' ? Colors.black45
                                        : Colors.orange
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.black
                                )
                            ),
                          ),
                          onChanged: (text) {
                            ref.read(BuyItemsProvider.notifier).price(text);
                          }
                      ),
                    ),
                    OutlinedButton(
                      child: const Text('完了'),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: const BorderSide(),
                      ),
                      onPressed: () async {
                        if(items.price != ''){
                          await ref.read(clothesListProvider.notifier).addClothes();
                          await ref.read(calenderProvider.notifier).add();
                          Navigator.popUntil(context, (route) => route.isFirst);
                        }else{
                        _showDialog(context);
                        }
                      },
                    ),
                  ]
              ),
            ),
          ),
        )
    );
  }



  Future _showDialog(context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("エラー"),
          content: Text("金額を入力してください"), actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        );
      },
    );
  }
}


