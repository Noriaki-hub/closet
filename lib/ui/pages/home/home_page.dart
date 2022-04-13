import 'package:closet_app_xxx/controllers/pages/timeline/ranking_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/cache_image.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/libs/web_view.dart';
import 'package:closet_app_xxx/ui/pages/global/account/account_page.dart';
import 'package:closet_app_xxx/ui/pages/global/clothes/clothes_view_screen.dart';
import 'package:closet_app_xxx/ui/pages/home/timeline/media/media_log_tab.dart';
import 'package:closet_app_xxx/ui/pages/home/timeline/ranking/ranking_tab.dart';
import 'package:closet_app_xxx/ui/pages/home/timeline/shop/shop_log_tab.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'src/new_clothes_list.dart';
import 'src/ranking_list_model.dart';
import 'src/share_tile_model.dart';
import 'src/status_map_model.dart';
import 'src/user_tile.dart';
import 'timeline/ranking/timeline_tab.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final isloading =
          ref.watch(rankingPageProvider.select((value) => value.isLoading));
      return isloading
          ? Loading()
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30, child: Image.asset('images/logo.png')),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(LineIcons.stream),
                backgroundColor: Colors.brown.shade50,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TimeLineTab()));
                },
              ),
              body: RefreshIndicator(
                  onRefresh: () async{
                    ref.read(rankingPageProvider.notifier).fetch();
                  },
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: 2500,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildnewList(),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: _buildPriceRankingList()),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: _buildBuyingRankingList(),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: _buildLikedCountRankingList()),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: _buildUserLikedCountRankingList(),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: _buildClothesCountRankingList(size: size),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: _buildMediaList(),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: _buildShopList(),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ]),
                  ),
                ),
              ),
            );
    });
  }

  Widget _buildnewList() {
    return Consumer(
      builder: (context, ref, _) {
        return Container(
          height: 400,
          color: Colors.white,
          child: NewClothesList(),
        );
      },
    );
  }

  Widget _buildPriceRankingList() {
    return Consumer(
      builder: (context, ref, _) {
        final priceRankingMaps = ref.watch(
            rankingPageProvider.select((value) => value.priceRankingMap));
        final priceRankingList = priceRankingMaps.entries
            .map((e) => Ranking(e.key, e.value))
            .toList();

        return priceRankingList.isEmpty
            ? Loading()
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '購入額',
                        style: TextStyle(color: Colors.black45),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RankingTab()));
                        },
                        child: Text(
                          '全て見る',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 250,
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: (4 / 3),
                        ),
                        itemCount: priceRankingList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final ranking = priceRankingList[index];
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(LineIcons.crown,
                                        color: index == 0
                                            ? Colors.yellow
                                            : index == 1
                                                ? Colors.grey
                                                : index == 2
                                                    ? Colors.brown
                                                    : Colors.white),
                                    Text((index + 1).toString()),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ClothesViewScreen(
                                                  clothes: ranking.clothes,
                                                )));
                                  },
                                  child: SizedBox(
                                    height: 180,
                                    width: 180,
                                    child: CacheImage(
                                        imageURL: ranking.clothes.imageURL),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AccountPage(
                                                userId: ranking.user.uid)));
                                  },
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Image.network(
                                              ranking.user.image,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(ranking.user.name),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
      },
    );
  }

  Widget _buildBuyingRankingList() {
    return Consumer(
      builder: (context, ref, _) {
        final statusBuyingMaps = ref.watch(
            rankingPageProvider.select((value) => value.statusBuyingMap));
        final statusBuyingList = statusBuyingMaps.entries
            .map((e) => StatusMapModel(e.key, e.value))
            .toList();

        return statusBuyingList.isEmpty
            ? Container()
            : Column(
                children: [
                  UserTile(
                    statusMap: statusBuyingList[0],
                    islike: false,
                    listNum: 0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  UserTile(
                    statusMap: statusBuyingList[1],
                    islike: false,
                    listNum: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  UserTile(
                    statusMap: statusBuyingList[2],
                    islike: false,
                    listNum: 2,
                  )
                ],
              );
      },
    );
  }

  Widget _buildLikedCountRankingList() {
    return Consumer(
      builder: (context, ref, _) {
        final likeRankingMaps = ref
            .watch(rankingPageProvider.select((value) => value.likeRankingMap));
        final likeRankingList = likeRankingMaps.entries
            .map((e) => Ranking(e.key, e.value))
            .toList();

        return likeRankingList.isEmpty
            ? Loading()
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'いいね数',
                        style: TextStyle(color: Colors.black45),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RankingTab()));
                        },
                        child: Text(
                          '全て見る',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 250,
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: (4 / 3),
                        ),
                        itemCount: likeRankingList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final ranking = likeRankingList[index];
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(LineIcons.crown,
                                        color: index == 0
                                            ? Colors.yellow
                                            : index == 1
                                                ? Colors.grey
                                                : index == 2
                                                    ? Colors.brown
                                                    : Colors.white),
                                    Text((index + 1).toString()),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ClothesViewScreen(
                                                  clothes: ranking.clothes,
                                                )));
                                  },
                                  child: SizedBox(
                                    height: 180,
                                    width: 180,
                                    child: CacheImage(
                                        imageURL: ranking.clothes.imageURL),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AccountPage(
                                                userId: ranking.user.uid)));
                                  },
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Image.network(
                                              ranking.user.image,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(ranking.user.name),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
      },
    );
  }

  Widget _buildUserLikedCountRankingList() {
    return Consumer(
      builder: (context, ref, _) {
        final statusLikedCountMaps = ref.watch(
            rankingPageProvider.select((value) => value.statusLikedCountMap));
        final statusLikedCountList = statusLikedCountMaps.entries
            .map((e) => StatusMapModel(e.key, e.value))
            .toList();

        return statusLikedCountList.isEmpty
            ? Container()
            : Column(
                children: [
                  UserTile(
                    statusMap: statusLikedCountList[0],
                    islike: true,
                    listNum: 0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  UserTile(
                    statusMap: statusLikedCountList[1],
                    islike: true,
                    listNum: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  UserTile(
                    statusMap: statusLikedCountList[2],
                    islike: true,
                    listNum: 2,
                  )
                ],
              );
      },
    );
  }

  Widget _buildClothesCountRankingList({required Size size}) {
    return Consumer(
      builder: (context, ref, _) {
        final statusClothesCountMaps = ref.watch(
            rankingPageProvider.select((value) => value.statusClothesCountMap));
        final statusClothesCountList = statusClothesCountMaps.entries
            .map((e) => StatusMapModel(e.key, e.value))
            .toList();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '所持数',
              style: TextStyle(color: Colors.black45),
            ),
            SizedBox(
              height: 300,
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: (4 / 3),
                  ),
                  itemCount: statusClothesCountList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final map = statusClothesCountList[index];
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(LineIcons.crown,
                                  color: index == 0
                                      ? Colors.yellow
                                      : index == 1
                                          ? Colors.grey
                                          : index == 2
                                              ? Colors.brown
                                              : Colors.white),
                              Text((index + 1).toString()),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AccountPage(userId: map.user.uid)));
                            },
                            child: SizedBox(
                              height: 220,
                              width: 220,
                              child: CacheImage(imageURL: map.user.image),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(map.user.name),
                              SizedBox(
                                width: 10,
                              ),
                              Text(map.status.clothesCount.toString() + '着'),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        );
      },
    );
  }

  Widget _buildMediaList() {
    return Consumer(
      builder: (context, ref, _) {
        final newMediaMaps =
            ref.watch(rankingPageProvider.select((value) => value.newMediaMap));
        final newMediaList =
            newMediaMaps.entries.map((e) => ShareTile(e.key, e.value)).toList();

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '最新のシェアされたニュース',
                  style: TextStyle(color: Colors.black45),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MediaLogTab()));
                  },
                  child: Text(
                    '全て見る',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 250,
              child: newMediaList.isEmpty
                  ? Loading()
                  : GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: (1 / 1),
                      ),
                      itemCount: newMediaList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final shareMap = newMediaList[index];
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WebViewScreen(
                                              url: shareMap.share.url,
                                              genre: shareMap.share.genre)));
                                },
                                child: SizedBox(
                                  height: 180,
                                  width: 300,
                                  child: CacheImage(
                                      imageURL: shareMap.share.image),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                shareMap.share.title,
                                style: TextStyle(fontSize: 10),
                                maxLines: 2,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AccountPage(
                                              userId: shareMap.user.uid)));
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Image.network(
                                            shareMap.user.image,
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(shareMap.user.name),
                                    Text(
                                      'シェアしました',
                                      style: TextStyle(color: Colors.black45),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
            ),
          ],
        );
      },
    );
  }

  Widget _buildShopList() {
    return Consumer(
      builder: (context, ref, _) {
        final newShopMaps =
            ref.watch(rankingPageProvider.select((value) => value.newShopMap));
        final newShopList =
            newShopMaps.entries.map((e) => ShareTile(e.key, e.value)).toList();

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '最新のシェアされたアイテム',
                  style: TextStyle(color: Colors.black45),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ShopLogTab()));
                  },
                  child: Text(
                    '全て見る',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 250,
              child: newShopList.isEmpty
                  ? Loading()
                  : GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: (1 / 1),
                      ),
                      itemCount: newShopList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final shareMap = newShopList[index];
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WebViewScreen(
                                              url: shareMap.share.url,
                                              genre: shareMap.share.genre)));
                                },
                                child: SizedBox(
                                  height: 180,
                                  width: 300,
                                  child: CacheImage(
                                      imageURL: shareMap.share.image),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                shareMap.share.title,
                                style: TextStyle(fontSize: 10),
                                maxLines: 2,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AccountPage(
                                              userId: shareMap.user.uid)));
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Image.network(
                                            shareMap.user.image,
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(shareMap.user.name),
                                    Text(
                                      'シェアしました',
                                      style: TextStyle(color: Colors.black45),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
            ),
          ],
        );
      },
    );
  }
}
