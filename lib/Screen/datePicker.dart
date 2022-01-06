import 'package:intl/intl.dart';


class PickDate {
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
}