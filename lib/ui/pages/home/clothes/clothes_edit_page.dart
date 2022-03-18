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
import '../../../../models/clothes.dart';

class ClothesEditPage extends StatelessWidget {
  ClothesEditPage({
    Key? key,
    required this.clothes,

  }) : super(key: key);


  final ClothesForPublic clothes;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        ClothesEditPageProvider.overrideWithProvider(
          ClothesEditPageProviderFamily(
            ClothesEditPageProviderArg( clothes: clothes),
          ),
        ),
      ],
      child: _ClothesEditPage(),
    );
  }
}


class _ClothesEditPage extends HookConsumerWidget {


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clothes = ref.watch(ClothesEditPageProvider.select((value) => value.clothes));
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
      body: clothes.itemId == ''? Center(child: CircularProgressIndicator(),):Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 1400,
            child: Padding(
              padding: const EdgeInsets.only(right: 40, left: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ImageChangeField(),
                  BrandsTextField(),
                  DescriptionTextField(),
                  CategoryController(),
                  PriceTextField(),
                  DatePickField(),
                  clothes.isSell?
                  SellingTextField():Container(),
                  clothes.isSell?
                  SellDatePickField():Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


