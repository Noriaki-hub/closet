import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/brand.dart';
import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/brand_repository.dart';
import 'package:closet_app_xxx/repositories/clothes_repository.dart';
import 'package:closet_app_xxx/repositories/global/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clothes_view_page_controller.freezed.dart';

@freezed
class ClothesViewPageState with _$ClothesViewPageState {
  const ClothesViewPageState._();

  const factory ClothesViewPageState({
    Clothes? clothes,
    Brand? brand,
    @Default(<Clothes>[]) List<Clothes> clothesList,
    @Default(UserModel()) UserModel user,
    @Default(false) bool isFavoriteState,
    @Default(false) bool isEdit,
    @Default('') String buyingFormState,
  }) = _ClothesViewPageState;
}

class ClothesViewPageProviderArg {
  ClothesViewPageProviderArg({required this.userId, required this.clothes});
  final String? userId;
  final Clothes clothes;
}

final clothesViewPageProvider = StateNotifierProvider.autoDispose<
    ClothesViewPageController, ClothesViewPageState>((ref) {
  return throw UnimplementedError();
});

final clothesViewPageProviderFamily = StateNotifierProvider.family.autoDispose<
    ClothesViewPageController,
    ClothesViewPageState,
    ClothesViewPageProviderArg>((ref, arg) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return ClothesViewPageController(
    ref.read,
    clothes: arg.clothes,
    userId: arg.userId ?? user.uid,
    user: user,
  );
});

class ClothesViewPageController extends StateNotifier<ClothesViewPageState> {
  ClothesViewPageController(this._read,
      {required String userId, required Clothes clothes, required this.user})
      : _clothes = clothes,
        super(ClothesViewPageState()) {
    fetchClothes();
  }

  final Reader _read;
  final Clothes _clothes;
  final UserModel user;

  Future<void> fetchClothes() async {
    final clothes = await _read(clothesRepositoryProvider)
        .fetchClothes(itemId: _clothes.itemId);

    if (clothes != null) {
      final brand = await _read(brandRepositoryProvider)
          .fetchBrand(brandId: clothes.brandId.toString());

      final clothesList = await _read(clothesRepositoryProvider).fetchCloset(
          userId: clothes.uid, isSell: false, category: 'ALL', limit: 5);

      final user =
          await _read(userRepositoryProvider).fetchUser(userId: clothes.uid);

      state = state.copyWith(
          clothes: clothes,
          isFavoriteState: _clothes.isFavorite,
          brand: brand,
          clothesList: clothesList,
          user: user ?? UserModel());

      if (clothes.buyingForm == 'new') {
        state = state.copyWith(buyingFormState: '新品');
      } else if (clothes.buyingForm == 'used') {
        state = state.copyWith(buyingFormState: '中古');
      } else if (clothes.buyingForm == 'gift') {
        state = state.copyWith(buyingFormState: '貰い物');
      }
    }
  }

  Future<void> changeFavoriteStateTrue() async {
    await _read(clothesRepositoryProvider)
        .updateFavoriteTrue(itemId: _clothes.itemId);

    state = state.copyWith(isFavoriteState: true);
  }

  Future<void> changeFavoriteStateFalse() async {
    await _read(clothesRepositoryProvider)
        .updateFavoriteFalse(itemId: _clothes.itemId);
    state = state.copyWith(isFavoriteState: false);
  }

  Future<void> deleteClothes() async {
    await _read(clothesRepositoryProvider)
        .delete(itemId: _clothes.itemId, user: user);
  }
}
