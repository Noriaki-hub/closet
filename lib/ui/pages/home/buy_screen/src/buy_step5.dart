import 'package:closet_app_xxx/controllers/pages/home/buy_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BuyStep5 extends HookConsumerWidget {
  final List<MapEntry<String, String>> buyingForms = [
    MapEntry("new", '新品'),
    MapEntry("used", '中古'),
    MapEntry("gift", '貰い物'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buyingFormState =
        ref.watch(buyPageProvider.select((value) => value.buyingForm));
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        children: [
          Container(
            height: 150,
            width: 200,
            child: ListView.builder(
                itemCount: buyingForms.length,
                itemBuilder: (BuildContext context, int index) {
                  final buyingForm = buyingForms[index];
                  return OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), //角の丸み
                      ),
                      side: BorderSide(
                          color: buyingFormState != buyingForm.key
                              ? Colors.black45
                              : Colors.blue),
                    ),
                    child: Text(
                      buyingForm.value,
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      await ref
                          .read(buyPageProvider.notifier)
                          .buyingForm(buyingForm: buyingForm.key);
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
