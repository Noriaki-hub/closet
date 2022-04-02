import 'package:closet_app_xxx/models/date.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final dateNowProvider = StateNotifierProvider<DateNowController, Date>((ref) {
  return DateNowController();
});

class DateNowController extends StateNotifier<Date> {
  DateNowController() : super(const Date()) {
    _init();
  }
  DateTime now = DateTime.now();

  String yearNowPicker() {
    DateFormat outputFormat = DateFormat('yyyy');
    String date = outputFormat.format(now);
    return date;
  }

  String monthNowPicker() {
    DateFormat outputFormat = DateFormat('MM');
    String date = outputFormat.format(now);
    return date;
  }

  String dayNowPicker() {
    DateFormat outputFormat = DateFormat('dd');
    String date = outputFormat.format(now);
    return date;
  }

  Future<void> _init() async {
    fetchDateNow();
  }

  Future<void> fetchDateNow() async {
    state = state.copyWith(
        day: dayNowPicker(), month: monthNowPicker(), year: yearNowPicker());
  }
}
