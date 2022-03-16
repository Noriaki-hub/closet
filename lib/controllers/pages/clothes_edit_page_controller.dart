import 'package:closet_app_xxx/controllers/global/date_now_controller.dart';
import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/clothes_for_public.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import '../../models/clothes.dart';
import '../../models/date.dart';
import '../../repositories/clothes_repository.dart';


part 'clothes_edit_page_controller.freezed.dart';

@freezed
class ClothesEditPageState with _$ClothesEditPageState {
  const ClothesEditPageState._();

  const factory ClothesEditPageState({
    DateTime? selectedDateForBuy,
    DateTime? selectedDateForSell,
    File? imageFile,
    @Default('')String description,
    @Default('')String brands,
    @Default('')String category,
    @Default('')String price,
    @Default('')String day,
    @Default('')String month,
    @Default('')String year,
    @Default('')String selling,
    @Default('')String sellingDay,
    @Default('')String sellingMonth,
    @Default('')String sellingYear,
    @Default('')String imageURL,

  }) = _ClothesEditPageState;

}



final  ClothesEditPageProvider =
StateNotifierProvider.autoDispose< ClothesEditPageController,  ClothesEditPageState>(
        (ref) {
      final user = ref.watch(userProvider.select((value) => value.user));
      final date = ref.watch(DateNowProvider);
      return ClothesEditPageController(ref.read, user, date);
    });


class  ClothesEditPageController extends StateNotifier< ClothesEditPageState> {
  ClothesEditPageController(this._read, this._user, this.date)
      : super(ClothesEditPageState());

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

  Future<void> brands({required String brands}) async {
    state = state.copyWith(brands: brands);
  }

  Future<void> description({required String description}) async {
    state = state.copyWith(description: description);
  }

  Future<void> price({required String price}) async {
    state = state.copyWith(price: price);
  }


  Future<void> selectDate({required DateTime selectedDate}) async {
    DateFormat yearFormat = DateFormat('yyyy');
    DateFormat monthFormat = DateFormat('MM');
    DateFormat dayFormat = DateFormat('dd');

    state = state.copyWith(selectedDateForBuy: selectedDate);

    state = state.copyWith(year: yearFormat.format(selectedDate));

    state = state.copyWith(month: monthFormat.format(selectedDate));

    state = state.copyWith(day: dayFormat.format(selectedDate));
  }

  Future<void> selling({required String selling}) async {
    state = state.copyWith(selling: selling);
  }

  Future<void> selectSellDate({required DateTime selectedDate}) async {
    DateFormat yearFormat = DateFormat('yyyy');
    DateFormat monthFormat = DateFormat('MM');
    DateFormat dayFormat = DateFormat('dd');

    state = state.copyWith(selectedDateForSell: selectedDate);

    state = state.copyWith(sellingYear: yearFormat.format(selectedDate));

    state = state.copyWith(sellingMonth: monthFormat.format(selectedDate));

    state = state.copyWith(sellingDay: dayFormat.format(selectedDate));
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


  Future<void> updateClothes({required ClothesForPublic clothes}) async {
    final _clothes = ClothesForPublic(
        itemId: clothes.itemId,
        brands: state.brands == '' ? clothes.brands: state.brands,
        description: state.description == '' ? clothes.description: state.description,
        category: state.category == ''? clothes.category: state.category,
        price: state.price == '' ? clothes.price: state.price,
        year: state.year == '' ? clothes.year: state.year,
        day: state.day == '' ? clothes.day: state.day,
        month: state.month == '' ? clothes.month: state.month,
        selling: state.selling == '' ? clothes.selling: state.selling,
        sellingYear: state.selectedDateForSell == null ? clothes.sellingYear: state.sellingYear,
        sellingMonth: state.selectedDateForSell == null ? clothes.sellingMonth: state.sellingMonth,
        sellingDay: state.selectedDateForSell == null ? clothes.sellingDay: state.sellingDay,
    );
    await _read(clothesRepositoryProvider).update(clothes: _clothes);
  }
}
