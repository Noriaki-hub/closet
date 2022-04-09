import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/models/clothes.dart';
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
    @Default(<Clothes>[]) List<Clothes> buyClothesList,
    @Default(<Clothes>[]) List<Clothes> sellClothesList,
    @Default('') String buying,
    @Default('') String selling,
    @Default('') String year,
    @Default('') String month,
  }) = _CalendarPageState;
}

final calendarPageProvider = StateNotifierProvider.autoDispose<
    CalendarPageController, CalendarPageState>((ref) {
  final user = ref.watch(userProvider.select((value) => value.user));
  final calendarPickedDate = ref.watch(calendarPickerProvider);
  return CalendarPageController(
    ref.read,
    calendarPickedDate.year,
    calendarPickedDate.month,
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

    final buying = await _read(clothesRepositoryProvider)
        .fetchBuying(userId: _userId, year: _year, month: _month);
    final selling = await _read(clothesRepositoryProvider)
        .fetchSelling(userId: _userId, year: _year, month: _month);

    state = state.copyWith(
        buyClothesList: buyClothesList,
        sellClothesList: sellClothesList,
        selling: selling,
        buying: buying,
        year: _year,
        month: _month);
  }
}
