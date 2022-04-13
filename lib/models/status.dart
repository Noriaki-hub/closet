import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';
part 'status.g.dart';

@freezed
class Status with _$Status {
  const Status._();

  const factory Status({
    @Default('') String uid,
    @Default(0) int clothesCount,
    @Default(0) int clothesAllCount,
    @Default(0) int likedCount,
    @Default(0) int buying,
    @Default(0) int selling,
  }) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}
