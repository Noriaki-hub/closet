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
}
