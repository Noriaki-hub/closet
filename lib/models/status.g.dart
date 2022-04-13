// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Status _$$_StatusFromJson(Map<String, dynamic> json) => _$_Status(
      uid: json['uid'] as String? ?? '',
      clothesCount: json['clothesCount'] as int? ?? 0,
      clothesAllCount: json['clothesAllCount'] as int? ?? 0,
      likedCount: json['likedCount'] as int? ?? 0,
      buying: json['buying'] as int? ?? 0,
      selling: json['selling'] as int? ?? 0,
    );

Map<String, dynamic> _$$_StatusToJson(_$_Status instance) => <String, dynamic>{
      'uid': instance.uid,
      'clothesCount': instance.clothesCount,
      'clothesAllCount': instance.clothesAllCount,
      'likedCount': instance.likedCount,
      'buying': instance.buying,
      'selling': instance.selling,
    };
