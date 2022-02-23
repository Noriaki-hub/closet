
import 'package:closet_app_xxx/model/home/controllers/buy_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'BuyStep2.dart';



class BuyPage extends HookConsumerWidget {

 String? category;



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(BuyItemsProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(),
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
                  CircleAvatar(
                    radius: 15,
                    child: Text('5', style: TextStyle(
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
            Navigator.popUntil(context,(route) => route.isFirst );
          }, icon: Icon(Icons.close))
        ],
        backgroundColor: Colors.brown.shade50,
        
      ),
      body: Container(
        color:Colors.brown.shade50,
        child: Center(
          child: _ItemList()
      ),
    )
    );
  }
 }


 class _ItemList extends HookConsumerWidget {

   Map categories = {
     0: {'title': 'Tops', 'png': 'images/Tops.png'},
     1: {'title': 'Bottoms', 'png': 'images/Bottoms.png'},
     2: {'title': 'Outer', 'png': 'images/Outer.png'},
     3: {'title': 'Footwear', 'png': 'images/Footwear.png'},
     4: {'title': 'Accessories', 'png': 'images/Accessories.png'},
   };

   @override
   Widget build(BuildContext context, WidgetRef ref) {
     ref.watch(BuyItemsProvider);
     return ListView.builder(
       itemCount: categories.length,
       itemBuilder: (BuildContext context, int index) {
         final category = categories[index]['title'];
         return InkWell(
           highlightColor: Colors.grey,
           onTap: () {
             ref.read(BuyItemsProvider.notifier).category(category);
             Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => BuyStep2(),
                 )
             );
           },
           child: Padding(
             padding: const EdgeInsets.all(30),
             child: Container(
               child: Row(
                 children: [
                   SizedBox(
                     height: 100, width: 100, child: SingleChildScrollView(child: Image(image: AssetImage('${categories[index]['png']}'),)),),
                   Container(
                       width: 100,
                       child: Center(
                         child: Text(
                           categories[index]['title'],
                             style: TextStyle(
                               fontSize: 20,
                             )
                         ),
                       )
                   )
                 ],
               ),
             ),
           ),
         );
       },
     );
   }
 }

