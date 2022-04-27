import 'package:closet_app_xxx/models/libs/timestamp_converter.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clothes.freezed.dart';
part 'clothes.g.dart';

@freezed
class Clothes with _$Clothes {
  const Clothes._();

  const factory Clothes(
      {@FireTimestampConverterNonNull() required DateTime createdBuy,
      @FireTimestampConverterNonNull() required DateTime createdSell,
      @Default('') String itemId,
      @Default(0) int brandId,
      @Default(0) int price,
      @Default('') String category,
      @Default('') String imageURL,
      @Default(0) int selling,
      @Default('') String description,
      @Default('') String day,
      @Default('') String month,
      @Default('') String year,
      @Default('') String sellingDay,
      @Default('') String sellingMonth,
      @Default('') String sellingYear,
      @Default(false) bool isSell,
      @Default(false) bool isFavorite,
      @Default('') String uid,
      @Default('') String buyingForm,
      @Default(0) int likedCount
      }) = _Clothes;

  factory Clothes.fromJson(Map<String, dynamic> json) =>
      _$ClothesFromJson(json);
}
