import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/shop.dart';
import 'package:closet_app_xxx/repositories/shop_page_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_page_controller.freezed.dart';

@freezed
class ShopPageState with _$ShopPageState {
  const ShopPageState._();

  const factory ShopPageState({@Default(<Shop>[]) List<Shop> shops}) =
      _ShopPageState;
}

final shopPageProvider =
    StateNotifierProvider<ShopPageController, ShopPageState>((ref) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return ShopPageController(ref.read, userId: user.uid);
});

class ShopPageController extends StateNotifier<ShopPageState> {
  ShopPageController(
    this._read, {
    required String userId,
  })  : _userId = userId,
        super(const ShopPageState()) {
    _init();
  }
  final String _userId;
  final Reader _read;

  Future<void> _init() async {
    fetchShops();
  }

  Future<void> fetchShops() async {
    final List<Shop> shops =
        await _read(shopRepositoryProvider).fetch(userId: _userId);
    state = state.copyWith(shops: shops);
  }

  Future<void> deleteShop({required Shop shop}) async {
    await _read(shopRepositoryProvider).delete(shop: shop, userId: _userId);
    fetchShops();
  }
}
