import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repositories/follower_page_repository.dart';

part 'follower_page_controller.freezed.dart';

@freezed
class FollowerPageState with _$FollowerPageState {
  const FollowerPageState._();

  const factory FollowerPageState({
    @Default(<UserModel>[]) List<UserModel> followers
  }) = _FollowerPageState;

}

class FollowerPageProviderArg {
  FollowerPageProviderArg({required this.userId});
  final String? userId;
}

final FollowerPageProvider =
StateNotifierProvider.autoDispose<FollowerPageController, FollowerPageState>(
        (ref) {
      return throw UnimplementedError();
    });

final FollowerPageProviderFamily = StateNotifierProvider.family.autoDispose<
    FollowerPageController,
    FollowerPageState,
    FollowerPageProviderArg>((ref, arg) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return FollowerPageController(ref.read,
    userId: arg.userId ?? user.uid,
  );
});

class FollowerPageController extends StateNotifier<FollowerPageState> {
  FollowerPageController(this._read, {required String userId, })  : _userId = userId, super(const FollowerPageState()) {
    _init();
  }
  final String _userId;
  final Reader _read;

  Future<void> _init() async {
    fetchUserFollowers();
  }

  Future<void> fetchUserFollowers() async {
    final List<UserModel> followers =
    await _read(followerRepositoryProvider).fetch(userId: _userId);
    state = state.copyWith(followers: followers);
  }
}
