import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'like.freezed.dart';
part 'like.g.dart';

@freezed
class Like with _$Like {
  const Like._();

  const factory Like({
    @Default('') String itemId,
    @Default('') String uid,
  }) = _Like;



  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);

}
