// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'brand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Brand _$BrandFromJson(Map<String, dynamic> json) {
  return _Brand.fromJson(json);
}

/// @nodoc
class _$BrandTearOff {
  const _$BrandTearOff();

  _Brand call(
      {String brand_name_en = '',
      String brand_name_ja = '',
      String site_url = '',
      int brandId = 0,
      int follower = 0}) {
    return _Brand(
      brand_name_en: brand_name_en,
      brand_name_ja: brand_name_ja,
      site_url: site_url,
      brandId: brandId,
      follower: follower,
    );
  }

  Brand fromJson(Map<String, Object?> json) {
    return Brand.fromJson(json);
  }
}

/// @nodoc
const $Brand = _$BrandTearOff();

/// @nodoc
mixin _$Brand {
  String get brand_name_en => throw _privateConstructorUsedError;
  String get brand_name_ja => throw _privateConstructorUsedError;
  String get site_url => throw _privateConstructorUsedError;
  int get brandId => throw _privateConstructorUsedError;
  int get follower => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BrandCopyWith<Brand> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandCopyWith<$Res> {
  factory $BrandCopyWith(Brand value, $Res Function(Brand) then) =
      _$BrandCopyWithImpl<$Res>;
  $Res call(
      {String brand_name_en,
      String brand_name_ja,
      String site_url,
      int brandId,
      int follower});
}

/// @nodoc
class _$BrandCopyWithImpl<$Res> implements $BrandCopyWith<$Res> {
  _$BrandCopyWithImpl(this._value, this._then);

  final Brand _value;
  // ignore: unused_field
  final $Res Function(Brand) _then;

  @override
  $Res call({
    Object? brand_name_en = freezed,
    Object? brand_name_ja = freezed,
    Object? site_url = freezed,
    Object? brandId = freezed,
    Object? follower = freezed,
  }) {
    return _then(_value.copyWith(
      brand_name_en: brand_name_en == freezed
          ? _value.brand_name_en
          : brand_name_en // ignore: cast_nullable_to_non_nullable
              as String,
      brand_name_ja: brand_name_ja == freezed
          ? _value.brand_name_ja
          : brand_name_ja // ignore: cast_nullable_to_non_nullable
              as String,
      site_url: site_url == freezed
          ? _value.site_url
          : site_url // ignore: cast_nullable_to_non_nullable
              as String,
      brandId: brandId == freezed
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int,
      follower: follower == freezed
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$BrandCopyWith<$Res> implements $BrandCopyWith<$Res> {
  factory _$BrandCopyWith(_Brand value, $Res Function(_Brand) then) =
      __$BrandCopyWithImpl<$Res>;
  @override
  $Res call(
      {String brand_name_en,
      String brand_name_ja,
      String site_url,
      int brandId,
      int follower});
}

/// @nodoc
class __$BrandCopyWithImpl<$Res> extends _$BrandCopyWithImpl<$Res>
    implements _$BrandCopyWith<$Res> {
  __$BrandCopyWithImpl(_Brand _value, $Res Function(_Brand) _then)
      : super(_value, (v) => _then(v as _Brand));

  @override
  _Brand get _value => super._value as _Brand;

  @override
  $Res call({
    Object? brand_name_en = freezed,
    Object? brand_name_ja = freezed,
    Object? site_url = freezed,
    Object? brandId = freezed,
    Object? follower = freezed,
  }) {
    return _then(_Brand(
      brand_name_en: brand_name_en == freezed
          ? _value.brand_name_en
          : brand_name_en // ignore: cast_nullable_to_non_nullable
              as String,
      brand_name_ja: brand_name_ja == freezed
          ? _value.brand_name_ja
          : brand_name_ja // ignore: cast_nullable_to_non_nullable
              as String,
      site_url: site_url == freezed
          ? _value.site_url
          : site_url // ignore: cast_nullable_to_non_nullable
              as String,
      brandId: brandId == freezed
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int,
      follower: follower == freezed
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Brand extends _Brand with DiagnosticableTreeMixin {
  const _$_Brand(
      {this.brand_name_en = '',
      this.brand_name_ja = '',
      this.site_url = '',
      this.brandId = 0,
      this.follower = 0})
      : super._();

  factory _$_Brand.fromJson(Map<String, dynamic> json) =>
      _$$_BrandFromJson(json);

  @JsonKey()
  @override
  final String brand_name_en;
  @JsonKey()
  @override
  final String brand_name_ja;
  @JsonKey()
  @override
  final String site_url;
  @JsonKey()
  @override
  final int brandId;
  @JsonKey()
  @override
  final int follower;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Brand(brand_name_en: $brand_name_en, brand_name_ja: $brand_name_ja, site_url: $site_url, brandId: $brandId, follower: $follower)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Brand'))
      ..add(DiagnosticsProperty('brand_name_en', brand_name_en))
      ..add(DiagnosticsProperty('brand_name_ja', brand_name_ja))
      ..add(DiagnosticsProperty('site_url', site_url))
      ..add(DiagnosticsProperty('brandId', brandId))
      ..add(DiagnosticsProperty('follower', follower));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Brand &&
            const DeepCollectionEquality()
                .equals(other.brand_name_en, brand_name_en) &&
            const DeepCollectionEquality()
                .equals(other.brand_name_ja, brand_name_ja) &&
            const DeepCollectionEquality().equals(other.site_url, site_url) &&
            const DeepCollectionEquality().equals(other.brandId, brandId) &&
            const DeepCollectionEquality().equals(other.follower, follower));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(brand_name_en),
      const DeepCollectionEquality().hash(brand_name_ja),
      const DeepCollectionEquality().hash(site_url),
      const DeepCollectionEquality().hash(brandId),
      const DeepCollectionEquality().hash(follower));

  @JsonKey(ignore: true)
  @override
  _$BrandCopyWith<_Brand> get copyWith =>
      __$BrandCopyWithImpl<_Brand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BrandToJson(this);
  }
}

abstract class _Brand extends Brand {
  const factory _Brand(
      {String brand_name_en,
      String brand_name_ja,
      String site_url,
      int brandId,
      int follower}) = _$_Brand;
  const _Brand._() : super._();

  factory _Brand.fromJson(Map<String, dynamic> json) = _$_Brand.fromJson;

  @override
  String get brand_name_en;
  @override
  String get brand_name_ja;
  @override
  String get site_url;
  @override
  int get brandId;
  @override
  int get follower;
  @override
  @JsonKey(ignore: true)
  _$BrandCopyWith<_Brand> get copyWith => throw _privateConstructorUsedError;
}
