import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'libs/timestamp_converter.dart';

part 'sell.freezed.dart';

@freezed
class Sell with _$Sell {
  const Sell._();

  const factory Sell({
    @FireTimestampConverterNonNull() required DateTime createdSell,
    @Default('') String itemId,
    @Default('') String selling,
    @Default('') String sellingDay,
    @Default('') String sellingMonth,
    @Default('') String sellingYear,
    @Default(false) bool isSell,
  }) = _Sell;
}
