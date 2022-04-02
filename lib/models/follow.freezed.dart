// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'follow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Follow _$FollowFromJson(Map<String, dynamic> json) {
  return _Follow.fromJson(json);
}

/// @nodoc
class _$FollowTearOff {
  const _$FollowTearOff();

  _Follow call({String itemId = '', String uid = ''}) {
    return _Follow(
      itemId: itemId,
      uid: uid,
    );
  }

  Follow fromJson(Map<String, Object?> json) {
    return Follow.fromJson(json);
  }
}

/// @nodoc
const $Follow = _$FollowTearOff();

/// @nodoc
mixin _$Follow {
  String get itemId => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowCopyWith<Follow> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowCopyWith<$Res> {
  factory $FollowCopyWith(Follow value, $Res Function(Follow) then) =
      _$FollowCopyWithImpl<$Res>;
  $Res call({String itemId, String uid});
}

/// @nodoc
class _$FollowCopyWithImpl<$Res> implements $FollowCopyWith<$Res> {
  _$FollowCopyWithImpl(this._value, this._then);

  final Follow _value;
  // ignore: unused_field
  final $Res Function(Follow) _then;

  @override
  $Res call({
    Object? itemId = freezed,
    Object? uid = freezed,
  }) {
    return _then(_value.copyWith(
      itemId: itemId == freezed
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FollowCopyWith<$Res> implements $FollowCopyWith<$Res> {
  factory _$FollowCopyWith(_Follow value, $Res Function(_Follow) then) =
      __$FollowCopyWithImpl<$Res>;
  @override
  $Res call({String itemId, String uid});
}

/// @nodoc
class __$FollowCopyWithImpl<$Res> extends _$FollowCopyWithImpl<$Res>
    implements _$FollowCopyWith<$Res> {
  __$FollowCopyWithImpl(_Follow _value, $Res Function(_Follow) _then)
      : super(_value, (v) => _then(v as _Follow));

  @override
  _Follow get _value => super._value as _Follow;

  @override
  $Res call({
    Object? itemId = freezed,
    Object? uid = freezed,
  }) {
    return _then(_Follow(
      itemId: itemId == freezed
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Follow extends _Follow with DiagnosticableTreeMixin {
  const _$_Follow({this.itemId = '', this.uid = ''}) : super._();

  factory _$_Follow.fromJson(Map<String, dynamic> json) =>
      _$$_FollowFromJson(json);

  @JsonKey()
  @override
  final String itemId;
  @JsonKey()
  @override
  final String uid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Follow(itemId: $itemId, uid: $uid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Follow'))
      ..add(DiagnosticsProperty('itemId', itemId))
      ..add(DiagnosticsProperty('uid', uid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Follow &&
            const DeepCollectionEquality().equals(other.itemId, itemId) &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(itemId),
      const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$FollowCopyWith<_Follow> get copyWith =>
      __$FollowCopyWithImpl<_Follow>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FollowToJson(this);
  }
}

abstract class _Follow extends Follow {
  const factory _Follow({String itemId, String uid}) = _$_Follow;
  const _Follow._() : super._();

  factory _Follow.fromJson(Map<String, dynamic> json) = _$_Follow.fromJson;

  @override
  String get itemId;
  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$FollowCopyWith<_Follow> get copyWith => throw _privateConstructorUsedError;
}
