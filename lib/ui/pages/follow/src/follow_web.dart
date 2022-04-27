import 'package:closet_app_xxx/controllers/pages/follow/follow_brand_page_controller.dart';
import 'package:closet_app_xxx/controllers/pages/follow/follow_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/pages/global/brand/brand_view_page.dart';
import 'package:closet_app_xxx/ui/pages/search/user/user_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class FollowBrandPage extends StatelessWidget {
  FollowBrandPage({
    Key? key,
    this.userId,
  }) : super(key: key);

  final String? userId;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        followBrandPageProvider.overrideWithProvider(
          followBrandPageProviderFamily(
            FollowBrandPageProviderArg(userId: userId),
          ),
        ),
      ],
      child: _FollowBrandPage(userId: userId),
    );
  }
}

class _FollowBrandPage extends HookConsumerWidget {
  _FollowBrandPage({Key? key, this.userId}) : super(key: key);
  final String? userId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
     
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(followBrandPageProvider.notifier).fetchFollows();
        },
        child: ItemList(),
      ),
    );
  }
}

class ItemList extends HookConsumerWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final follows =
        ref.watch(followBrandPageProvider.select((value) => value.follows));
    final isLoading =
        ref.watch(followBrandPageProvider.select((value) => value.isLoading));
    return isLoading
        ? Loading()
        : follows.isEmpty
            ? Center(
                child: Text(
                  'フォローしていません',
                  style: TextStyle(color: Colors.black45),
                ),
              )
            : ListView.builder(
                itemCount: follows.length,
                itemBuilder: (BuildContext context, int index) {
                  final brand = follows[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BrandViewPage(
                                brand: brand,
                              ),
                            ));
                      },
                      child: ListTile(
                        title: Text(brand.brand_name_en),
                        subtitle: Text(brand.brand_name_en),
                      ),
                    ),
                  );
                });
  }
}
