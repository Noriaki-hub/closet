import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/brand_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_view_page_controller.freezed.dart';

@freezed
class BrandViewPageState with _$BrandViewPageState {
  const BrandViewPageState._();

  const factory BrandViewPageState(
      {@Default(false) bool isMyFollow,
      @Default(false) bool isLoading,
      @Default(<Clothes>[]) List<Clothes> clothesList,
      @Default(false) bool isLoadingForFollowState}) = _BrandViewPageState;
}

class BrandViewPageProviderArg {
  BrandViewPageProviderArg({required this.brandId});

  final int brandId;
}

final brandViewPageProvider = StateNotifierProvider.autoDispose<
    BrandViewPageController, BrandViewPageState>((ref) {
  return throw UnimplementedError();
});

final brandViewPageProviderFamily = StateNotifierProvider.family.autoDispose<
    BrandViewPageController,
    BrandViewPageState,
    BrandViewPageProviderArg>((ref, arg) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return BrandViewPageController(ref.read, user: user, brandId: arg.brandId);
});

class BrandViewPageController extends StateNotifier<BrandViewPageState> {
  BrandViewPageController(this._read,
      {required UserModel user, required int brandId})
      : _user = user,
        _brandId = brandId,
        super(const BrandViewPageState()) {
    _init();
  }

  final Reader _read;
  final UserModel _user;
  final int _brandId;

  Future<void> _init() async {
    state = state.copyWith(isLoading: true);
    await fetchMyFollowState();
    fetchBrandClothesList();
    state = state.copyWith(isLoading: false);
  }

  Future<void> fetchBrandClothesList() async {
    final clothesList = await _read(brandRepositoryProvider)
        .fetchBrandClothesList(brandId: _brandId, limit: 20);
    state = state.copyWith(clothesList: clothesList);
  }

  Future<void> fetchMyFollowState() async {
    isLoadingForFollowStateTrue();
    final isMyFollow = await _read(brandRepositoryProvider)
        .fetchMyFollow(myId: _user.uid, brandId: _brandId.toString());
    state = state.copyWith(isMyFollow: isMyFollow);
    isLoadingForFollowStateFalse();
  }

  Future<void> addFollower() async {
    isLoadingForFollowStateTrue();
    await _read(brandRepositoryProvider)
        .addFollower(myId: _user.uid, brandId: _brandId.toString());
    fetchMyFollowState();
    isLoadingForFollowStateFalse();
  }

  Future<void> deleteFollower() async {
    isLoadingForFollowStateTrue();
    await _read(brandRepositoryProvider)
        .deleteFollower(myId: _user.uid, brandId: _brandId.toString());
    fetchMyFollowState();
    isLoadingForFollowStateFalse();
  }

  void isLoadingForFollowStateTrue() {
    state = state.copyWith(isLoadingForFollowState: true);
  }

  void isLoadingForFollowStateFalse() {
    state = state.copyWith(isLoadingForFollowState: false);
  }
}
