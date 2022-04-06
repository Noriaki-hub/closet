import 'package:closet_app_xxx/controllers/pages/ranking_page_controller.dart';
import 'package:closet_app_xxx/ui/pages/timeline/ranking/src/gridtile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'ranking_list_model.dart';

class PriceRankingList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priceRankingMaps =
        ref.watch(rankingPageProvider.select((value) => value.priceRankingMap));
    final priceRankingList =
        priceRankingMaps.entries.map((e) => Ranking(e.key, e.value)).toList();
    return priceRankingList.isEmpty
        ? Center(
            child: Text(
            'ランキングはありません',
            style: TextStyle(color: Colors.black45),
          ))
        : Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: (3 / 5),
              ),
              itemCount: priceRankingList.length,
              itemBuilder: (BuildContext context, int index) {
                final ranking = priceRankingList[index];
                return Tile(
                  clothes: ranking.clothes,
                  user: ranking.user,
                  islike: false,
                );
              }),
        );
  }
}
