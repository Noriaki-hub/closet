
import 'package:closet_app_xxx/controllers/pages/calendar_picker_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/clothes.dart';
import '../../repositories/calendar_page_repository.dart';
import '../global/user_controller.dart';

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


final CalendarPageProvider =
StateNotifierProvider.autoDispose<CalendarPageController, CalendarPageState>(
        (ref) {
          final user = ref.watch(userProvider.select((value) => value.user));
          final calendarPickedDate = ref.watch(CalendarPickerProvider);
      return CalendarPageController(ref.read, calendarPickedDate.year, calendarPickedDate.month, userId: user.uid, );
    });


class CalendarPageController extends StateNotifier<CalendarPageState> {
  CalendarPageController(this._read, this._year, this._month, {required String userId,})  :
        _userId = userId, super(CalendarPageState() ){
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




    final buyClothesList = await _read(calenderRepositoryProvider)
        .fetchBuyClothesList(userId: _userId, year: _year, month: _month);
    final sellClothesList = await _read(calenderRepositoryProvider)
        .fetchSellClothesList(userId: _userId, year: _year, month: _month);

    final buying = await _read(calenderRepositoryProvider)
        .fetchBuying(userId: _userId, year: _year, month: _month);
    final selling = await _read(calenderRepositoryProvider)
        .fetchSelling(userId: _userId, year: _year, month: _month);

    state = state.copyWith(
      buyClothesList: buyClothesList,
      sellClothesList: sellClothesList,
      selling: selling,
      buying: buying,
      year: _year,
      month: _month
    );
  }


}