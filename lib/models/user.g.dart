// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      email: json['email'] as String? ?? '',
      image: json['image'] as String? ??
          'https://firebasestorage.googleapis.com/v0/b/clothes-app-3c8e3.appspot.com/o/loading.gif?alt=media&token=0a4db726-3a1a-4d45-9844-8350e1fda07e',
      uid: json['uid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'image': instance.image,
      'uid': instance.uid,
      'name': instance.name,
      'id': instance.id,
    };
