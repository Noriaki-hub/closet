import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'libs/timestamp_converter.dart';

part 'notice.freezed.dart';
part 'notice.g.dart';

@freezed
class Notice with _$Notice {
  const Notice._();

  const factory Notice({
    @Default('') String itemId,
    @Default('') String title,
    @Default('') String image,
    @Default('') String url,
    @Default('') String date,
    @FireTimestampConverterNonNull() required DateTime created,

  }) = _Notice;

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);
}