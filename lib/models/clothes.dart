import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clothes.freezed.dart';
part 'clothes.g.dart';

@freezed
class Clothes with _$Clothes {
  const Clothes._();

  const factory Clothes({
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
    @Default(false)bool isSell
  }) = _Clothes;



  factory Clothes.fromJson(Map<String, dynamic> json) => _$ClothesFromJson(json);

  factory Clothes.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Clothes.fromJson(data).copyWith(itemId: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('itemId');
}

