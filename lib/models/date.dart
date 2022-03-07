
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'date.freezed.dart';

@freezed
class Date with _$Date {
  const Date._();

  const factory Date({
    @Default('')String year,
    @Default('')String month,
    @Default('')String day,

  }) = _Date;

}



