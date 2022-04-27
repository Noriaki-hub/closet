import 'package:closet_app_xxx/controllers/global/date_now_controller.dart';
import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/brand.dart';
import 'package:closet_app_xxx/models/buy.dart';
import 'package:closet_app_xxx/models/date.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/repositories/clothes_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'package:intl/intl.dart';


part 'buy_page_controller.freezed.dart';

@freezed
class BuyPageState with _$BuyPageState {
  const BuyPageState._();

  const factory BuyPageState({
    DateTime? selectedDate,
    File? imageFile,
    @Default(<Brand>[]) List<Brand> brandList,
    @Default('')String description,
    @Default(Brand()) Brand selectedBrand,
    @Default('')String category,
    @Default('')String price,
    @Default('')String day,
    @Default('')String month,
    @Default('')String year,
    @Default('')String imageURL,
    @Default('')String buyingForm
  }) = _BuyPageState;

}



final buyPageProvider =
StateNotifierProvider.autoDispose<BuyPageController, BuyPageState>(
        (ref) {
          final user = ref.watch(userProvider.select((value) => value.user));
          final date = ref.watch(dateNowProvider);
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
    state = state.copyWith(imageFile: File(imageFile.path));
    state = state.copyWith(
        imageURL: await _uploadImageFile(state.imageFile));
  }


  Future<void> category({required String category}) async {
    state = state.copyWith(category: category);
  }

  Future<void> brands({required Brand selectedBrand}) async {
    state = state.copyWith(selectedBrand: selectedBrand);
  }

  Future<void> description(String description) async {
    state = state.copyWith(description: description);
  }

  Future<void> price({required String price}) async {
    state = state.copyWith(price: price);
  }

  Future<void> buyingForm({required String buyingForm}) async {
    state = state.copyWith(buyingForm: buyingForm);
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



  Future<String> _uploadImageFile(imageFile) async {
    final Uuid uuid = const Uuid();

    final userEmail = _user.email;
    final storage = FirebaseStorage.instance;
    TaskSnapshot snapshot = await storage
        .ref()
        .child("userinfo/$userEmail/${uuid.v4()}")
        .putFile(imageFile);
    final String downloadUrl =
    await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }


  Future<void> addCloset() async {
    final clothes = Buy(
      brandId: state.selectedBrand.brandId,
      category: state.category,
      description: state.description,
      price: int.parse(state.price),
      day: state.day,
      month: state.month,
      year: state.year,
      imageURL: state.imageURL,
      createdBuy: state.selectedDate!,
      uid: _user.uid,
      buyingForm: state.buyingForm
    );
    await _read(clothesRepositoryProvider).add(clothes: clothes, user: _user);
  }


}
