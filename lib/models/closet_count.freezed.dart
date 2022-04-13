// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'closet_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClosetCount _$ClosetCountFromJson(Map<String, dynamic> json) {
  return _ClosetCount.fromJson(json);
}

/// @nodoc
class _$ClosetCountTearOff {
  const _$ClosetCountTearOff();

  _ClosetCount call(
      {int tops = 0,
      int bottoms = 0,
      int outer = 0,
      int footwear = 0,
      int accessories = 0,
      int others = 0}) {
    return _ClosetCount(
      tops: tops,
      bottoms: bottoms,
      outer: outer,
      footwear: footwear,
      accessories: accessories,
      others: others,
    );
  }

  ClosetCount fromJson(Map<String, Object?> json) {
    return ClosetCount.fromJson(json);
  }
}

/// @nodoc
const $ClosetCount = _$ClosetCountTearOff();

/// @nodoc
mixin _$ClosetCount {
  int get tops => throw _privateConstructorUsedError;
  int get bottoms => throw _privateConstructorUsedError;
  int get outer => throw _privateConstructorUsedError;
  int get footwear => throw _privateConstructorUsedError;
  int get accessories => throw _privateConstructorUsedError;
  int get others => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClosetCountCopyWith<ClosetCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosetCountCopyWith<$Res> {
  factory $ClosetCountCopyWith(
          ClosetCount value, $Res Function(ClosetCount) then) =
      _$ClosetCountCopyWithImpl<$Res>;
  $Res call(
      {int tops,
      int bottoms,
      int outer,
      int footwear,
      int accessories,
      int others});
}

/// @nodoc
class _$ClosetCountCopyWithImpl<$Res> implements $ClosetCountCopyWith<$Res> {
  _$ClosetCountCopyWithImpl(this._value, this._then);

  final ClosetCount _value;
  // ignore: unused_field
  final $Res Function(ClosetCount) _then;

  @override
  $Res call({
    Object? tops = freezed,
    Object? bottoms = freezed,
    Object? outer = freezed,
    Object? footwear = freezed,
    Object? accessories = freezed,
    Object? others = freezed,
  }) {
    return _then(_value.copyWith(
      tops: tops == freezed
          ? _value.tops
          : tops // ignore: cast_nullable_to_non_nullable
              as int,
      bottoms: bottoms == freezed
          ? _value.bottoms
          : bottoms // ignore: cast_nullable_to_non_nullable
              as int,
      outer: outer == freezed
          ? _value.outer
          : outer // ignore: cast_nullable_to_non_nullable
              as int,
      footwear: footwear == freezed
          ? _value.footwear
          : footwear // ignore: cast_nullable_to_non_nullable
              as int,
      accessories: accessories == freezed
          ? _value.accessories
          : accessories // ignore: cast_nullable_to_non_nullable
              as int,
      others: others == freezed
          ? _value.others
          : others // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ClosetCountCopyWith<$Res>
    implements $ClosetCountCopyWith<$Res> {
  factory _$ClosetCountCopyWith(
          _ClosetCount value, $Res Function(_ClosetCount) then) =
      __$ClosetCountCopyWithImpl<$Res>;
  @override
  $Res call(
      {int tops,
      int bottoms,
      int outer,
      int footwear,
      int accessories,
      int others});
}

/// @nodoc
class __$ClosetCountCopyWithImpl<$Res> extends _$ClosetCountCopyWithImpl<$Res>
    implements _$ClosetCountCopyWith<$Res> {
  __$ClosetCountCopyWithImpl(
      _ClosetCount _value, $Res Function(_ClosetCount) _then)
      : super(_value, (v) => _then(v as _ClosetCount));

  @override
  _ClosetCount get _value => super._value as _ClosetCount;

  @override
  $Res call({
    Object? tops = freezed,
    Object? bottoms = freezed,
    Object? outer = freezed,
    Object? footwear = freezed,
    Object? accessories = freezed,
    Object? others = freezed,
  }) {
    return _then(_ClosetCount(
      tops: tops == freezed
          ? _value.tops
          : tops // ignore: cast_nullable_to_non_nullable
              as int,
      bottoms: bottoms == freezed
          ? _value.bottoms
          : bottoms // ignore: cast_nullable_to_non_nullable
              as int,
      outer: outer == freezed
          ? _value.outer
          : outer // ignore: cast_nullable_to_non_nullable
              as int,
      footwear: footwear == freezed
          ? _value.footwear
          : footwear // ignore: cast_nullable_to_non_nullable
              as int,
      accessories: accessories == freezed
          ? _value.accessories
          : accessories // ignore: cast_nullable_to_non_nullable
              as int,
      others: others == freezed
          ? _value.others
          : others // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClosetCount extends _ClosetCount with DiagnosticableTreeMixin {
  const _$_ClosetCount(
      {this.tops = 0,
      this.bottoms = 0,
      this.outer = 0,
      this.footwear = 0,
      this.accessories = 0,
      this.others = 0})
      : super._();

  factory _$_ClosetCount.fromJson(Map<String, dynamic> json) =>
      _$$_ClosetCountFromJson(json);

  @JsonKey()
  @override
  final int tops;
  @JsonKey()
  @override
  final int bottoms;
  @JsonKey()
  @override
  final int outer;
  @JsonKey()
  @override
  final int footwear;
  @JsonKey()
  @override
  final int accessories;
  @JsonKey()
  @override
  final int others;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClosetCount(tops: $tops, bottoms: $bottoms, outer: $outer, footwear: $footwear, accessories: $accessories, others: $others)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClosetCount'))
      ..add(DiagnosticsProperty('tops', tops))
      ..add(DiagnosticsProperty('bottoms', bottoms))
      ..add(DiagnosticsProperty('outer', outer))
      ..add(DiagnosticsProperty('footwear', footwear))
      ..add(DiagnosticsProperty('accessories', accessories))
      ..add(DiagnosticsProperty('others', others));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClosetCount &&
            const DeepCollectionEquality().equals(other.tops, tops) &&
            const DeepCollectionEquality().equals(other.bottoms, bottoms) &&
            const DeepCollectionEquality().equals(other.outer, outer) &&
            const DeepCollectionEquality().equals(other.footwear, footwear) &&
            const DeepCollectionEquality()
                .equals(other.accessories, accessories) &&
            const DeepCollectionEquality().equals(other.others, others));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(tops),
      const DeepCollectionEquality().hash(bottoms),
      const DeepCollectionEquality().hash(outer),
      const DeepCollectionEquality().hash(footwear),
      const DeepCollectionEquality().hash(accessories),
      const DeepCollectionEquality().hash(others));

  @JsonKey(ignore: true)
  @override
  _$ClosetCountCopyWith<_ClosetCount> get copyWith =>
      __$ClosetCountCopyWithImpl<_ClosetCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClosetCountToJson(this);
  }
}

abstract class _ClosetCount extends ClosetCount {
  const factory _ClosetCount(
      {int tops,
      int bottoms,
      int outer,
      int footwear,
      int accessories,
      int others}) = _$_ClosetCount;
  const _ClosetCount._() : super._();

  factory _ClosetCount.fromJson(Map<String, dynamic> json) =
      _$_ClosetCount.fromJson;

  @override
  int get tops;
  @override
  int get bottoms;
  @override
  int get outer;
  @override
  int get footwear;
  @override
  int get accessories;
  @override
  int get others;
  @override
  @JsonKey(ignore: true)
  _$ClosetCountCopyWith<_ClosetCount> get copyWith =>
      throw _privateConstructorUsedError;
}
