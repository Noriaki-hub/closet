import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../models/datePicker_model.dart';

final dateProvider =
StateNotifierProvider.autoDispose<DateController, DatePicker>(
        (ref) {
      return DateController();
    });

class DateController extends StateNotifier<DatePicker> {


  DateController() : super(const DatePicker()){
    changeDate(selectedDate: DateTime.now());
  }


  Future<void> changeDate({required DateTime selectedDate}) async {

    DateFormat yearFormat = DateFormat('yyyy');
    DateFormat monthFormat = DateFormat('MM');
    DateFormat dayFormat = DateFormat('dd');

    state = state.copyWith(selectedDate: selectedDate);

    state = state.copyWith(year: yearFormat.format(selectedDate));

    state = state.copyWith(month: monthFormat.format(selectedDate));

    state = state.copyWith(day: dayFormat.format(selectedDate));


  }
}