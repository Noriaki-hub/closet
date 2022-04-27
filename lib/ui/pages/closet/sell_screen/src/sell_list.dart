import 'package:closet_app_xxx/controllers/pages/home/sell_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SellList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final closet = ref.watch(sellPageProvider.select((value) => value.closet));
    final isLoading =
        ref.watch(sellPageProvider.select((value) => value.isLoading));
    final selectedClothesId =
        ref.watch(sellPageProvider.select((value) => value.selectClothesId));
    return NotificationListener<ScrollEndNotification>(
      onNotification: (notification) {
        final metrics = notification.metrics;
        if (!isLoading && metrics.extentAfter == 0) {
          ref.read(sellPageProvider.notifier).endScroll();
        }
        return true;
      },
      child: ListView.builder(
          itemCount: closet.length,
          itemBuilder: (BuildContext context, int index) {
            final clothes = closet[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  ref
                      .read(sellPageProvider.notifier)
                      .selectClothes(clothes: clothes);
                },
                child: ListTile(
                  tileColor: selectedClothesId == clothes.itemId
                      ? Colors.blueGrey.shade100
                      : Colors.white.withOpacity(0.5),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CacheImage(imageURL: clothes.imageURL)
                    ),
                  ),
                  title: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(clothes.brandId.toString()),
                      ],
                    ),
                  ),
                  subtitle: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(clothes.description),
                      ],
                    ),
                  ),
                  trailing: Column(
                    children: [
                      Text(clothes.price.toString()),
                      Text(
                        clothes.year + '/' + clothes.month + '/' + clothes.day,
                        style: TextStyle(fontWeight: FontWeight.w100),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
