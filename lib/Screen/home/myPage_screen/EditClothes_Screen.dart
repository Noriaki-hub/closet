import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../../models/clothes.dart';


class EditClothesScreen extends HookConsumerWidget{
  EditClothesScreen({required this.clothes, Key? key}) : super(key: key);

  Clothes clothes;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown.shade50,
        onPressed: (){},
        child: Icon(LineIcons.edit),
      ),
      backgroundColor: Colors.brown.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 400,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(clothes.year, style: TextStyle(
                              fontSize: 10,
                            ),),
                            Text(clothes.month + '/' + clothes.day , style: TextStyle(
                              fontSize: 15,
                            ),),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          height: 48,
                          width: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Purchased', style: TextStyle(
                                fontSize: 10,),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(clothes.price)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          height: 48,
                          width: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Sold', style: TextStyle(
                                fontSize: 10,),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(clothes.isSell ? clothes.selling : 'Not Selling')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]
                  )
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          color: Colors.white,
                          child: Image.network(
                            clothes.imageURL,
                            width: 500,
                            height: 500,
                            fit: BoxFit.cover,
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
                        Text('Brand', style: TextStyle(fontSize: 10),),
                      ],
                    ),
                    TextField(
                      cursorHeight: 10,
                      controller: TextEditingController(
                          text: clothes.brands),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          )
                      ),
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
                        Text('Description', style: TextStyle(fontSize: 10),),
                      ],
                    ),
                    TextField(
                      cursorHeight: 10,
                      controller: TextEditingController(
                          text: clothes.description),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),

    );
  }

}