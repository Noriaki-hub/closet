import 'package:closet_app_xxx/Screen/datePicker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import '../../auth/current/current_controller.dart';
import '../models/buy_model.dart';

final BuyItemsProvider =
StateNotifierProvider.autoDispose<BuyItemsController, Buy>(
        (ref) {
      return BuyItemsController(ref.read);
    });

class BuyItemsController extends StateNotifier<Buy> {
  BuyItemsController(this._read) : super(const Buy());

  PickDate date = PickDate();
  final Reader _read;


  Future<void> imageFile(XFile? imageFile) async {
    if(imageFile == null){return;}

    state = state.copyWith(imageFile: File(imageFile.path));
  }


  Future<void> category(String category) async {

    state = state.copyWith(category: category);
  }

  Future<void> brands(String brands) async {

    state = state.copyWith(brands: brands);
  }

  Future<void> description(String description) async {

    state = state.copyWith(description: description);
  }

  Future<void> price(String price) async {

    state = state.copyWith(price: price);
  }


  Future<void> day(String day) async {


    state = state.copyWith(day: date.dayNowPicker());
  }

  Future<void> month(String month) async {

    state = state.copyWith(month: date.monthNowPicker());
  }

  Future<void> year(String year) async {

    state = state.copyWith(year: date.yearNowPicker());
  }

  Future<void> imageURL() async {

    state = state.copyWith(imageURL: await _uploadImageFile(state.brands, state.imageFile));
  }

  Future<String> _uploadImageFile(brands,imageFile) async {

    final Uuid uuid = const Uuid();

    final userEmail = _read(currentUserProvider).email;
    final storage = FirebaseStorage.instance;
    TaskSnapshot snapshot = await storage
        .ref()
        .child("userinfo/$userEmail/$brands${uuid.v4()}")
        .putFile(imageFile);
    final String downloadUrl =
    await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

}

