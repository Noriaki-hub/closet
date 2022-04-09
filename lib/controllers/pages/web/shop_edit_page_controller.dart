import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/shop.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/shop_page_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';

part 'shop_edit_page_controller.freezed.dart';

@freezed
class ShopEditPageState with _$ShopEditPageState {
  const ShopEditPageState._();

  const factory ShopEditPageState({
    File? imageFile,
    @Default('') String image,
    @Default('') String url,
    @Default('') String name,
  }) = _ShopEditPageState;
}

final shopEditPageProvider = StateNotifierProvider.autoDispose<
    ShopEditPageController, ShopEditPageState>((ref) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return ShopEditPageController(ref.read, user: user);
});

class ShopEditPageController extends StateNotifier<ShopEditPageState> {
  ShopEditPageController(this._read, {required UserModel user})
      : user = user,
        super(ShopEditPageState());

  final Reader _read;
  final UserModel user;

  Future<void> imageFile(XFile? imageFile) async {
    if (imageFile == null) {
      return;
    }
    state = await state.copyWith(imageFile: File(imageFile.path));
    state = state.copyWith(image: await _uploadImageFile(state.imageFile));
  }

  Future<void> name({required String name}) async {
    state = state.copyWith(name: name);
  }

  Future<void> url({required String url}) async {
    state = state.copyWith(name: url);
  }

  Future<String> _uploadImageFile(imageFile) async {
    final Uuid uuid = const Uuid();
    final userEmail = user.email;

    final storage = FirebaseStorage.instance;
    TaskSnapshot snapshot = await storage
        .ref()
        .child("userinfo/$userEmail/${uuid.v4()}")
        .putFile(imageFile);
    final String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> updateShop({required Shop shop}) async {
    final _shop = Shop(
        itemId: shop.itemId,
        image: state.imageFile != null ? state.image : shop.image,
        name: state.name != '' ? state.name : shop.name,
        url: state.url != '' ? state.url : shop.url);

    await _read(shopRepositoryProvider).update(shop: _shop, userId: user.uid);
  }
}
