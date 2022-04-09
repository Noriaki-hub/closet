import 'package:closet_app_xxx/controllers/pages/web/shop_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/cache_image.dart';
import 'package:closet_app_xxx/ui/libs/floating_action_button_animation.dart';
import 'package:closet_app_xxx/ui/libs/web_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'add/shop_add_page.dart';
import 'edit/shop_select_page.dart';

class ShopPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        floatingActionButton: ExpandableFab(
          distance: 112.0,
          children: [
            ActionButton(
              onPressed: () async {
                final result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShopAddPage()));
                if (result) {
                  ref.read(shopPageProvider.notifier).fetchShops();
                }
              },
              icon: Icon(
                LineIcons.plus,
                color: Colors.black45,
              ),
            ),
            ActionButton(
              onPressed: () async {
                final result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShopSelectPage()));
                if (result) {
                  ref.read(shopPageProvider.notifier).fetchShops();
                }
              },
              icon: const Icon(
                LineIcons.list,
                color: Colors.black45,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.brown.shade50,
        body: RefreshIndicator(
            onRefresh: () async {
              await ref.read(shopPageProvider.notifier).fetchShops();
            },
            child: ShopList()));
  }
}

class ShopList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shops = ref.watch(shopPageProvider.select((value) => value.shops));
    return shops.isEmpty
        ? Center(
            child: Text(
            'お気に入りのショップを追加しよう',
            style: TextStyle(color: Colors.black45),
          ))
        : GridView.builder(
            itemCount: shops.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 0.9),
            itemBuilder: (BuildContext context, int index) {
              final shop = shops[index];
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebViewScreen(
                                      genre: 'shop',
                                      url: shop.url,
                                    )));
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: SizedBox(
                              height: 150,
                              width: 150,
                              child: CacheImage(imageURL: shop.image))),
                    ),
                    Text(shop.name)
                  ],
                ),
              );
            });
  }
}
