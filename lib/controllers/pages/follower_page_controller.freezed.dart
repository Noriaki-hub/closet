// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'follower_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FollowerPageStateTearOff {
  const _$FollowerPageStateTearOff();

  _FollowerPageState call({List<UserModel> followers = const <UserModel>[]}) {
    return _FollowerPageState(
      followers: followers,
    );
  }
}

/// @nodoc
const $FollowerPageState = _$FollowerPageStateTearOff();

/// @nodoc
mixin _$FollowerPageState {
  List<UserModel> get followers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowerPageStateCopyWith<FollowerPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowerPageStateCopyWith<$Res> {
  factory $FollowerPageStateCopyWith(
          FollowerPageState value, $Res Function(FollowerPageState) then) =
      _$FollowerPageStateCopyWithImpl<$Res>;
  $Res call({List<UserModel> followers});
}

/// @nodoc
class _$FollowerPageStateCopyWithImpl<$Res>
    implements $FollowerPageStateCopyWith<$Res> {
  _$FollowerPageStateCopyWithImpl(this._value, this._then);

  final FollowerPageState _value;
  // ignore: unused_field
  final $Res Function(FollowerPageState) _then;

  @override
  $Res call({
    Object? followers = freezed,
  }) {
    return _then(_value.copyWith(
      followers: followers == freezed
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ));
  }
}

/// @nodoc
abstract class _$FollowerPageStateCopyWith<$Res>
    implements $FollowerPageStateCopyWith<$Res> {
  factory _$FollowerPageStateCopyWith(
          _FollowerPageState value, $Res Function(_FollowerPageState) then) =
      __$FollowerPageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<UserModel> followers});
}

/// @nodoc
class __$FollowerPageStateCopyWithImpl<$Res>
    extends _$FollowerPageStateCopyWithImpl<$Res>
    implements _$FollowerPageStateCopyWith<$Res> {
  __$FollowerPageStateCopyWithImpl(
      _FollowerPageState _value, $Res Function(_FollowerPageState) _then)
      : super(_value, (v) => _then(v as _FollowerPageState));

  @override
  _FollowerPageState get _value => super._value as _FollowerPageState;

  @override
  $Res call({
    Object? followers = freezed,
  }) {
    return _then(_FollowerPageState(
      followers: followers == freezed
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ));
  }
}

/// @nodoc

class _$_FollowerPageState extends _FollowerPageState
    with DiagnosticableTreeMixin {
  const _$_FollowerPageState({this.followers = const <UserModel>[]})
      : super._();

  @JsonKey()
  @override
  final List<UserModel> followers;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FollowerPageState(followers: $followers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FollowerPageState'))
      ..add(DiagnosticsProperty('followers', followers));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowerPageState &&
            const DeepCollectionEquality().equals(other.followers, followers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(followers));

  @JsonKey(ignore: true)
  @override
  _$FollowerPageStateCopyWith<_FollowerPageState> get copyWith =>
      __$FollowerPageStateCopyWithImpl<_FollowerPageState>(this, _$identity);
}

abstract class _FollowerPageState extends FollowerPageState {
  const factory _FollowerPageState({List<UserModel> followers}) =
      _$_FollowerPageState;
  const _FollowerPageState._() : super._();

  @override
  List<UserModel> get followers;
  @override
  @JsonKey(ignore: true)
  _$FollowerPageStateCopyWith<_FollowerPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
