import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clothes_model.freezed.dart';
part 'clothes_model.g.dart';

@freezed
class Clothes with _$Clothes {
  const Clothes._();

  const factory Clothes({
    String? itemId,
    required String brands,
    required String price,
    required String category,
    required String imageURL,
    required String selling,
    required String description,
    required String day,
    required String month,
    required String year,
    required bool isSell
  }) = _Clothes;



  factory Clothes.fromJson(Map<String, dynamic> json) => _$ClothesFromJson(json);

  factory Clothes.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Clothes.fromJson(data);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('itemId');
}

