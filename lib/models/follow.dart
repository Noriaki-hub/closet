import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow.freezed.dart';
part 'follow.g.dart';

@freezed
class Follow with _$Follow {
  const Follow._();

  const factory Follow({
    @Default('') String itemId,
    @Default('') String uid,
  }) = _Follow;



  factory Follow.fromJson(Map<String, dynamic> json) => _$FollowFromJson(json);

  factory Follow.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Follow.fromJson(data).copyWith(itemId: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('itemId');
}