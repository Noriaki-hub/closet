
import 'package:closet_app_xxx/Screen/shop/shopAdd/shop_add_screen.dart';
import 'package:closet_app_xxx/Screen/shop/shop_view_screen/shop_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../controllers/pages/shop_page_controller.dart';


class ShopScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Consumer(

          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return FloatingActionButton(
              onPressed: () async {
                final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => ShopAddScreen()));
                if(result){
                  ref.read(ShopPageProvider.notifier).fetchShops();
                }
              },
              backgroundColor: Colors.brown.shade50,
              child: Icon(LineIcons.plus),
            );
          },
        ),
        backgroundColor: Colors.brown.shade50,
        body: ShopList()
    );
  }
}

class ShopList extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final shops = ref.watch(ShopPageProvider.select((value) => value.shops));
   return GridView.builder(
         itemCount: shops.length,

           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             mainAxisSpacing: 5,
             crossAxisSpacing: 5, 
               childAspectRatio: 0.9
       ),
           itemBuilder: (BuildContext context, int index) {
            final shop = shops[index];
             return Padding(
               padding: const EdgeInsets.all(20),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => ShopWebViewScreen(shop.url)));
                     },
                     child:  ClipRRect( borderRadius: BorderRadius.circular(80),child: Container(width:150, height: 150, child: Image.network(shop.image, fit: BoxFit.cover,))),
                   ),

                   Text(shop.name)
                 ],
               ),
             );
           }
       );
  }
}

