import 'package:closet_app_xxx/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'clothes_count_ranking_page.freezed.dart';

@freezed
class ClothesCountRankingPageState with _$ClothesCountRankingPageState {
  const ClothesCountRankingPageState._();

  const factory ClothesCountRankingPageState({
    @Default('') String lastItemId,
    @Default(<int, UserModel>{}) Map<int, UserModel> clothesCountMap,
    @Default(false) bool isLoading,
    @Default(true) bool isAddClothes,
    @Default(false) bool isScrollLoading,
  }) = _ClothesCountRankingPageState;
}

// final clothesCountRankingPageProvider =
//     StateNotifierProvider<ClothesCountRankingPageController, ClothesCountRankingPageState>((ref) {
//   return ClothesCountRankingPageController(
//     ref.read,
//   );
// });

// class ClothesCountRankingPageController extends StateNotifier<ClothesCountRankingPageState> {
//   ClothesCountRankingPageController(
//     this._read,
//   ) : super(ClothesCountRankingPageState()) {
//     fetch();
//   }
//   final Reader _read;

//   Future<void> fetch() async {
//     state = state.copyWith(isLoading: true);
//     final likeRankingList = await _read(clothesRepositoryProvider)
//         .fetchPriceRanking(category: state.category);

//     final priceRankingMap = {...state.priceRankingMap};
//     for (var clothes in likeRankingList) {
//       final user =
//           await _read(userRepositoryProvider).fetchUser(userId: clothes.uid);
//       if (user != null) {
//         priceRankingMap..addAll({clothes: user});
//       }
//     }

//     state = state.copyWith(
//         priceRankingMap: priceRankingMap,
//         isLoading: false,
//         lastItemId: likeRankingList.last.itemId);
//   }

//   Future<void> changeCategory({required String category}) async {
//     state = state.copyWith(category: category, priceRankingMap: {});
//     await fetch();
//   }

//   Future<void> pullToRefresh() async {
//     state = state.copyWith(priceRankingMap: {});
//     await fetch();
//   }

//   Future<void> endScroll() async {
//     state = state.copyWith(isScrollLoading: true);
//     final addLikeRankingList = await _read(clothesRepositoryProvider)
//         .fetchAddPriceRanking(lastItemId: state.lastItemId, category: state.category);
//     final priceRankingMap = {...state.priceRankingMap};
//     for (var clothes in addLikeRankingList) {
//       final user =
//           await _read(userRepositoryProvider).fetchUser(userId: clothes.uid);
//       if (user != null) {
//         priceRankingMap..addAll({clothes: user});
//       }
//     }

//     if (addLikeRankingList.length < 12) {
//       state = state.copyWith(isAddClothes: false);
//     }

//     state = state.copyWith(
//         priceRankingMap: priceRankingMap,
//         isScrollLoading: false, lastItemId: addLikeRankingList.last.itemId);
//   }
// }
