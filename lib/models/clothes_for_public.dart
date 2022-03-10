import 'package:closet_app_xxx/models/libs/timestamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clothes_for_public.freezed.dart';
part 'clothes_for_public.g.dart';

@freezed
class ClothesForPublic with _$ClothesForPublic {
  const ClothesForPublic._();

  const factory ClothesForPublic({
    @FireTimestampConverterNonNull() DateTime? createdBuy,
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
    @Default('') String userName,
    @Default('') String userImage
  }) = _ClothesForPublic;

  factory ClothesForPublic.fromJson(Map<String, dynamic> json) => _$ClothesForPublicFromJson(json);


}