import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/brand.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/brand_repository.dart';
import 'package:closet_app_xxx/repositories/follow_page_repository.dart';
import 'package:closet_app_xxx/repositories/global/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_brand_page_controller.freezed.dart';

@freezed
class FollowBrandPageState with _$FollowBrandPageState {
  const FollowBrandPageState._();

  const factory FollowBrandPageState(
      {@Default(<Brand>[]) List<Brand> follows,
      @Default(false) bool isLoading}) = _FollowBrandPageState;
}

class FollowBrandPageProviderArg {
  FollowBrandPageProviderArg({required this.userId});
  final String? userId;
}

final followBrandPageProvider = StateNotifierProvider.autoDispose<
    FollowBrandPageController, FollowBrandPageState>((ref) {
  return throw UnimplementedError();
});

final followBrandPageProviderFamily = StateNotifierProvider.family.autoDispose<
    FollowBrandPageController,
    FollowBrandPageState,
    FollowBrandPageProviderArg>((ref, arg) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return FollowBrandPageController(
    ref.read,
    userId: arg.userId ?? user.uid,
  );
});

class FollowBrandPageController extends StateNotifier<FollowBrandPageState> {
  FollowBrandPageController(
    this._read, {
    required String userId,
  })  : _userId = userId,
        super(const FollowBrandPageState()) {
    _init();
  }
  final String _userId;
  final Reader _read;

  Future<void> _init() async {
    fetchFollows();
  }

  Future<void> fetchFollows() async {
    state = state.copyWith(isLoading: true);
    List<Brand> follows = [];
    final brandIdList =
        await _read(userRepositoryProvider).fetchBrandIdList(userId: _userId);
        
    for (var brandId in brandIdList) {
      final brand = await _read(brandRepositoryProvider).fetchBrand(brandId: brandId);
      if(brand != null){
        follows.add(brand);
      }
    }

    state = state.copyWith(follows: follows, isLoading: false);
  }
}
