
import 'package:closet_app_xxx/models/media.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';

import '../../models/user.dart';
import '../../repositories/media_page_repository.dart';
import '../global/user_controller.dart';

part 'media_add_page_controller.freezed.dart';

@freezed
class MediaAddPageState with _$MediaAddPageState {
  const MediaAddPageState._();

  const factory MediaAddPageState({
    File? imageFile,
    @Default('') String name,
    @Default('') String url,
    @Default('') String image,

  }) = _MediaAddPageState;
}


final MediaAddPageProvider =
StateNotifierProvider.autoDispose<MediaAddPageController, MediaAddPageState>(
        (ref) {
      final user = ref.watch(userProvider.select((value) => value.user));
      return MediaAddPageController(ref.read, user: user,  );
    });


class MediaAddPageController extends StateNotifier<MediaAddPageState> {
  MediaAddPageController(this._read, {required UserModel user} )
      : user = user, super(MediaAddPageState());

  final Reader _read;
  final UserModel user;


  Future<void> imageFile(XFile? imageFile) async {
    if (imageFile == null) {
      return;
    }
    state = await state.copyWith(imageFile: File(imageFile.path));
    state = state.copyWith(
        image: await _uploadImageFile( state.imageFile));
  }


  Future<void> name({required String name}) async {
    state = state.copyWith(name: name);
  }

  Future<void> url({required String url}) async {
    state = state.copyWith(url: url);
  }



  Future<String> _uploadImageFile(imageFile) async {
    final Uuid uuid = const Uuid();
    final userEmail = user.email;

    final storage = FirebaseStorage.instance;
    TaskSnapshot snapshot = await storage
        .ref()
        .child("userinfo/$userEmail/${uuid.v4()}")
        .putFile(imageFile);
    final String downloadUrl =
    await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }


  Future<void> addMedia() async {
    final media = Media(
        image: state.image,
        url: state.url,
        name: state.name
    );
    await _read(mediaRepositoryProvider).add(media: media, userId: user.uid);
  }
}

