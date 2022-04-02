import 'package:closet_app_xxx/controllers/global/date_now_controller.dart';
import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/clothes.dart';
import '../../repositories/clothes_repository.dart';
import '../../repositories/global/user_repository.dart';

part 'home_page_controller.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const HomePageState._();

  const factory HomePageState(
      {@Default(<Clothes>[]) List<Clothes> closet,
      @Default(<Clothes>[]) List<Clothes> closetFavorite,
      @Default('') String buying,
      @Default('') String selling,
      @Default('') String year,
      @Default('') String month,
      @Default(false) bool isSell,
      @Default('ALL') String category,
      @Default(UserModel()) UserModel user,
      @Default(false) bool isLoading,
      @Default(true) bool isAddClothes}) = _HomePageState;
}

final HomePageProvider =
    StateNotifierProvider<HomePageController, HomePageState>((ref) {
  final userId = ref.watch(userProvider.select((value) => value.user.uid));
  return HomePageController(ref.read, userId: userId);
});

class HomePageController extends StateNotifier<HomePageState> {
  HomePageController(this._read, {required String userId})
      : _userId = userId,
        super(const HomePageState()) {
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
            isSell: state.isSell, userId: _userId, category: state.category);
    final List<Clothes> closetFavorite =
        await _read(clothesRepositoryProvider).fetchFavorite(
      isSell: state.isSell,
      userId: _userId,
    );
    final buying = await _read(clothesRepositoryProvider).fetchBuying(
      userId: _userId,
      month: date.month,
      year: date.year,
    );
    final selling = await _read(clothesRepositoryProvider).fetchSelling(
      userId: _userId,
      month: date.month,
      year: date.year,
    );
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

  Future<void> endScroll() async {
    state = state.copyWith(isLoading: true);
    final lastItemId = state.closet.last.itemId;
    final addClothes = await _read(clothesRepositoryProvider).fetchAddCloset(
        userId: _userId,
        lastItemId: lastItemId,
        isSell: state.isSell,
        category: state.category);
    final closet = state.closet..addAll(addClothes);
    if (addClothes.length < 6) {
      state = state.copyWith(isAddClothes: false);
    }
    state = state.copyWith(closet: closet, isLoading: false);
  }

  Future<void> changeCategory({required String category}) async {
    final List<Clothes> closet = await _read(clothesRepositoryProvider)
        .fetchCloset(isSell: state.isSell, userId: _userId, category: category);
    state = state.copyWith(closet: closet, category: category);
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
