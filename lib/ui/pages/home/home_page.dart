import 'package:closet_app_xxx/controllers/pages/timeline/ranking_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/app_colors.dart';
import 'package:closet_app_xxx/ui/libs/cache_image.dart';
import 'package:closet_app_xxx/ui/libs/widgets.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/libs/navigation.dart';
import 'package:closet_app_xxx/ui/libs/web_view.dart';
import 'package:closet_app_xxx/ui/pages/follow/follow_tab.dart';
import 'package:closet_app_xxx/ui/pages/global/account/account_page.dart';
import 'package:closet_app_xxx/ui/pages/global/clothes/clothes_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'src/new_clothes_list.dart';
import 'src/ranking_list_model.dart';
import 'src/share_tile_model.dart';
import 'src/status_map_model.dart';
import 'src/user_tile.dart';

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
          : GlassScaffold(
              appBar: GlassAppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 30,
                        child: Image.asset(
                          'images/logo.png',
                          color: AppColors.text,
                        )),
                  ],
                ),
                leading: InkWell(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FollowTab(),
                          fullscreenDialog: true,
                        ));
                  }),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        LineIcons.bars,
                        color: AppColors.text,
                      ),
                      Text(
                        'フォロー済み',
                        style: TextStyle(fontSize: 8, color: AppColors.text),
                      ),
                    ],
                  ),
                ),
                actions: [
                  Container(
                    width: 50,
                  )
                ],
              ),
              body: RefreshIndicator(
                onRefresh: () async {
                  ref.read(rankingPageProvider.notifier).fetch();
                },
                child: SingleChildScrollView(
                  child: GlassContainer(
                    borderRadius: BorderRadius.zero,
                    height: 3000,
                    width: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 120,
                          ),
                          _buildnewList(),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: _buildPriceRankingList()),
                          SizedBox(
                            height: 40,
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
                          SizedBox(
                            height: 40,
                          ),
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
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 380, child: NewClothesList()),
          ],
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
        priceRankingList.shuffle();

        return priceRankingList.isEmpty
            ? Loading()
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GlassContainer(
                        borderRadius: BorderRadius.circular(12),
                        width: 120,
                        height: 30,
                        child: Center(
                          child: Text(
                            '金額が高いもの',
                            style: TextStyle(color: AppColors.text),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 150,
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: (1 / 1),
                        ),
                        itemCount: priceRankingList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final ranking = priceRankingList[index];
                          return InkWell(
                            onTap: () => Navigation().transition(
                                context: context,
                                widget: ClothesViewScreen(
                                    clothes: ranking.clothes)),
                            child: GlassContainer(
                                borderRadius: BorderRadius.circular(15),
                                width: 150,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        width: 140,
                                        height: 140,
                                        child: CacheImage(
                                            imageURL: ranking.clothes.imageURL),
                                      ),
                                    ),
                                  ],
                                )),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlassContainer(
                    borderRadius: BorderRadius.circular(12),
                    width: 120,
                    height: 30,
                    child: Center(
                      child: Text('総購入額',
                          style: TextStyle(
                            color: AppColors.text,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
        likeRankingList.shuffle();

        return likeRankingList.isEmpty
            ? Loading()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlassContainer(
                    borderRadius: BorderRadius.circular(12),
                    width: 130,
                    height: 30,
                    child: Center(
                      child: Text(
                        'いいねが多いもの',
                        style: TextStyle(color: AppColors.text),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 150,
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          // childAspectRatio: (1 / 1),
                        ),
                        itemCount: likeRankingList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final ranking = likeRankingList[index];
                          return InkWell(
                            onTap: () => Navigation().transition(
                                context: context,
                                widget: ClothesViewScreen(
                                    clothes: ranking.clothes)),
                            child: GlassContainer(
                                borderRadius: BorderRadius.circular(15),
                                width: 150,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        width: 140,
                                        height: 140,
                                        child: CacheImage(
                                            imageURL: ranking.clothes.imageURL),
                                      ),
                                    ),
                                  ],
                                )),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlassContainer(
                    borderRadius: BorderRadius.circular(12),
                    width: 120,
                    height: 30,
                    child: Center(
                      child: Text(
                        '総いいね数',
                        style: TextStyle(color: AppColors.text),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
        statusClothesCountList.shuffle();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlassContainer(
              borderRadius: BorderRadius.circular(12),
              width: 150,
              height: 30,
              child: Center(
                child: Text(
                  'おすすめのユーザー',
                  style: TextStyle(color: AppColors.text),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 500,
              width: 350,
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                    childAspectRatio: (1 / 1),
                  ),
                  itemCount: statusClothesCountList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final map = statusClothesCountList[index];
                    return InkWell(
                      onTap: () => Navigation().transition(
                          context: context,
                          widget: AccountPage(userId: map.user.uid)),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          map.user.image,
                        ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlassContainer(
              borderRadius: BorderRadius.circular(12),
              width: 180,
              height: 30,
              child: Center(
                  child: Text(
                'シェアされたニュース',
                style: TextStyle(color: AppColors.text),
              )),
            ),
            SizedBox(
              height: 10,
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
                                              isNavigation: true,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlassContainer(
              borderRadius: BorderRadius.circular(12),
              width: 180,
              height: 30,
              child: Center(
                  child: Text(
                'シェアされたアイテム',
                style: TextStyle(color: AppColors.text),
              )),
            ),
            SizedBox(
              height: 10,
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
                                                isNavigation: true,
                                                genre: shareMap.share.genre,
                                              )));
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
