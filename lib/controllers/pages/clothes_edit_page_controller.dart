import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import '../../models/clothes.dart';
import '../../repositories/clothes_repository.dart';


part 'clothes_edit_page_controller.freezed.dart';

@freezed
class ClothesEditPageState with _$ClothesEditPageState {
  const ClothesEditPageState._();

  const factory ClothesEditPageState({
    Clothes? clothes,
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
    @Default(false) bool isEdit,

  }) = _ClothesEditPageState;

}


final ClothesEditPageProvider =
StateNotifierProvider.autoDispose<ClothesEditPageController, ClothesEditPageState>(
        (ref) {
          final user = ref.watch(userProvider.select((value) => value.user));
          return ClothesEditPageController(
            ref.read,
            user,
          );
    });


class  ClothesEditPageController extends StateNotifier< ClothesEditPageState> {
  ClothesEditPageController(this._read, this._user,)
      : super(ClothesEditPageState()) {
  }

  final Reader _read;
  final UserModel _user;

  Future<void> fetch({required String itemId})async {
    final clothes = await _read(clothesRepositoryProvider).fetchClothes(itemId: itemId);
    if(clothes != null){
    state = state.copyWith(clothes: clothes);
  }}



  Future<void> imageFile(XFile? imageFile) async {
    if (imageFile == null) {
      return;
    }
    state = await state.copyWith(imageFile: File(imageFile.path));
    state = state.copyWith(
        imageURL: await _uploadImageFile(state.imageFile),
      isEdit: true,
    );
  }

  Future<void> category({required String category}) async {
    state = state.copyWith(category: category,isEdit: true,);
  }

  Future<void> brands({required String brands}) async {
    state = state.copyWith(brands: brands,isEdit: true,);
  }

  Future<void> description({required String description}) async {
    state = state.copyWith(description: description,isEdit: true,);
  }

  Future<void> price({required String price}) async {
    state = state.copyWith(price: price,isEdit: true,);
  }


  Future<void> selectDate({required DateTime selectedDate}) async {
    DateFormat yearFormat = DateFormat('yyyy');
    DateFormat monthFormat = DateFormat('MM');
    DateFormat dayFormat = DateFormat('dd');

    state = state.copyWith(selectedDateForBuy: selectedDate,isEdit: true,);

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

    state = state.copyWith(selectedDateForSell: selectedDate,isEdit: true,);

    state = state.copyWith(sellingYear: yearFormat.format(selectedDate));

    state = state.copyWith(sellingMonth: monthFormat.format(selectedDate));

    state = state.copyWith(sellingDay: dayFormat.format(selectedDate));
  }


  Future<String> _uploadImageFile( imageFile) async {
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


  Future<void> updateClothes({required Clothes clothes}) async {
    if (state.clothes != null) {
      final _clothes = Clothes(
          itemId: clothes.itemId,
          brands: state.brands == '' ? clothes.brands : state.brands,
          description: state.description == '' ? clothes.description : state
              .description,
          imageURL: state.imageURL == '' ? clothes.imageURL : state.imageURL,
          category: state.category == '' ? clothes.category : state.category,
          price: state.price == '' ? clothes.price : state.price,
          year: state.year == '' ? clothes.year : state.year,
          day: state.day == '' ? clothes.day : state.day,
          month: state.month == '' ? clothes.month : state.month,
          selling: state.selling == '' ? clothes.selling : state.selling,
          sellingYear: state.selectedDateForSell == null
              ? clothes.sellingYear
              : state.sellingYear,
          sellingMonth: state.selectedDateForSell == null
              ? clothes.sellingMonth
              : state.sellingMonth,
          sellingDay: state.selectedDateForSell == null
              ? clothes.sellingDay
              : state.sellingDay,
          createdSell: state.selectedDateForSell ?? clothes.createdSell,
          createdBuy: state.selectedDateForBuy ?? clothes.createdBuy
      );
      await _read(clothesRepositoryProvider).update(clothes: _clothes);
    }
  }
}