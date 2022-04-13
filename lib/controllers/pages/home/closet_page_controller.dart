import 'package:closet_app_xxx/controllers/global/date_now_controller.dart';
import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/clothes_repository.dart';
import 'package:closet_app_xxx/repositories/global/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'closet_page_controller.freezed.dart';

@freezed
class ClosetPageState with _$ClosetPageState {
  const ClosetPageState._();

  const factory ClosetPageState({
    @Default(<Clothes>[]) List<Clothes> closet,
    @Default(<Clothes>[]) List<Clothes> closetFavorite,
    @Default('') String buying,
    @Default('') String selling,
    @Default('') String year,
    @Default('') String month,
    @Default(false) bool isSell,
    @Default('ALL') String category,
    @Default(UserModel()) UserModel user,
    @Default(false) bool isLoading,
    @Default(false) bool isAddClothes,
  }) = _ClosetPageState;

}

class ClosetPageProviderArg {
  ClosetPageProviderArg({required this.userId});
  final String userId;
}

final ClosetPageProvider =
StateNotifierProvider.autoDispose<ClosetPageController, ClosetPageState>(
        (ref) {
      return throw UnimplementedError();
    });

final ClosetPageProviderFamily = StateNotifierProvider.family.autoDispose<
    ClosetPageController,
    ClosetPageState,
    ClosetPageProviderArg>((ref, arg) {
  return ClosetPageController(
    ref.read,
    userId: arg.userId
  );
});

class ClosetPageController extends StateNotifier<ClosetPageState> {
  ClosetPageController(this._read,  {required String userId})  : _userId = userId, super(const ClosetPageState()) {
    _init();
  }
  final String _userId;
  final Reader _read;

  Future<void> _init() async {
    fetchHomePageData();
  }

  Future<void> fetchHomePageData() async {
    final date = _read(dateNowProvider);

    final List<Clothes> closet = await _read(clothesRepositoryProvider)
        .fetchCloset(
        isSell: state.isSell, userId: _userId, category: state.category, limit: 12);
    final List<Clothes> closetFavorite = await _read(clothesRepositoryProvider)
        .fetchFavorite(isSell: state.isSell, userId: _userId,);
    final buying = await _read(clothesRepositoryProvider).fetchBuying(
      userId: _userId, month: date.month, year: date.year,);
    final selling = await _read(clothesRepositoryProvider).fetchSelling(
      userId: _userId, month: date.month, year: date.year,);
    final user = await _read(userRepositoryProvider).fetchUser(userId: _userId);
    if (user != null) {
      state = state.copyWith(
          closet: closet,
          closetFavorite: closetFavorite,
          buying: buying,
          selling: selling,
          year: date.year,
          month: date.month,
          user: user);
    }
  }

  Future<void> endScroll()async{
    state = state.copyWith(isLoading: true);
    final lastItemId = state.closet.last.itemId;
    final addClothes = await _read(clothesRepositoryProvider).fetchAddCloset(userId: _userId, lastItemId: lastItemId, isSell: state.isSell, category: state.category);
    final closet = state.closet..addAll(addClothes);
    if(addClothes.length < 12){
      state = state.copyWith(isAddClothes: false);
    }
    state = state.copyWith(closet: closet, isLoading: false);
  }


  Future<void> changeCategory({required String category}) async {
    final List<Clothes> closet = await _read(clothesRepositoryProvider).fetchCloset(isSell: state.isSell, userId: _userId, category: category, limit: 12);
    state = state.copyWith( closet: closet, category: category);
  }

  Future<void> isSellTrue() async {
    state = state.copyWith(isSell: true);
    fetchHomePageData();
  }

  Future<void> isSellFalse() async {
    state = state.copyWith(isSell: false);
    fetchHomePageData();
  }

}

