
import 'package:closet_app_xxx/models/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import '../../models/shop.dart';
import '../../repositories/shop_page_repository.dart';
import '../global/user_controller.dart';

part 'shop_add_page_controller.freezed.dart';

@freezed
class ShopAddPageState with _$ShopAddPageState {
  const ShopAddPageState._();

  const factory ShopAddPageState({
    File? imageFile,
    @Default('') String name,
    @Default('') String url,
    @Default('') String image,

  }) = _ShopAddPageState;
}


final ShopAddPageProvider =
StateNotifierProvider.autoDispose<ShopAddPageController, ShopAddPageState>(
        (ref) {
      final user = ref.watch(userProvider.select((value) => value.user));
      return ShopAddPageController(ref.read, user: user,  );
    });


class ShopAddPageController extends StateNotifier<ShopAddPageState> {
  ShopAddPageController(this._read, {required UserModel user})
      : user = user, super(ShopAddPageState());

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


  Future<void> addShop() async {
    final shop = Shop(
        image: state.image,
        url: state.url,
        name: state.name
    );
    await _read(shopRepositoryProvider).add(shop: shop, userId: user.uid);
  }
}





