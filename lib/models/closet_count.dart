import 'package:closet_app_xxx/models/libs/timestamp_converter.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'closet_count.freezed.dart';
part 'closet_count.g.dart';

@freezed
class ClosetCount with _$ClosetCount {
  const ClosetCount._();

  const factory ClosetCount({
    @Default(0) int tops,
    @Default(0) int bottoms,
    @Default(0) int outer,
    @Default(0) int footwear,
    @Default(0) int accessories,
    @Default(0) int others,
  }) = _ClosetCount;

  factory ClosetCount.fromJson(Map<String, dynamic> json) =>
      _$ClosetCountFromJson(json);
}
