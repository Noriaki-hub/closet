import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/clothes_repository.dart';
import 'package:closet_app_xxx/repositories/global/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_ranking_page_controller.freezed.dart';

@freezed
class LikeRankingPageState with _$LikeRankingPageState {
  const LikeRankingPageState._();

  const factory LikeRankingPageState({
    @Default('') String lastItemId,
    @Default(<Clothes, UserModel>{}) Map<Clothes, UserModel> likeRankingMap,
    @Default(false) bool isLoading,
    @Default(false) bool isScrollLoading,
    @Default(true) bool isAddClothes,
    @Default('ALL') String category,
  }) = _LikeRankingPageState;
}

final likeRankingPageProvider =
    StateNotifierProvider<LikeRankingPageController, LikeRankingPageState>(
        (ref) {
  return LikeRankingPageController(
    ref.read,
  );
});

class LikeRankingPageController extends StateNotifier<LikeRankingPageState> {
  LikeRankingPageController(
    this._read,
  ) : super(LikeRankingPageState()) {
    fetch();
  }
  final Reader _read;

  Future<void> fetch() async {
    state = state.copyWith(isLoading: true);

    //mapをリセット
    state = state.copyWith(likeRankingMap: {});

    final likeRankingList = await _read(clothesRepositoryProvider)
        .fetchLikeRanking(category: state.category);

    final likeRankingMap = {...state.likeRankingMap};
    for (var clothes in likeRankingList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: clothes.uid);
      if (user != null) {
        likeRankingMap..addAll({clothes: user});
      }
    }

    state = state.copyWith(
        likeRankingMap: likeRankingMap,
        isLoading: false,
        lastItemId: likeRankingList.last.itemId);
  }

  Future<void> pullToRefresh() async {
    fetch();
  }

  Future<void> changeCategory({required String category}) async {
    state = state.copyWith(category: category);
    fetch();
  }

  Future<void> endScroll() async {
    state = state.copyWith(isScrollLoading: true);
    final lastItemId = state.lastItemId;
    final addPriceRankingList = await _read(clothesRepositoryProvider)
        .fetchAddLikeRanking(lastItemId: lastItemId, category: state.category);
    final likeRankingMap = {...state.likeRankingMap};
    for (var clothes in addPriceRankingList) {
      final user =
          await _read(userRepositoryProvider).fetchUser(userId: clothes.uid);
      if (user != null) {
        likeRankingMap..addAll({clothes: user});
      }
    }

    if (addPriceRankingList.length < 12) {
      state = state.copyWith(isAddClothes: false);
    }

    state = state.copyWith(likeRankingMap: likeRankingMap, isScrollLoading: false, lastItemId: addPriceRankingList.last.itemId);
  }
}
