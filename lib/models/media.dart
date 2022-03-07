import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media.freezed.dart';
part 'media.g.dart';

@freezed
class Media with _$Media {
  const Media._();

  const factory Media({
    @Default('') String name,
    @Default('') String url,
    @Default('') String image,
  }) = _Media;


  factory Media.fromJson(Map<String, dynamic> json) =>
      _$MediaFromJson(json);

  factory Media.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Media.fromJson(data);
  }

  Map<String, dynamic> toDocument() => toJson();
}