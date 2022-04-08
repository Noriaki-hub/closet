import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config.freezed.dart';

part 'app_config.g.dart';

@freezed
class AppConfig with _$AppConfig {
  @JsonSerializable(explicitToJson: true)
  const factory AppConfig({
    @Default(0) int minBuildNumberAndroid,
    @Default(0) int minBuildNumberIos	,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
}