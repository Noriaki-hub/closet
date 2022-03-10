import 'package:closet_app_xxx/controllers/global/date_now_controller.dart';
import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/buy_page_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import '../../models/buy.dart';
import '../../models/date.dart';


part 'buy_page_controller.freezed.dart';

@freezed
class BuyPageState with _$BuyPageState {
  const BuyPageState._();

  const factory BuyPageState({
    DateTime? selectedDate,
    File? imageFile,
    @Default('')String description,
    @Default('No brand')String brands,
    @Default('')String category,
    @Default('')String price,
    @Default('')String day,
    @Default('')String month,
    @Default('')String year,
    @Default('')String imageURL,
  }) = _BuyPageState;

}



final BuyPageProvider =
StateNotifierProvider.autoDispose<BuyPageController, BuyPageState>(
        (ref) {
          final user = ref.watch(userProvider.select((value) => value.user));
          final date = ref.watch(DateNowProvider);
      return BuyPageController(ref.read, user, date);
    });


class BuyPageController extends StateNotifier<BuyPageState> {
  BuyPageController(this._read, this._user, this.date)
      : super(BuyPageState());

  final Reader _read;
  final UserModel _user;
  final Date date;


  Future<void> imageFile(XFile? imageFile) async {
    if (imageFile == null) {
      return;
    }
    state = await state.copyWith(imageFile: File(imageFile.path));
    state = state.copyWith(
        imageURL: await _uploadImageFile(state.brands, state.imageFile));
  }


  Future<void> category({required String category}) async {
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


  Future<void> selectDate({required DateTime selectedDate}) async {
    DateFormat yearFormat = DateFormat('yyyy');
    DateFormat monthFormat = DateFormat('MM');
    DateFormat dayFormat = DateFormat('dd');

    state = state.copyWith(selectedDate: selectedDate);

    state = state.copyWith(year: yearFormat.format(selectedDate));

    state = state.copyWith(month: monthFormat.format(selectedDate));

    state = state.copyWith(day: dayFormat.format(selectedDate));
  }



  Future<String> _uploadImageFile(brands, imageFile) async {
    final Uuid uuid = const Uuid();

    final userEmail = _user.email;
    final storage = FirebaseStorage.instance;
    TaskSnapshot snapshot = await storage
        .ref()
        .child("userinfo/$userEmail/$brands${uuid.v4()}")
        .putFile(imageFile);
    final String downloadUrl =
    await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }


  Future<void> addCloset() async {
    final clothes = Buy(
      brands: state.brands,
      category: state.category,
      description: state.description,
      price: state.price,
      day: state.day,
      month: state.month,
      year: state.year,
      imageURL: state.imageURL,
      createdBuy: state.selectedDate!,
      uid: _user.uid,
      userName: _user.name,
      userImage: _user.image
    );
    await _read(buyRepositoryProvider).add(clothes: clothes, user: _user);
  }


}
