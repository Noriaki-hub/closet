import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'calendar_picker_controller.freezed.dart';

@freezed
class CalendarPicker with _$CalendarPicker {
  const CalendarPicker._();

  const factory CalendarPicker({
    DateTime? selectedDate,
    @Default('') String year,
    @Default('') String month,
    @Default('') String day,
  }) = _CalendarPicker;
}

final calendarPickerProvider =
    StateNotifierProvider.autoDispose<DateController, CalendarPicker>((ref) {
  return DateController();
});

class DateController extends StateNotifier<CalendarPicker> {
  DateController() : super(CalendarPicker()) {
    nowDate();
  }

  Future<void> nowDate() async {
    DateFormat yearFormat = DateFormat('yyyy');
    DateFormat monthFormat = DateFormat('MM');
    DateFormat dayFormat = DateFormat('dd');

    state = state.copyWith(year: yearFormat.format(DateTime.now()));

    state = state.copyWith(month: monthFormat.format(DateTime.now()));

    state = state.copyWith(day: dayFormat.format(DateTime.now()));
  }

  Future<void> changeDate({required DateTime selectedDate}) async {
    DateFormat yearFormat = DateFormat('yyyy');
    DateFormat monthFormat = DateFormat('MM');
    DateFormat dayFormat = DateFormat('dd');

    state = state.copyWith(selectedDate: selectedDate);

    state = state.copyWith(year: yearFormat.format(state.selectedDate!));

    state = state.copyWith(month: monthFormat.format(state.selectedDate!));

    state = state.copyWith(day: dayFormat.format(state.selectedDate!));
  }
}
