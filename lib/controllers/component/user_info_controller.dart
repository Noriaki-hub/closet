import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/component/user_info_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_controller.freezed.dart';

@freezed
class UserInfoState with _$UserInfoState {
  const UserInfoState._();

  const factory UserInfoState({
    @Default(UserModel()) UserModel user,
  }) = _UserInfoState;
}

class UserInfoProviderArg {
  UserInfoProviderArg({required this.userId});
  final String userId;
}

final UserInfoProvider =
    StateNotifierProvider.autoDispose<UserInfoController, UserInfoState>((ref) {
  return throw UnimplementedError();
});

final UserInfoProviderFamily = StateNotifierProvider.family
    .autoDispose<UserInfoController, UserInfoState, UserInfoProviderArg>(
        (ref, arg) {
  return UserInfoController(ref.read, arg.userId);
});

class UserInfoController extends StateNotifier<UserInfoState> {
  final Reader _read;
  final String _userId;

  UserInfoController(this._read, this._userId) : super(UserInfoState()) {
    fetchUser();
  }
  Future<void> fetchUser() async {
    final user = await _read(userInfoRepositoryProvider).fetch(userId: _userId);
    state = state.copyWith(user: user);
  }
}
