import 'package:closet_app_xxx/controllers/pages/global/brand_view_page_controller.dart';
import 'package:closet_app_xxx/models/brand.dart';
import 'package:closet_app_xxx/ui/libs/cache_image.dart';
import 'package:closet_app_xxx/ui/libs/web_view.dart';
import 'package:closet_app_xxx/ui/pages/global/brand/src/follow_button.dart';
import 'package:closet_app_xxx/ui/pages/global/brand/src/slideShow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class BrandViewPage extends StatelessWidget {
  BrandViewPage({required this.brand});

  final Brand brand;
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        brandViewPageProvider.overrideWithProvider(
          brandViewPageProviderFamily(
            BrandViewPageProviderArg(brandId: brand.brandId),
          ),
        ),
      ],
      child: _BrandViewPage(
        brand: brand,
      ),
    );
  }
}

class _BrandViewPage extends StatelessWidget {
  _BrandViewPage({required this.brand});

  final Brand brand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
        ),
        body: Container(
          color: Colors.grey.shade50,
          height: 1800,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(children: [
              Container(color: Colors.white, height: 400, child: SlideShow()),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                            Text(
                              brand.brand_name_en,
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(width: 5),
                            SizedBox(
                              height: 30,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    brand.brand_name_ja,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FollowButton(),
                        SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.black45,
                        ),
                        Wrap(
                          spacing: 10,
                          children: [
                            brand.site_url == ''
                                ? Container()
                                : OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10), //角の丸み
                                      ),
                                      side: const BorderSide(
                                          color: Colors.black45),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WebViewScreen(
                                                    genre: '',
                                                    url: brand.site_url,
                                                  )));
                                    },
                                    child: SizedBox(
                                      width: 100,
                                      child: Row(
                                        children: [
                                          Icon(LineIcons.instagram),
                                          const Text(
                                            '公式サイト',
                                            style: TextStyle(
                                                color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10), //角の丸み
                                ),
                                side: const BorderSide(color: Colors.black45),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WebViewScreen(
                                              genre: '',
                                              url:
                                                  "https://www.fashion-press.net/brands/" +
                                                      brand.brandId.toString(),
                                            )));
                              },
                              child: const Text(
                                'ブランド詳細',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildNewClothesList(),
              ),
            ]),
          ),
        ));
  }

  Widget buildNewClothesList() {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final clothesList =
          ref.watch(brandViewPageProvider.select((value) => value.clothesList));

      return clothesList.isEmpty
          ? Container()
          : Column(
              children: [
                SizedBox(
                  height: 700,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        childAspectRatio: (1 / 1),
                      ),
                      itemCount: clothesList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final clothes = clothesList[index];
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  height: 180,
                                  width: 180,
                                  child: CacheImage(imageURL: clothes.imageURL),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
    });
  }
}
