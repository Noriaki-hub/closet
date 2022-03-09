
import 'package:closet_app_xxx/models/libs/Firebase_providers.dart';
import 'package:closet_app_xxx/repositories/global/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<void> signInWithGoogle() async {
    final _auth = _read(firebaseAuthProvider);


    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();


    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;


    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential);




  }

  Future<void> register() async{
    final _auth = _read(firebaseAuthProvider);
    final _currentUser = await _auth.currentUser!;
    final user = UserModel(
      email: _currentUser.email!,
      name: _currentUser.displayName!,
      image: _currentUser.photoURL!,
      uid: _currentUser.uid,
      id: '',

    );

    await _read(userRepositoryProvider).register(user: user);

    state = state.copyWith(user: user);
  }

  Future<void> logout() async{
    final _auth = _read(firebaseAuthProvider);

    await _auth.signOut();

    final user = UserModel();

    state = state.copyWith(user: user);
  }
}