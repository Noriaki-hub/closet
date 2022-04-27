import 'package:closet_app_xxx/controllers/pages/search/search_brand_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/pages/global/brand/brand_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBrandPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.bottom,
              onChanged: (text) async {
                await ref
                    .read(searchBrandPageProvider.notifier)
                    .changeSearchWords(brandName: text);
              },
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                hintText: 'ブランドを入力',
                hintStyle: TextStyle(fontWeight: FontWeight.w100),
                prefixIcon: Icon(
                  Icons.search,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent)),
              ),
            ),
          ),
        ),
        Expanded(child: buildBrandListArea())
      ]),
    );
  }

  Widget buildBrandListArea() {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final brandList =
          ref.watch(searchBrandPageProvider.select((value) => value.brandList));
           final searchedBrandList =
          ref.watch(searchBrandPageProvider.select((value) => value.searchedBrandList));
      return brandList.isEmpty
          ? Loading()
          : ListView.builder(
              itemCount: searchedBrandList.isEmpty? brandList.length: searchedBrandList.length,
              itemBuilder: (BuildContext context, int index) {
                final brand = searchedBrandList.isEmpty? brandList[index]: searchedBrandList[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BrandViewPage(brand: brand)));
                    },
                    child: ListTile(
                      title: Text(brand.brand_name_ja),
                      subtitle: Text(brand.brand_name_en),
                    ),
                  ),
                );
              });
    });
  }
}
