import 'package:closet_app_xxx/controllers/global/date_now_controller.dart';
import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/controllers/pages/buy_page_controller.dart';
import 'package:closet_app_xxx/models/clothes_create.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/clothes.dart';
import '../../repositories/home_page_repository.dart';

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
    @Default('') String accountImage
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
    accountImage: user.image,
  );
});

class HomePageController extends StateNotifier<HomePageState> {
  HomePageController(this._read, {required String userId, required String accountImage})  : _userId = userId, _accountImage = accountImage, super(const HomePageState()) {
    _init();
  }
  final String _userId;
  final Reader _read;
  final String _accountImage;

  Future<void> _init() async {
    fetchHomePageData();
  }

  Future<void> fetchHomePageData() async {
    final date = _read(DateNowProvider);

    final List<Clothes> closet = await _read(homeRepositoryProvider).fetchClosetAll(isSell: state.isSell, userId: _userId, category: state.category);
    final List<Clothes> closetFavorite = await _read(homeRepositoryProvider).fetchFavorite(isSell: state.isSell, userId: _userId, );
    final buying  = await _read(homeRepositoryProvider).fetchThisMonthBuying(userId: _userId, date: date);
    final selling  = await _read(homeRepositoryProvider).fetchThisMonthSelling(userId: _userId, date: date);
    state = state.copyWith(
        closet: closet,
        closetFavorite: closetFavorite,
        buying: buying,
        selling: selling,
        year: date.year,
        month: date.month,
        accountImage: _accountImage
    );
  }


  Future<void> changeCategory({required String category}) async {
    final List<Clothes> closet = await _read(homeRepositoryProvider).fetchClosetAll(isSell: state.isSell, userId: _userId, category: category);
    state = state.copyWith( closet: closet);
  }

  Future<void> isSellTrue() async {
    state = state.copyWith(isSell: true);
    fetchHomePageData();
  }

  Future<void> isSellFalse() async {
    state = state.copyWith(isSell: false);
    fetchHomePageData();
  }


  // Future<void> addCloset() async {
  //   final buyState = _read(BuyPageProvider);
  //
  //     final clothes = ClothesCreate(
  //       description: buyState.description,
  //       price: buyState.price,
  //       brands: buyState.brands,
  //       category: buyState.category,
  //       imageURL: buyState.imageURL,
  //       day: buyState.day,
  //       month: buyState.month,
  //       year: buyState.year,
  //     );
  //     state = state.copyWith(closet: state.closet..add(clothes));
  // }
}

