
import 'package:closet_app_xxx/repositories/global/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/user.dart';

part 'user_controller.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(UserModel()) UserModel user,
  }) = _UserState;
}

final userProvider =
StateNotifierProvider<UserController, UserState>((ref) => UserController(ref.read));

class UserController extends StateNotifier<UserState> {
  final Reader _read;
  UserController(this._read) : super(const UserState()) {
   fetchCurrentUser();
  }

  Future<void> fetchCurrentUser() async{
    final user = await _read(userRepositoryProvider).fetchCurrentUser();
    state = state.copyWith(user: user);
  }

  Future<void> login() async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    state = state.copyWith();
  }

  Future<void> register() async{
    final user = await _read(userRepositoryProvider).fetchCurrentUser();
    state = state.copyWith(user: user);
  }


}