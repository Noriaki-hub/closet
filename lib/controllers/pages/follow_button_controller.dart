import 'package:closet_app_xxx/repositories/follow_button_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/follow.dart';
import '../../models/user.dart';
import '../global/user_controller.dart';

part 'follow_button_controller.freezed.dart';

@freezed
class FollowButtonState with _$FollowButtonState {
  const FollowButtonState._();

  const factory FollowButtonState({
    @Default(<Follow>[]) List<Follow> MyFollowState,
    @Default(<Follow>[]) List<Follow> YourFollowerState,
    @Default(false) bool MyAccountState
  }) = _FollowButtonState;

}


class FollowButtonProviderArg {
  FollowButtonProviderArg({required this.userId});
  final String userId;
}

final FollowButtonProvider =
StateNotifierProvider.autoDispose<FollowButtonController, FollowButtonState>(
        (ref) {
      return throw UnimplementedError();
    });

final FollowButtonProviderFamily = StateNotifierProvider.family.autoDispose<
    FollowButtonController,
    FollowButtonState,
    FollowButtonProviderArg>((ref, arg) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return FollowButtonController(
    ref.read,
   user.uid,
   arg.userId,
  );
});

class FollowButtonController extends StateNotifier<FollowButtonState> {
  final Reader _read;
  final String myId;
  final String yourId;


  FollowButtonController(this._read, this.myId, this.yourId) : super(FollowButtonState()){
    fetchFollowState();
  }
  Future<void> fetchFollowState()async {
    final MyFollowState = await _read(followButtonRepositoryProvider)
        .fetchMyFollow(myId: myId, yourId: yourId);
    final YourFollowerState = await _read(followButtonRepositoryProvider)
        .fetchYourFollower(myId: myId, yourId: yourId);
    state = state.copyWith(
        MyFollowState: MyFollowState,
        YourFollowerState: YourFollowerState,
        MyAccountState: myId == yourId ? true : false
    );
  }

  Future<void> addFollowState()async {
    await _read(followButtonRepositoryProvider)
        .add(myId: myId, yourId: yourId);
    fetchFollowState();
  }

  Future<void> deleteFollowState()async {
    await _read(followButtonRepositoryProvider)
        .delete(myId: myId, yourId: yourId,);
    fetchFollowState();
  }
}