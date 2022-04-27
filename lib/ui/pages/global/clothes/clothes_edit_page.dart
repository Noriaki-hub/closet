import 'package:closet_app_xxx/controllers/pages/global/clothes_edit_page_controller.dart';
import 'package:closet_app_xxx/models/brand.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/pages/global/clothes/src/brands_text_field.dart';
import 'package:closet_app_xxx/ui/pages/global/clothes/src/category_controller.dart';
import 'package:closet_app_xxx/ui/pages/global/clothes/src/date_pick_field.dart';
import 'package:closet_app_xxx/ui/pages/global/clothes/src/description_text_field.dart';
import 'package:closet_app_xxx/ui/pages/global/clothes/src/image_change_field.dart';
import 'package:closet_app_xxx/ui/pages/global/clothes/src/price_text_field.dart';
import 'package:closet_app_xxx/ui/pages/global/clothes/src/sellDatePickField.dart';
import 'package:closet_app_xxx/ui/pages/global/clothes/src/selling_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class ClothesEditPage extends HookConsumerWidget {
  ClothesEditPage({
    required this.itemId,
    required this.brandId,
    Key? key,
  }) : super(key: key);

  final String itemId;
  final int brandId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clothes =
        ref.watch(clothesEditPageProvider.select((value) => value.clothes));
    final isEdit =
        ref.watch(clothesEditPageProvider.select((value) => value.isEdit));
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          ref.read(clothesEditPageProvider.notifier).fetch(itemId: itemId, brandId: brandId);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.brown.shade50,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                icon: Icon(LineIcons.angleLeft),
              ),
            ),
            floatingActionButton: !isEdit
                ? Container()
                : FloatingActionButton(
                    child: Text('変更'),
                    backgroundColor: Colors.brown.shade50,
                    onPressed: () async {
                      await ref
                          .read(clothesEditPageProvider.notifier)
                          .updateClothes(clothes: clothes!);
                      Navigator.pop(context, true);
                    },
                  ),
            body: clothes == null
                ? Center(child: Loading())
                : Padding(
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
                              clothes.isSell ? SellingTextField() : Container(),
                              clothes.isSell ? SellDatePickField() : Container()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          );
        },
        child: Scaffold());
  }
}
