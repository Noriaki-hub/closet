
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../controllers/pages/clothes_edit_page_controller.dart';

class CategoryController extends HookConsumerWidget {
  CategoryController(this.category);
  String category;

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
    final categoryState = ref.watch(ClothesEditPageProvider.select((value) => value.category));
    ref.read(ClothesEditPageProvider.notifier).category(category: category);
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
                        color: categoryState != category.key ? Colors.black45: Colors.blue
                    ),
                  ),
                  child: Text(
                    category.value, style: TextStyle(color: Colors.black),),
                  onPressed: () async{
                    await ref.read(ClothesEditPageProvider.notifier).category(category: category.key);
                  },
                );
              }
          ),
        ),
      ],
    );
  }
}
