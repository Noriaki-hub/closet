import 'package:closet_app_xxx/controllers/global/date_now_controller.dart';
import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/clothes.dart';
import '../../repositories/clothes_repository.dart';

part 'home_page_controller.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const HomePageState._();

  const factory HomePageState({
    @Default(<Clothes>[]) List<Clothes> closet,
    @Default(<Clothes>[]) List<Clothes> closetFavorite,
    @Default('') String buying,
    @Default('') String selling,
    @Default('') String year,
    @Default('') String month,
    @Default(false) bool isSell,
    @Default('ALL') String category,
    @Default(UserModel()) UserModel user
  }) = _HomePageState;

}

class HomePageProviderArg {
  HomePageProviderArg({required this.userId});
  final String? userId;
}

final HomePageProvider =
StateNotifierProvider.autoDispose<HomePageController, HomePageState>(
        (ref) {
      return throw UnimplementedError();
    });

final HomePageProviderFamily = StateNotifierProvider.family.autoDispose<
    HomePageController,
    HomePageState,
    HomePageProviderArg>((ref, arg) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return HomePageController(
    ref.read,
    userId: arg.userId ?? user.uid,
    user: user,
  );
});

class HomePageController extends StateNotifier<HomePageState> {
  HomePageController(this._read,  {required String userId, required UserModel user})  : _userId = userId, _user = user, super(const HomePageState()) {
    _init();
  }
  final String _userId;
  final Reader _read;
  final UserModel _user;

  Future<void> _init() async {
    fetchHomePageData();
  }

  Future<void> fetchHomePageData() async {
    final date = _read(DateNowProvider);

    final List<Clothes> closet = await _read(clothesRepositoryProvider).fetchCloset(isSell: state.isSell, userId: _userId, category: state.category);
    final List<Clothes> closetFavorite = await _read(clothesRepositoryProvider).fetchFavorite(isSell: state.isSell, userId: _userId, );
    final buying  = await _read(clothesRepositoryProvider).fetchBuying(userId: _userId, month: date.month, year: date.year, );
    final selling  = await _read(clothesRepositoryProvider).fetchSelling(userId: _userId, month: date.month, year: date.year, );
    state = state.copyWith(
        closet: closet,
        closetFavorite: closetFavorite,
        buying: buying,
        selling: selling,
        year: date.year,
        month: date.month,
        user: _user
    );
  }


  Future<void> changeCategory({required String category}) async {
    final List<Clothes> closet = await _read(clothesRepositoryProvider).fetchCloset(isSell: state.isSell, userId: _userId, category: category);
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

