import 'package:closet_app_xxx/models/clothes_for_public.dart';
import 'package:closet_app_xxx/ui/pages/home/clothes/src/brands_text_field.dart';
import 'package:closet_app_xxx/ui/pages/home/clothes/src/category_controller.dart';
import 'package:closet_app_xxx/ui/pages/home/clothes/src/date_pick_field.dart';
import 'package:closet_app_xxx/ui/pages/home/clothes/src/description_text_field.dart';
import 'package:closet_app_xxx/ui/pages/home/clothes/src/image_change_field.dart';
import 'package:closet_app_xxx/ui/pages/home/clothes/src/price_text_field.dart';
import 'package:closet_app_xxx/ui/pages/home/clothes/src/sellDatePickField.dart';
import 'package:closet_app_xxx/ui/pages/home/clothes/src/selling_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../controllers/pages/clothes_edit_page_controller.dart';




class ClothesEditPage extends HookConsumerWidget {
  ClothesEditPage({
    Key? key,
    required this.clothes,
  }) : super(key: key);

  final ClothesForPublic clothes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade50,
        leading: IconButton(onPressed: () {
          Navigator.pop(context, false);
        }, icon: Icon(LineIcons.angleLeft),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('変更'),
        backgroundColor: Colors.brown.shade50,
        onPressed: () async {
          await ref.read(ClothesEditPageProvider.notifier).updateClothes(clothes: clothes);
          Navigator.pop(context, true);
        },

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 1400,
            child: Padding(
              padding: const EdgeInsets.only(right: 40, left: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ImageChangeField(clothes.imageURL),
                  BrandsTextField(clothes.brands),
                  DescriptionTextField(clothes.description),
                  CategoryController(clothes.category),
                  PriceTextField(clothes.price),
                  DatePickField(clothes.year, clothes.month, clothes.day),
                  clothes.isSell?
                  SellingTextField(clothes.selling):Container(),
                  clothes.isSell?
                  SellDatePickField(clothes.sellingYear, clothes.sellingMonth, clothes.sellingDay):Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


