
import 'package:closet_app_xxx/repositories/clothes_view_page_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/clothes.dart';
import '../global/user_controller.dart';

part 'clothes_view_page_controller.freezed.dart';

@freezed
class ClothesViewPageState with _$ClothesViewPageState {
  const ClothesViewPageState._();

  const factory ClothesViewPageState({
    @Default(Clothes()) Clothes clothes,

  }) = _ClothesViewPageState;

}




class ClothesViewPageProviderArg {
  ClothesViewPageProviderArg({required this.userId, required this.itemId});
  final String? userId;
  final String itemId;
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
    itemId: arg.itemId,
    userId: arg.userId ?? user.uid,
  );
});


class ClothesViewPageController extends StateNotifier<ClothesViewPageState> {
  ClothesViewPageController(this._read, {required String userId, required String itemId})
      : _userId = userId, _itemId = itemId, super(ClothesViewPageState()){
    fetchFavoriteState();
  }

  final Reader _read;
  final String _userId;
  final String _itemId;


  Future<void> fetchFavoriteState() async {
    final clothes = await _read(clothesViewPageRepositoryProvider).fetchFavorite(userId: _userId, itemId: _itemId);
    state = state.copyWith(clothes: clothes);

  }

  Future<void> changeFavoriteStateTrue() async {
   await _read(clothesViewPageRepositoryProvider).updateFavoriteTrue(userId: _userId, itemId: _itemId);
    fetchFavoriteState();
  }

  Future<void> changeFavoriteStateFalse() async {
    await _read(clothesViewPageRepositoryProvider).updateFavoriteFalse(userId: _userId, itemId: _itemId);
    fetchFavoriteState();
  }
}
