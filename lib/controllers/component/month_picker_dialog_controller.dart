import 'package:closet_app_xxx/controllers/global/date_now_controller.dart';
import 'package:closet_app_xxx/controllers/pages/home/calendar_page_controller.dart';
import 'package:closet_app_xxx/models/date.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'month_picker_dialog_controller.freezed.dart';

@freezed
class MonthPickerDialogState with _$MonthPickerDialogState {
  const MonthPickerDialogState._();

  const factory MonthPickerDialogState({
    String? selectedMonth,
    String? selectedYear,
  }) = _MonthPickerDialogState;
}

final monthPickerDialogProvider =
    StateNotifierProvider.autoDispose<MonthPickerDialogController, MonthPickerDialogState>(
        (ref) {
  final dateNow = ref.read(dateNowProvider);
  return MonthPickerDialogController(dateNow: dateNow, read: ref.read);
});

class MonthPickerDialogController
    extends StateNotifier<MonthPickerDialogState> {
  MonthPickerDialogController({required this.dateNow, required this.read})
      : super(const MonthPickerDialogState()) {
    _init();
  }

  final Date dateNow;
  final Reader read;

  _init() {
    state = state.copyWith(
        selectedMonth: dateNow.month, selectedYear: dateNow.year);
  }

  void selectMonth({required String month}) {
    state = state.copyWith(selectedMonth: month);
  }

  void backYear() {
    final selectedYear = state.selectedYear;
    if (selectedYear != null) {
      final lastYear = (int.parse(selectedYear) - 1).toString();
      state = state.copyWith(selectedYear: lastYear);
    }
  }

  void frontYear() {
    final selectedYear = state.selectedYear;

    if (selectedYear != null && selectedYear != dateNow.year) {
      final lastYear = (int.parse(selectedYear) + 1).toString();
      state = state.copyWith(selectedYear: lastYear);
    }
  }

  List<String> getYears({required int nowYear, required int startYear}) {
    List<String> years = [];
    for (var i = startYear; i < nowYear + 1; i++) {
      years.add(i.toString());
    }
    return years;
  }
}
