import 'package:closet_app_xxx/controllers/component/month_picker_dialog_controller.dart';
import 'package:closet_app_xxx/controllers/global/date_now_controller.dart';
import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/brand.dart';
import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/repositories/brand_repository.dart';
import 'package:closet_app_xxx/repositories/clothes_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'calendar_picker_controller.dart';

part 'calendar_page_controller.freezed.dart';

@freezed
class CalendarPageState with _$CalendarPageState {
  const CalendarPageState._();

  const factory CalendarPageState({
    @Default(<Clothes, Brand>{}) Map<Clothes, Brand> buyClothesMap,
    @Default(<Clothes, Brand>{}) Map<Clothes, Brand> sellClothesMap,
    @Default('') String buying,
    @Default('') String selling,
    @Default('') String year,
    @Default('') String month,
  }) = _CalendarPageState;
}

final calendarPageProvider = StateNotifierProvider.autoDispose<
    CalendarPageController, CalendarPageState>((ref) {
  final user = ref.watch(userProvider.select((value) => value.user));
  final calendarPickedDate = ref.watch(monthPickerDialogProvider);
  final dateNow = ref.watch(dateNowProvider);
  return CalendarPageController(
    ref.read,
    calendarPickedDate.selectedYear ?? dateNow.year,
    calendarPickedDate.selectedMonth ?? dateNow.month,
    userId: user.uid,
  );
});

class CalendarPageController extends StateNotifier<CalendarPageState> {
  CalendarPageController(
    this._read,
    this._year,
    this._month, {
    required String userId,
  })  : _userId = userId,
        super(CalendarPageState()) {
    _init();
  }
  final Reader _read;
  final String _userId;
  final String _year;
  final String _month;

  Future<void> _init() async {
    fetchCalendarPageState();
  }

  Future<void> fetchCalendarPageState() async {
    final buyClothesList = await _read(clothesRepositoryProvider)
        .fetchSortBuyCloset(userId: _userId, year: _year, month: _month);
    final sellClothesList = await _read(clothesRepositoryProvider)
        .fetchSortSellCloset(userId: _userId, year: _year, month: _month);

    final buyClothesMap = {...state.buyClothesMap};
    for (var clothes in buyClothesList) {
      final brand = await _read(brandRepositoryProvider)
          .fetchBrand(brandId: clothes.brandId.toString());
      if (brand != null) {
        buyClothesMap..addAll({clothes: brand});
      }
    }

    final sellClothesMap = {...state.sellClothesMap};
    for (var clothes in sellClothesList) {
      final brand = await _read(brandRepositoryProvider)
          .fetchBrand(brandId: clothes.brandId.toString());
      if (brand != null) {
        sellClothesMap..addAll({clothes: brand});
      }
    }

    final buying = await _read(clothesRepositoryProvider)
        .fetchBuying(userId: _userId, year: _year, month: _month);
    final selling = await _read(clothesRepositoryProvider)
        .fetchSelling(userId: _userId, year: _year, month: _month);

    state = state.copyWith(
        selling: selling,
        buying: buying,
        year: _year,
        month: _month,
        buyClothesMap: buyClothesMap,
        sellClothesMap: sellClothesMap);
  }
}
