
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import '../../models/shop.dart';
import '../../repositories/shop_page_repository.dart';
import '../global/user_controller.dart';

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




final ShopEditPageProvider =
StateNotifierProvider.autoDispose<ShopEditPageController, ShopEditPageState>(
        (ref) {
          final userId = ref.watch(userProvider.select((value) => value.user.uid));
      return ShopEditPageController(ref.read, userId: userId);
    });




class ShopEditPageController extends StateNotifier<ShopEditPageState> {
  ShopEditPageController(this._read, {required String userId})
      : _userId = userId, super(ShopEditPageState());

  final Reader _read;
  final String _userId;


  Future<void> imageFile(XFile? imageFile) async {
    if (imageFile == null) {
      return;
    }
    state = await state.copyWith(imageFile: File(imageFile.path));
    state = state.copyWith(
        image: await _uploadImageFile(state.imageFile));
  }

  Future<void> name({required String name})async{
    state = state.copyWith(name: name);
  }

  Future<void> url({required String url})async{
    state = state.copyWith(name: url);
  }

  Future<String> _uploadImageFile(imageFile) async {
    final Uuid uuid = const Uuid();

    final storage = FirebaseStorage.instance;
    TaskSnapshot snapshot = await storage
        .ref()
        .child("userinfo/$_userId/${uuid.v4()}")
        .putFile(imageFile);
    final String downloadUrl =
    await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }


  Future<void> updateShop({required Shop shop}) async {
    final _shop = Shop(
        itemId: shop.itemId,
        image: state.imageFile != null ? state.image: shop.image,
        name: state.name != '' ? state.name: shop.name,
        url: state.url != '' ? state.url: shop.url
    );

    await _read(shopRepositoryProvider).update(shop: _shop, userId: _userId);
  }
}
