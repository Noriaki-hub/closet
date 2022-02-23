import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'datePicker_model.freezed.dart';

@freezed
class DatePicker with _$DatePicker {
  const DatePicker._();

  const factory DatePicker({
    DateTime? selectedDate,
    String? day,
    String? month,
    String? year,
  }) = _DatePicker;

}