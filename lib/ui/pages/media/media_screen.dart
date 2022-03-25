
import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import '../../../controllers/pages/media_page_controller.dart';
import '../../libs/floating_action_button_animation.dart';
import '../../libs/web_view.dart';
import 'add/media_add_screen.dart';
import 'edit/media_select_page.dart';



class MediaPage extends HookConsumerWidget {


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('メディア', style: TextStyle(color: Colors.black45),),
        backgroundColor: Colors.brown.shade50,
      ),
        floatingActionButton: ExpandableFab(
          distance: 112.0,
          children: [
            ActionButton(
              onPressed: () async {
                final result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MediaAddPage()));
                if (result) {
                  ref.read(MediaPageProvider.notifier).fetchMedias();
                }
              }, icon: Icon(LineIcons.plus, color: Colors.black45,),
            ),
            ActionButton(

              onPressed: () async {
                final result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MediaSelectPage()));
                if (result) {
                  ref.read(MediaPageProvider.notifier).fetchMedias();
                }
              },

              icon: const Icon(LineIcons.list, color: Colors.black45,),
            ),
          ],
        ),
        backgroundColor: Colors.brown.shade50,
        body: RefreshIndicator(
            onRefresh: () async{
              await ref.read(MediaPageProvider.notifier).fetchMedias();
            },child: MediaList())
    );
  }
}

class MediaList extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final medias = ref.watch(MediaPageProvider.select((value) => value.medias));
   return medias.isEmpty? Center(child: Text('お気に入りのメディアを追加しよう', style: TextStyle(color: Colors.black45),)):GridView.builder(
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
                       Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(media.url)));
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

