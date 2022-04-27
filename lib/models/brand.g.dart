// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Brand _$$_BrandFromJson(Map<String, dynamic> json) => _$_Brand(
      brand_name_en: json['brand_name_en'] as String? ?? '',
      brand_name_ja: json['brand_name_ja'] as String? ?? '',
      site_url: json['site_url'] as String? ?? '',
      brandId: json['brandId'] as int? ?? 0,
      follower: json['follower'] as int? ?? 0,
    );

Map<String, dynamic> _$$_BrandToJson(_$_Brand instance) => <String, dynamic>{
      'brand_name_en': instance.brand_name_en,
      'brand_name_ja': instance.brand_name_ja,
      'site_url': instance.site_url,
      'brandId': instance.brandId,
      'follower': instance.follower,
    };
