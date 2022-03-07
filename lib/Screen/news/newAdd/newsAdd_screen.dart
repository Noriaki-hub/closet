
import 'package:closet_app_xxx/controllers/pages/media_add_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import 'newsAddStep2.dart';




class NewsAddScreen extends HookConsumerWidget {



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor:Colors.brown.shade50,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewsAddStep2()));
        },
        backgroundColor: Colors.brown.shade50,
        child: Icon(LineIcons.angleRight),
      ),
        appBar: AppBar(
            backgroundColor: Colors.brown.shade50,
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
                        radius: 18,
                        child: Text('1', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade400,
                        foregroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 15,
                        child: Text('2', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade300,
                        foregroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 15,
                        child: Text('3', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade300,
                        foregroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 15,
                        child: Text('4', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade300,
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
        body: Center(
          child: Container(
            margin: EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "Shop",
                  hintText: "Supreme",
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  )
              ),
              onChanged: (text) {
                ref.read(MediaAddPageProvider.notifier).name(name: text);
              },
            ),
          ),
        )
    );
  }
}
