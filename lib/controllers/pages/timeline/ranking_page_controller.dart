import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/clothes_repository.dart';
import 'package:closet_app_xxx/repositories/global/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_page_controller.freezed.dart';

@freezed
class RankingPageState with _$RankingPageState {
  const RankingPageState._();

  const factory RankingPageState({
    @Default('') String lastItemId,
    @Default(<Clothes, UserModel>{}) Map<Clothes, UserModel> priceRankingMap,
    @Default(false) bool isLoading,
    @Default(true) bool isAddClothes,
    @Default(false) bool isScrollLoading,
    @Default('ALL') String category,
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
    final likeRankingList = await _read(clothesRepositoryProvider)
        .fetchPriceRanking(category: state.category);

    final priceRankingMap = {...state.priceRankingMap};
    for (var clothes in likeRankingList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: clothes.uid);
      if (user != null) {
        priceRankingMap..addAll({clothes: user});
      }
    }

    state = state.copyWith(
        priceRankingMap: priceRankingMap,
        isLoading: false,
        lastItemId: likeRankingList.last.itemId);
  }

  Future<void> changeCategory({required String category}) async {
    state = state.copyWith(category: category, priceRankingMap: {});
    await fetch();
  }

  Future<void> pullToRefresh() async {
    state = state.copyWith(priceRankingMap: {});
    await fetch();
  }

  Future<void> endScroll() async {
    state = state.copyWith(isScrollLoading: true);
    final addLikeRankingList = await _read(clothesRepositoryProvider)
        .fetchAddPriceRanking(lastItemId: state.lastItemId, category: state.category);
    final priceRankingMap = {...state.priceRankingMap};
    for (var clothes in addLikeRankingList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: clothes.uid);
      if (user != null) {
        priceRankingMap..addAll({clothes: user});
      }
    }

    if (addLikeRankingList.length < 12) {
      state = state.copyWith(isAddClothes: false);
    }

    state = state.copyWith(
        priceRankingMap: priceRankingMap,
        isScrollLoading: false, lastItemId: addLikeRankingList.last.itemId);
  }
}
