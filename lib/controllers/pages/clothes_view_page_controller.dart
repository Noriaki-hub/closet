import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/models/clothes_for_public.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../repositories/clothes_repository.dart';
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
      :  _clothes = clothes, super(ClothesViewPageState()){
    fetchClothes();
  }

  final Reader _read;
  final Clothes _clothes;


  Future<void> fetchClothes() async {
    final clothes = await _read(clothesRepositoryProvider).fetchClothes(itemId: _clothes.itemId);

    state = state.copyWith(clothesForPublic: clothes == null ? ClothesForPublic():
        clothes, isFavoriteState: _clothes.isFavorite);

  }

  Future<void> changeFavoriteStateTrue() async {
   await _read(clothesRepositoryProvider).updateFavoriteTrue( itemId: _clothes.itemId);

    state = state.copyWith(isFavoriteState: true);
  }

  Future<void> changeFavoriteStateFalse() async {
    await _read(clothesRepositoryProvider).updateFavoriteFalse(itemId: _clothes.itemId);
    state = state.copyWith(isFavoriteState: false);
  }

  Future<void> deleteClothes() async {
    await _read(clothesRepositoryProvider).delete(itemId: _clothes.itemId);
  }


}
