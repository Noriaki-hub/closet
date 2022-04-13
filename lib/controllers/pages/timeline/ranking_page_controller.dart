import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/models/media.dart';
import 'package:closet_app_xxx/models/share.dart';
import 'package:closet_app_xxx/models/shop.dart';
import 'package:closet_app_xxx/models/status.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/clothes_repository.dart';
import 'package:closet_app_xxx/repositories/global/user_repository.dart';
import 'package:closet_app_xxx/repositories/status_repository.dart';
import 'package:closet_app_xxx/repositories/time_line_page_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_page_controller.freezed.dart';

@freezed
class RankingPageState with _$RankingPageState {
  const RankingPageState._();

  const factory RankingPageState({
    @Default(<Clothes, UserModel>{}) Map<Clothes, UserModel> priceRankingMap,
    @Default(<Clothes, UserModel>{}) Map<Clothes, UserModel> likeRankingMap,
    @Default(<Clothes, UserModel>{}) Map<Clothes, UserModel> newClothesMap,
    @Default(<Share, UserModel>{}) Map<Share, UserModel> newMediaMap,
    @Default(<Share, UserModel>{}) Map<Share, UserModel> newShopMap,
    @Default(<Status, UserModel>{}) Map<Status, UserModel> statusBuyingMap,
    @Default(<Status, UserModel>{}) Map<Status, UserModel> statusLikedCountMap,
    @Default(<Status, UserModel>{})
        Map<Status, UserModel> statusClothesCountMap,
    @Default(false) bool isLoading,
  }) = _RankingPageState;
}

final rankingPageProvider =
    StateNotifierProvider<RankingPageController, RankingPageState>((ref) {
  return RankingPageController(
    ref.read,
  );
});

class RankingPageController extends StateNotifier<RankingPageState> {
  RankingPageController(
    this._read,
  ) : super(RankingPageState()) {
    fetch();
  }
  final Reader _read;

  Future<void> fetch() async {
    state = state.copyWith(isLoading: true);
    final priceRankingList = await _read(clothesRepositoryProvider)
        .fetchPriceRanking(category: 'ALL');

    final priceRankingMap = {...state.priceRankingMap};
    for (var clothes in priceRankingList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: clothes.uid);
      if (user != null) {
        priceRankingMap..addAll({clothes: user});
      }
    }

    final likeRankingList = await _read(clothesRepositoryProvider)
        .fetchLikeRanking(category: 'ALL');

    final likeRankingMap = {...state.likeRankingMap};
    for (var clothes in likeRankingList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: clothes.uid);
      if (user != null) {
        likeRankingMap..addAll({clothes: user});
      }
    }

    final newClothesList =
        await _read(timeLineRepositoryProvider).fetchTimeLines();

    final newClothesMap = {...state.newClothesMap};
    for (var clothes in newClothesList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: clothes.uid);
      if (user != null) {
        newClothesMap..addAll({clothes: user});
      }
    }

    final mediaList = await _read(timeLineRepositoryProvider).fetchShares(
      genre: 'media',
      limit: 5,
    );

    final mediaMap = {...state.newMediaMap};
    for (var share in mediaList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: share.uid);
      if (user != null) {
        mediaMap..addAll({share: user});
      }
    }

    final shopList = await _read(timeLineRepositoryProvider).fetchShares(
      genre: 'shop',
      limit: 5,
    );

    final shopMap = {...state.newShopMap};
    for (var share in shopList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: share.uid);
      if (user != null) {
        shopMap..addAll({share: user});
      }
    }

    final statusBuyingList =
        await _read(statusRepositoryProvider).fetchBuyingStatus(limit: 3);

    final statusBuyingMap = {...state.statusBuyingMap};
    for (var status in statusBuyingList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: status.uid);
      if (user != null) {
        statusBuyingMap..addAll({status: user});
      }
    }

    final statusLikedCountList =
        await _read(statusRepositoryProvider).fetchLikedCountStatus(limit: 3);

    final statusLikedCountMap = {...state.statusLikedCountMap};
    for (var status in statusLikedCountList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: status.uid);
      if (user != null) {
        statusLikedCountMap..addAll({status: user});
      }
    }

    final statusClothesCountList =
        await _read(statusRepositoryProvider).fetchClothesCountStatus(limit: 4);

    final statusClothesCountMap = {...state.statusClothesCountMap};
    for (var status in statusClothesCountList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: status.uid);

      if (user != null) {
        statusClothesCountMap..addAll({status: user});
      }
    }

    state = state.copyWith(
      priceRankingMap: priceRankingMap,
      likeRankingMap: likeRankingMap,
      newClothesMap: newClothesMap,
      newMediaMap: mediaMap,
      newShopMap: shopMap,
      statusBuyingMap: statusBuyingMap,
      statusLikedCountMap: statusLikedCountMap,
      statusClothesCountMap: statusClothesCountMap,
      isLoading: false,
    );
  }
}
