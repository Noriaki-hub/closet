import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/conponent/like_button_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/like.dart';
import '../global/user_controller.dart';

part 'like_button_controller.freezed.dart';

@freezed
class LikeButtonState with _$LikeButtonState {
  const LikeButtonState._();

  const factory LikeButtonState({
    @Default(<UserModel>[]) List<UserModel> likes,
    @Default(<Like>[]) List<Like> myLikeState,
    @Default(false) bool MyAccountState
  }) = _LikeButtonState;

}


class LikeButtonProviderArg {
  LikeButtonProviderArg({required this.itemId});
  final String itemId;
}

final LikeButtonProvider =
StateNotifierProvider.autoDispose<LikeButtonController, LikeButtonState>(
        (ref) {
      return throw UnimplementedError();
    });

final LikeButtonProviderFamily = StateNotifierProvider.family.autoDispose<
    LikeButtonController,
    LikeButtonState,
    LikeButtonProviderArg>((ref, arg) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return LikeButtonController(
    ref.read,
    user.uid,
    arg.itemId,
  );
});

class LikeButtonController extends StateNotifier<LikeButtonState> {
  final Reader _read;
  final String _myId;
  final String _itemId;


  LikeButtonController(this._read, this._myId, this._itemId) : super(LikeButtonState()){
    fetchLikes();
  }
  Future<void> fetchLikes()async {
    final likes = await _read(likeButtonRepositoryProvider).fetch(myId: _myId,  itemId: _itemId);
    final myLikeState = await _read(likeButtonRepositoryProvider).fetchMyState(myId: _myId,  itemId: _itemId);
    state = state.copyWith(
        likes: likes,
        myLikeState: myLikeState,
    );
  }

  Future<void> addLike()async {
    await _read(likeButtonRepositoryProvider)
        .add(itemId: _itemId, myId: _myId);
    fetchLikes();
  }

  Future<void> deleteLike()async {
    await _read(likeButtonRepositoryProvider)
        .delete(myId: _myId, itemId: _itemId);
    fetchLikes();

  }
}