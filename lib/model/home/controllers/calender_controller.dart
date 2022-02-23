import 'package:closet_app_xxx/Screen/datePicker.dart';
import 'package:closet_app_xxx/model/home/controllers/buy_controller.dart';
import 'package:closet_app_xxx/model/home/controllers/datePicker_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../CustomExeption.dart';
import '../models/clothes_model.dart';
import '../repositiries/calender_repository.dart';


final calenderProvider = StateNotifierProvider.autoDispose<CalenderController, AsyncValue<List<Clothes>>>(
        (ref) {
      return CalenderController(ref.read, );
    }
);

class CalenderController extends StateNotifier<AsyncValue<List<Clothes>>> {
  final Reader _read;
  PickDate date = PickDate();

  CalenderController(this._read, ) : super(AsyncValue.loading()) {
    calenderBuyList();
  }

  Future<void> calenderBuyList(
      { bool isRefreshing = false}) async {
    if (isRefreshing) state = AsyncValue.loading();
    try {
      final date = await _read(dateProvider);
      final items = await _read(calenderRepositoryProvider)
          .retrieveBuy(
        year: date.year!,
        month: date.month!,
      );
      state = AsyncValue.data(items);
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }




  Future<void> add() async {
    try {
      final items = _read(BuyItemsProvider);
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
     state.whenData((value) => state = AsyncValue.data(value..add(clothes)));
    }on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
    }

}


final calenderSellProvider = StateNotifierProvider.autoDispose<CalenderSellController, AsyncValue<List<Clothes>>>(
        (ref) {
      return CalenderSellController(ref.read, );
    }
);

class CalenderSellController extends StateNotifier<AsyncValue<List<Clothes>>> {
  final Reader _read;
  PickDate date = PickDate();

  CalenderSellController(this._read, ) : super(AsyncValue.loading()) {
    calenderSellList(year: date.yearNowPicker(), month: date.monthNowPicker());
  }

  Future<void> calenderSellList(
      {required String year, required String month, bool isRefreshing = false}) async {
    if (isRefreshing) state = AsyncValue.loading();
    try {
      final items = await _read(calenderRepositoryProvider)
          .retrieveSell(
        year: year,
        month: month,
      );
      state = AsyncValue.data(items);
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }
}