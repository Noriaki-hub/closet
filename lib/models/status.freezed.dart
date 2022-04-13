// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Status _$StatusFromJson(Map<String, dynamic> json) {
  return _Status.fromJson(json);
}

/// @nodoc
class _$StatusTearOff {
  const _$StatusTearOff();

  _Status call(
      {String uid = '',
      int clothesCount = 0,
      int clothesAllCount = 0,
      int likedCount = 0,
      int buying = 0,
      int selling = 0}) {
    return _Status(
      uid: uid,
      clothesCount: clothesCount,
      clothesAllCount: clothesAllCount,
      likedCount: likedCount,
      buying: buying,
      selling: selling,
    );
  }

  Status fromJson(Map<String, Object?> json) {
    return Status.fromJson(json);
  }
}

/// @nodoc
const $Status = _$StatusTearOff();

/// @nodoc
mixin _$Status {
  String get uid => throw _privateConstructorUsedError;
  int get clothesCount => throw _privateConstructorUsedError;
  int get clothesAllCount => throw _privateConstructorUsedError;
  int get likedCount => throw _privateConstructorUsedError;
  int get buying => throw _privateConstructorUsedError;
  int get selling => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusCopyWith<Status> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) then) =
      _$StatusCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      int clothesCount,
      int clothesAllCount,
      int likedCount,
      int buying,
      int selling});
}

/// @nodoc
class _$StatusCopyWithImpl<$Res> implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._value, this._then);

  final Status _value;
  // ignore: unused_field
  final $Res Function(Status) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? clothesCount = freezed,
    Object? clothesAllCount = freezed,
    Object? likedCount = freezed,
    Object? buying = freezed,
    Object? selling = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      clothesCount: clothesCount == freezed
          ? _value.clothesCount
          : clothesCount // ignore: cast_nullable_to_non_nullable
              as int,
      clothesAllCount: clothesAllCount == freezed
          ? _value.clothesAllCount
          : clothesAllCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedCount: likedCount == freezed
          ? _value.likedCount
          : likedCount // ignore: cast_nullable_to_non_nullable
              as int,
      buying: buying == freezed
          ? _value.buying
          : buying // ignore: cast_nullable_to_non_nullable
              as int,
      selling: selling == freezed
          ? _value.selling
          : selling // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$StatusCopyWith<$Res> implements $StatusCopyWith<$Res> {
  factory _$StatusCopyWith(_Status value, $Res Function(_Status) then) =
      __$StatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      int clothesCount,
      int clothesAllCount,
      int likedCount,
      int buying,
      int selling});
}

/// @nodoc
class __$StatusCopyWithImpl<$Res> extends _$StatusCopyWithImpl<$Res>
    implements _$StatusCopyWith<$Res> {
  __$StatusCopyWithImpl(_Status _value, $Res Function(_Status) _then)
      : super(_value, (v) => _then(v as _Status));

  @override
  _Status get _value => super._value as _Status;

  @override
  $Res call({
    Object? uid = freezed,
    Object? clothesCount = freezed,
    Object? clothesAllCount = freezed,
    Object? likedCount = freezed,
    Object? buying = freezed,
    Object? selling = freezed,
  }) {
    return _then(_Status(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      clothesCount: clothesCount == freezed
          ? _value.clothesCount
          : clothesCount // ignore: cast_nullable_to_non_nullable
              as int,
      clothesAllCount: clothesAllCount == freezed
          ? _value.clothesAllCount
          : clothesAllCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedCount: likedCount == freezed
          ? _value.likedCount
          : likedCount // ignore: cast_nullable_to_non_nullable
              as int,
      buying: buying == freezed
          ? _value.buying
          : buying // ignore: cast_nullable_to_non_nullable
              as int,
      selling: selling == freezed
          ? _value.selling
          : selling // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Status extends _Status with DiagnosticableTreeMixin {
  const _$_Status(
      {this.uid = '',
      this.clothesCount = 0,
      this.clothesAllCount = 0,
      this.likedCount = 0,
      this.buying = 0,
      this.selling = 0})
      : super._();

  factory _$_Status.fromJson(Map<String, dynamic> json) =>
      _$$_StatusFromJson(json);

  @JsonKey()
  @override
  final String uid;
  @JsonKey()
  @override
  final int clothesCount;
  @JsonKey()
  @override
  final int clothesAllCount;
  @JsonKey()
  @override
  final int likedCount;
  @JsonKey()
  @override
  final int buying;
  @JsonKey()
  @override
  final int selling;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Status(uid: $uid, clothesCount: $clothesCount, clothesAllCount: $clothesAllCount, likedCount: $likedCount, buying: $buying, selling: $selling)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Status'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('clothesCount', clothesCount))
      ..add(DiagnosticsProperty('clothesAllCount', clothesAllCount))
      ..add(DiagnosticsProperty('likedCount', likedCount))
      ..add(DiagnosticsProperty('buying', buying))
      ..add(DiagnosticsProperty('selling', selling));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Status &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality()
                .equals(other.clothesCount, clothesCount) &&
            const DeepCollectionEquality()
                .equals(other.clothesAllCount, clothesAllCount) &&
            const DeepCollectionEquality()
                .equals(other.likedCount, likedCount) &&
            const DeepCollectionEquality().equals(other.buying, buying) &&
            const DeepCollectionEquality().equals(other.selling, selling));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(clothesCount),
      const DeepCollectionEquality().hash(clothesAllCount),
      const DeepCollectionEquality().hash(likedCount),
      const DeepCollectionEquality().hash(buying),
      const DeepCollectionEquality().hash(selling));

  @JsonKey(ignore: true)
  @override
  _$StatusCopyWith<_Status> get copyWith =>
      __$StatusCopyWithImpl<_Status>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatusToJson(this);
  }
}

abstract class _Status extends Status {
  const factory _Status(
      {String uid,
      int clothesCount,
      int clothesAllCount,
      int likedCount,
      int buying,
      int selling}) = _$_Status;
  const _Status._() : super._();

  factory _Status.fromJson(Map<String, dynamic> json) = _$_Status.fromJson;

  @override
  String get uid;
  @override
  int get clothesCount;
  @override
  int get clothesAllCount;
  @override
  int get likedCount;
  @override
  int get buying;
  @override
  int get selling;
  @override
  @JsonKey(ignore: true)
  _$StatusCopyWith<_Status> get copyWith => throw _privateConstructorUsedError;
}
