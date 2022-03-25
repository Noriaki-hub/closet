import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'libs/timestamp_converter.dart';

part 'buy.freezed.dart';
part 'buy.g.dart';

@freezed
class Buy with _$Buy {
  const Buy._();

  const factory Buy({
    @FireTimestampConverterNonNull() required DateTime createdBuy,
    @FireTimestampConverterNonNull() DateTime? createdSell,
    @Default('') String itemId,
    @Default('') String brands,
    @Default('') String price,
    @Default('') String category,
    @Default('') String imageURL,
    @Default('') String selling,
    @Default('') String description,
    @Default('') String day,
    @Default('') String month,
    @Default('') String year,
    @Default('') String sellingDay,
    @Default('') String sellingMonth,
    @Default('') String sellingYear,
    @Default(false)bool isSell,
    @Default(false)bool isFavorite,
    @Default('') String uid,
    @Default('') String buyingForm,
  }) = _Buy;
  factory Buy.fromJson(Map<String, dynamic> json) => _$BuyFromJson(json);
}

