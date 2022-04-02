import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'share.freezed.dart';
part 'share.g.dart';

@freezed
class Share with _$Share {
  const Share._();

  const factory Share({
    @Default('') String itemId,
    @Default('') String url,
    @Default('') String uid,
    @Default('') String genre,
    @Default('') String title,
    @Default('') String image,
  }) = _Share;

  factory Share.fromJson(Map<String, dynamic> json) => _$ShareFromJson(json);
}
