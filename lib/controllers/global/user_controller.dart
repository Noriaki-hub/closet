
import 'package:closet_app_xxx/models/libs/Firebase_providers.dart';
import 'package:closet_app_xxx/repositories/global/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../models/user.dart';

part 'user_controller.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(UserModel(uid: ''))UserModel user,
    @Default(false) bool isFirstLogin,
    @Default(false) bool isCurrentState
  }) = _UserState;
}

final userProvider =
StateNotifierProvider<UserController, UserState>((ref) => UserController(ref.read));

class UserController extends StateNotifier<UserState> {
  final Reader _read;

  UserController(this._read) : super(const UserState()) {
    fetchCurrentUser();
  }

  Future<void> fetchCurrentUser() async {
    final user = await _read(userRepositoryProvider).fetchCurrentUser();
    if(user == null){
      state = state.copyWith(isCurrentState: false);
    }else{
    state = state.copyWith(user: user,
    isCurrentState: true);
    }
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

    final result = await _auth.signInWithCredential(credential);

    final isFirstLogin = await result.additionalUserInfo?.isNewUser;

    if (isFirstLogin!) {
      await register();
      state = state.copyWith(isFirstLogin: true);
    }

    fetchCurrentUser();
  }



  Future<void> signInWithApple() async {
    final _auth = _read(firebaseAuthProvider);

    final appleUser = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ]);

    final oAuthProvider = OAuthProvider('apple.com');
    final credential = oAuthProvider.credential(
      idToken: appleUser.identityToken,
      accessToken: appleUser.authorizationCode,
    );

    final result = await _auth.signInWithCredential(credential);

    final isFirstLogin =  await result.additionalUserInfo?.isNewUser;

    if(isFirstLogin!) {
      final _currentUser = await _auth.currentUser!;
      final emailSplit = _currentUser.email?.split('@');
      final user = UserModel(
        email: _currentUser.email!,
        name: appleUser.givenName ?? 'unknown',
        image: 'https://firebasestorage.googleapis.com/v0/b/clothes-app-3c8e3.appspot.com/o/human.png?alt=media&token=9a69b844-9cf2-4375-ad7a-8a175457cfac',
        uid: _currentUser.uid,
        id: emailSplit![0],
      );
      await _read(userRepositoryProvider).register(user: user);
      state = state.copyWith(isFirstLogin: true);
    }


    fetchCurrentUser();
  }



  Future<void> register() async {
    final _auth = await _read(firebaseAuthProvider);
    final _currentUser = await _auth.currentUser!;
    final emailSplit = _currentUser.email?.split('@');


    final user = UserModel(
      email: _currentUser.email!,
      name: _currentUser.displayName!,
      image: _currentUser.photoURL!,
      uid: _currentUser.uid,
      id: emailSplit![0],
    );

    await _read(userRepositoryProvider).register(user: user);
  }

  Future<void> logout() async {
    final _auth = _read(firebaseAuthProvider);

    await _auth.signOut();

  }

  Future<void> changeIsFirstLogin() async {
    state = state.copyWith(isFirstLogin: false);
}
}