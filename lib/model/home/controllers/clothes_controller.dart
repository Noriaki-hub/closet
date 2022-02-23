import 'package:closet_app_xxx/Screen/datePicker.dart';
import 'package:closet_app_xxx/model/auth/current/current_controller.dart';
import 'package:closet_app_xxx/model/home/controllers/buy_controller.dart';
import 'package:closet_app_xxx/model/home/repositiries/calender_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../CustomExeption.dart';
import '../models/clothes_model.dart';
import '../repositiries/clothes_repository.dart';


final clothesListProvider = StateNotifierProvider.autoDispose<ClothesListController, AsyncValue<List<Clothes>>>(
        (ref) {
          throw UnimplementedError();
    }
);


final clothesListProviderFamily = StateNotifierProvider.family
    .autoDispose<ClothesListController, AsyncValue<List<Clothes>>, String>(
        (ref, userId) {
      return ClothesListController(ref.read, userId);
    });

class ClothesListController extends StateNotifier<AsyncValue<List<Clothes>>> {
  final Reader _read;
  final String userId;

  ClothesListController(this._read, this.userId): super(AsyncValue.loading()){

    fetchClothesList(userId: userId);

  }

  Future<void> fetchClothesList({required String userId,bool isRefreshing = false}) async {
    if (isRefreshing) state = AsyncValue.loading();
    try {
      final items = await _read(clothesListRepositoryProvider)
          .retrieve(userId: userId);
      if (mounted) {
        state = AsyncValue.data(items);
      }
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }

  Future<void> fetchClothesListCategory({required String userId,required String category, bool isRefreshing = false}) async {
    if (isRefreshing) state = AsyncValue.loading();
    try {
      final items = await _read(clothesListRepositoryProvider)
          .retrieveCategory(userId: userId, category: category);
      if (mounted) {
        state = AsyncValue.data(items);
      }
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }



  Future<void> addClothes() async {
    PickDate date = PickDate();
    final items = _read(BuyItemsProvider);
    try {
      final clothes = Clothes(
        description: items.description,
        selling: '',
        price: items.price,
        brands: items.brands,
        category: items.category,
        imageURL: items.imageURL,
        day: date.dayNowPicker(),
        month: date.monthNowPicker(),
        year: date.yearNowPicker(),
        isSell: false,
      );
      final itemId = await _read(clothesListRepositoryProvider).add(clothes);
      state.whenData((items) => state = AsyncValue.data(items..add(clothes.copyWith(itemId: itemId))));
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }

}