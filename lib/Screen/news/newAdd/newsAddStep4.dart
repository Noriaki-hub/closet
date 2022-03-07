
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controllers/pages/media_add_page_controller.dart';
import '../../../controllers/pages/media_page_controller.dart';





class NewsAddStep4 extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(MediaAddPageProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown.shade50,
        child: Text('Go'),
        onPressed: () async{
          await ref.read(MediaAddPageProvider.notifier).addMedia();
          Navigator.popUntil(context, (route) => route.isFirst);
        },
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
                      radius: 15,
                      child: Text('1', style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),),
                      backgroundColor: Colors.grey.shade300,
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
                      radius: 18,
                      child: Text('4', style: TextStyle(
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.all(12),
                  child: GestureDetector(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            color: Colors.white,
                            child: Image.network(
                              item.image,
                              width: 300,
                              height: 300,
                              fit: BoxFit.fitHeight,
                            )
                        ),
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  width: 250,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Shop', style: TextStyle(fontSize: 10),),
                        ],
                      ),
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text(item.name),
                        ),
                      )
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
                          Text('URL', style: TextStyle(fontSize: 10),),
                        ],
                      ),
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text(item.url),
                        ),
                      )
                    ],
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}