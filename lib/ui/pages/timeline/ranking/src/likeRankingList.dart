import 'package:closet_app_xxx/controllers/pages/like_ranking_page_controller.dart';

import 'package:closet_app_xxx/ui/pages/timeline/ranking/src/gridtile.dart';
import 'package:closet_app_xxx/ui/pages/timeline/ranking/src/ranking_list_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LikeRankingList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likeRankingMaps = ref
        .watch(likeRankingPageProvider.select((value) => value.likeRankingMap));
    final likeRankingList =
        likeRankingMaps.entries.map((e) => Ranking(e.key, e.value)).toList();
    return likeRankingList.isEmpty
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
              itemCount: likeRankingList.length,
              itemBuilder: (BuildContext context, int index) {
                final ranking = likeRankingList[index];
                return Tile(
                  clothes: ranking.clothes,
                  user: ranking.user,
                  islike: true,
                );
              }),
        );
  }
}
