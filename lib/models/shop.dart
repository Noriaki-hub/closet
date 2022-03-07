import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop.freezed.dart';
part 'shop.g.dart';




@freezed
class Shop with _$Shop {
  const Shop._();

  const factory Shop({
    @Default('') String name,
    @Default('') String url,
    @Default('') String image,
  }) = _Shop;


  factory Shop.fromJson(Map<String, dynamic> json) =>
      _$ShopFromJson(json);

  factory Shop.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Shop.fromJson(data);
  }

  Map<String, dynamic> toDocument() => toJson();
}