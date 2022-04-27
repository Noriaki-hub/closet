
import 'package:closet_app_xxx/controllers/pages/global/clothes_edit_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryController extends HookConsumerWidget {

  final List<MapEntry<String, String>> categories = [
    MapEntry("Tops", 'トップス'),
    MapEntry("Bottoms", 'ボトムス'),
    MapEntry("Outer", 'アウター'),
    MapEntry("Footwear", 'シューズ'),
    MapEntry("Accessories", 'アクセサリー'),
    MapEntry("Other", 'その他'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final categoryState = ref.watch(clothesEditPageProvider.select((value) => value.category));
    final firstCategory = ref.watch(clothesEditPageProvider.select((value) => value.clothes?.category));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('カテゴリ', style: TextStyle(fontWeight: FontWeight.bold),),
        Container(
          height: 300,
          width: 250,
          child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                final category = categories[index];
                return OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),//角の丸み
                    ),
                    side: BorderSide(
                        color:
                            categoryState == '' ? firstCategory != category.key ? Colors.black45: Colors.blue:
                        categoryState!= category.key ? Colors.black45: Colors.blue
                    ),
                  ),
                  child: Text(
                    category.value, style: TextStyle(color: Colors.black),),
                  onPressed: () async{
                    await ref.read(clothesEditPageProvider.notifier).category(category: category.key);
                  },
                );
              }
          ),
        ),
      ],
    );
  }
}
