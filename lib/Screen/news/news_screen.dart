import 'package:closet_app_xxx/Screen/news/newAdd/newsAdd_screen.dart';
import 'package:closet_app_xxx/Screen/shop/shop_view_screen/shop_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../controllers/pages/media_page_controller.dart';


class NewsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NewsAddScreen()));
          },
          backgroundColor: Colors.brown.shade50,
          child: Icon(LineIcons.plus),
        ),
        backgroundColor: Colors.brown.shade50,
        body: ShopList()
    );
  }
}

class ShopList extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final medias = ref.watch(MediaPageProvider.select((value) => value.medias));
   return GridView.builder(
         itemCount: medias.length,

           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             mainAxisSpacing: 5,
             crossAxisSpacing: 5, 
               childAspectRatio: 0.9
       ),
           itemBuilder: (BuildContext context, int index) {
            final media = medias[index];
             return Padding(
               padding: const EdgeInsets.all(20),
               child: Column(
                 children: [
                   InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => ShopWebViewScreen(media.url)));
                     },
                     child:  Image.network(media.image, fit: BoxFit.contain,),
                   ),

                   Text(media.name)
                 ],
               ),
             );
           }
       );
  }
}

