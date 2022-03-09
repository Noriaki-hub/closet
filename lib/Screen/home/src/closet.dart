import 'package:closet_app_xxx/Screen/home/clothes_view_screen.dart';
import 'package:closet_app_xxx/controllers/pages/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class Closet extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final closet = ref.watch(HomePageProvider.select((value) => value.closet));
    return  Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              childAspectRatio: (5 / 4),
            ),
            itemCount: closet.length,
            itemBuilder: (BuildContext context, int index) {
              final item = closet[index];
              return InkWell(
                  onTap: () async{
                    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ClothesViewScreen(itemId: item.itemId);}));
                    if(result){
                      ref.read(HomePageProvider.notifier).fetchHomePageData();

                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child:
                    Image.network(
                      item.imageURL,
                      fit: BoxFit.cover,
                    ),
                  )
              );
            }
      ),
    );
  }

}