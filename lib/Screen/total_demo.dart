import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class TotalDate extends StatelessWidget {

  String dateNow() {
    DateTime now = DateTime.now();
    DateFormat outputFormat = DateFormat('yyyy-MM');
    String date = outputFormat.format(now);
    return date;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}