import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    @Default('') String email,
    @Default('https://firebasestorage.googleapis.com/v0/b/clothes-app-3c8e3.appspot.com/o/loading.gif?alt=media&token=0a4db726-3a1a-4d45-9844-8350e1fda07e')
        String image,
    @Default('') String uid,
    @Default('') String name,
    @Default('') String id,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
