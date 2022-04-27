import 'package:closet_app_xxx/models/libs/timestamp_converter.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand.freezed.dart';
part 'brand.g.dart';

@freezed
class Brand with _$Brand {
  const Brand._();

  const factory Brand({
    @Default('') String brand_name_en,
    @Default('') String brand_name_ja,
    @Default('') String site_url,
    @Default(0) int brandId,
    @Default(0) int follower,
  }) = _Brand;

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}
