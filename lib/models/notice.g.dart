// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notice _$$_NoticeFromJson(Map<String, dynamic> json) => _$_Notice(
      itemId: json['itemId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
      url: json['url'] as String? ?? '',
      date: json['date'] as String? ?? '',
      created: const FireTimestampConverterNonNull().fromJson(json['created']),
    );

Map<String, dynamic> _$$_NoticeToJson(_$_Notice instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'title': instance.title,
      'image': instance.image,
      'url': instance.url,
      'date': instance.date,
      'created': const FireTimestampConverterNonNull().toJson(instance.created),
    };
