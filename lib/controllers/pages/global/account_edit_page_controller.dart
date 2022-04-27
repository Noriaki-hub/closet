import 'dart:io';
import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/global/user_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

part 'account_edit_page_controller.freezed.dart';

@freezed
class AccountEditPageState with _$AccountEditPageState {
  const AccountEditPageState._();

  const factory AccountEditPageState(
      {File? imageFile,
      UserModel? currentUser,
      String? currentInstaUserName,
      String? currentIntro,
      @Default('') String image,
      @Default('') String id,
      @Default('') String name,
      @Default('') String instaUerName,
      @Default('') String intro,
      @Default(false) bool isEdit}) = _AccountEditPageState;
}

final accountEditPageProvider = StateNotifierProvider.autoDispose<
    AccountEditPageController, AccountEditPageState>((ref) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return AccountEditPageController(ref.read, user: user);
});

class AccountEditPageController extends StateNotifier<AccountEditPageState> {
  AccountEditPageController(this._read, {required UserModel user})
      : _user = user,
        super(AccountEditPageState()) {
    _init();
  }

  final Reader _read;
  final UserModel _user;

  Future<void> _init() async {
    final instaUserName =
        await _read(userRepositoryProvider).fetchInsta(userId: _user.uid);
    final intro =
        await _read(userRepositoryProvider).fetchIntro(userId: _user.uid);
    state = state.copyWith(
        currentInstaUserName: instaUserName, currentUser: _user, currentIntro: intro);
  }

  Future<void> imageFile(XFile? imageFile) async {
    if (imageFile == null) {
      return;
    }
    state = state.copyWith(imageFile: File(imageFile.path));
    state = state.copyWith(
        image: await _uploadImageFile(state.imageFile), isEdit: true);
  }

  Future<void> name({required String name}) async {
    state = state.copyWith(name: name, isEdit: true);
  }

  Future<void> id({required String id}) async {
    state = state.copyWith(id: id, isEdit: true);
  }

  Future<void> instaUserName({required String instaUerName}) async {
    state = state.copyWith(instaUerName: instaUerName, isEdit: true);
  }

  Future<void> intro({required String intro}) async {
    state = state.copyWith(intro: intro, isEdit: true);
  }

  Future<String> _uploadImageFile(imageFile) async {
    final Uuid uuid = const Uuid();
    final userEmail = _user.email;

    final storage = FirebaseStorage.instance;
    TaskSnapshot snapshot = await storage
        .ref()
        .child("userinfo/$userEmail/${uuid.v4()}")
        .putFile(imageFile);
    final String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> updateUser() async {
    final user = UserModel(
        image: state.image == '' ? _user.image : state.image,
        name: state.name == '' ? _user.name : state.name,
        id: state.id == '' ? _user.id : state.id,
        uid: _user.uid);

    await _read(userRepositoryProvider).update(user: user);

    if (state.instaUerName != '') {
      await _read(userRepositoryProvider)
          .addInsta(userId: user.uid, userName: state.instaUerName);
    }
    if (state.intro != '') {
      await _read(userRepositoryProvider)
          .addIntro(userId: user.uid, intro: state.intro);
    }
  }
}
