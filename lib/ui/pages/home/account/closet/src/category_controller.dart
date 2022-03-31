import 'package:closet_app_xxx/controllers/pages/closet_page_controller.dart';
import 'package:closet_app_xxx/controllers/pages/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ClosetController extends HookConsumerWidget {

  Map movies = {
    0: {'category': 'ALL', 'カテゴリー': 'すべて'},
    1: {'category': 'Tops', 'カテゴリー': 'トップス'},
    2: {'category': 'Bottoms', 'カテゴリー': 'ボトムス'},
    3: {'category': 'Outer', 'カテゴリー': 'アウター'},
    4: {'category': 'Footwear', 'カテゴリー': 'シューズ'},
    5: {'category': 'Accessories', 'カテゴリー': 'アクセサリー'},
    6: {'category': 'Other', 'カテゴリー': 'その他'},
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSell = ref.watch(ClosetPageProvider.select((value) => value.isSell));
    final categoryState = ref.watch(ClosetPageProvider.select((value) => value.category));
    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSell ?
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), //角の丸み
                ),
                side: const BorderSide(
                    color: Colors.indigo
                ),
              ),
              child: Text('売却したもの', style: TextStyle(color: Colors.black),), onPressed: () async{
              await ref.read(ClosetPageProvider.notifier).isSellFalse();
            },
            ),
          ):
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), //角の丸み
          ),
          side: const BorderSide(
              color: Colors.black45
          ),
        ),
        child: Text('クローゼット', style: TextStyle(color: Colors.black),), onPressed: () async{
          await ref.read(ClosetPageProvider.notifier).isSellTrue();
        },
      ),
    ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                final text = movies[index]['カテゴリー'];
                final category = movies[index]['category'];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), //角の丸み
                      ),
                      side: BorderSide(
                          color: categoryState != category? Colors.black45: Colors.black
                      ),
                    ),
                    child: Text(text, style: TextStyle(color: Colors.black),),
                    onPressed: () async{
                      await ref.read(ClosetPageProvider.notifier).changeCategory(category: category);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      )
      ,
    );
  }

}