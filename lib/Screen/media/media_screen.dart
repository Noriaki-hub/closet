
import 'package:closet_app_xxx/Screen/shop/shopAdd/shop_add_screen.dart';
import 'package:closet_app_xxx/Screen/shop/shop_view_screen/shop_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../controllers/pages/media_page_controller.dart';
import '../../controllers/pages/shop_page_controller.dart';
import 'mediaAdd/media_add_screen.dart';


class MediaScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Consumer(

          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return FloatingActionButton(
              onPressed: () async {
                final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => MediaAddScreen()));
                if(result){
                  ref.read(MediaPageProvider.notifier).fetchMedias();
                }
              },

              backgroundColor: Colors.brown.shade50,
              child: Icon(LineIcons.plus),
            );
          },
        ),
        backgroundColor: Colors.brown.shade50,
        body: MediaList()
    );
  }
}

class MediaList extends HookConsumerWidget{
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
                     child:  ClipRRect(borderRadius: BorderRadius.circular(10),child: Container(width:150, height: 150,child: Image.network(media.image, fit: BoxFit.cover,))),
                   ),

                   Text(media.name)
                 ],
               ),
             );
           }
       );
  }
}

