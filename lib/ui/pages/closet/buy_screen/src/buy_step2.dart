import 'package:closet_app_xxx/controllers/pages/home/buy_page_controller.dart';
import 'package:closet_app_xxx/ui/pages/closet/buy_screen/src/brand_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BuyStep2 extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedBrand =
        ref.watch(buyPageProvider.select((value) => value.selectedBrand));
    return Column(
      children: [
        Text(selectedBrand.brand_name_en),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), //角の丸み
              ),
              side: const BorderSide(color: Colors.black45),
            ),
            child: Text(
              '選択',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              _showPicker(context);
            },
          ),
        ),
      ],
    );
  }

  void _showPicker(
    context,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return SafeArea(child: BrandList());
        });
  }
}
