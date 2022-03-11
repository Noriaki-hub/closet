import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/models/clothes_for_public.dart';
import 'package:closet_app_xxx/repositories/clothes_view_page_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../global/user_controller.dart';

part 'clothes_view_page_controller.freezed.dart';

@freezed
class ClothesViewPageState with _$ClothesViewPageState {
  const ClothesViewPageState._();

  const factory ClothesViewPageState({
    @Default(ClothesForPublic()) ClothesForPublic clothesForPublic,
    @Default(false) bool isFavoriteState

  }) = _ClothesViewPageState;

}




class ClothesViewPageProviderArg {
  ClothesViewPageProviderArg({required this.userId, required this.clothes});
  final String? userId;
  final Clothes clothes;
}

final ClothesViewPageProvider =
StateNotifierProvider.autoDispose<ClothesViewPageController, ClothesViewPageState>(
        (ref) {
      return throw UnimplementedError();
    });

final ClothesViewPageProviderFamily = StateNotifierProvider.family.autoDispose<
    ClothesViewPageController,
    ClothesViewPageState,
    ClothesViewPageProviderArg>((ref, arg) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return ClothesViewPageController(
    ref.read,
    clothes: arg.clothes,
    userId: arg.userId ?? user.uid,
  );
});


class ClothesViewPageController extends StateNotifier<ClothesViewPageState> {
  ClothesViewPageController(this._read, {required String userId, required Clothes clothes})
      : _userId = userId, _clothes = clothes, super(ClothesViewPageState()){
    fetchClothes();
  }

  final Reader _read;
  final String _userId;
  final Clothes _clothes;


  Future<void> fetchClothes() async {
    final clothesForPublic = ClothesForPublic(
      itemId: _clothes.itemId,
      brands: _clothes.brands,
      price: _clothes.price,
      category: _clothes.category,
      imageURL: _clothes.imageURL,
      selling: _clothes.selling,
      description: _clothes.description,
      day: _clothes.day,
      month: _clothes.month,
      year: _clothes.year,
      sellingDay: _clothes.sellingDay,
      sellingMonth: _clothes.sellingMonth,
      sellingYear: _clothes.sellingYear,
      isSell: _clothes.isSell,
      isFavorite: _clothes.isFavorite,
      uid: _clothes.uid
    );

    state = state.copyWith(clothesForPublic: clothesForPublic, isFavoriteState: _clothes.isFavorite);

  }

  Future<void> changeFavoriteStateTrue() async {
   await _read(clothesViewPageRepositoryProvider).updateFavoriteTrue(userId: _userId, itemId: _clothes.itemId);

    state = state.copyWith(isFavoriteState: true);
  }

  Future<void> changeFavoriteStateFalse() async {
    await _read(clothesViewPageRepositoryProvider).updateFavoriteFalse(userId: _userId, itemId: _clothes.itemId);
    state = state.copyWith(isFavoriteState: false);
  }
}
