// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_info_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserInfoStateTearOff {
  const _$UserInfoStateTearOff();

  _UserInfoState call({UserModel user = const UserModel()}) {
    return _UserInfoState(
      user: user,
    );
  }
}

/// @nodoc
const $UserInfoState = _$UserInfoStateTearOff();

/// @nodoc
mixin _$UserInfoState {
  UserModel get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserInfoStateCopyWith<UserInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoStateCopyWith<$Res> {
  factory $UserInfoStateCopyWith(
          UserInfoState value, $Res Function(UserInfoState) then) =
      _$UserInfoStateCopyWithImpl<$Res>;
  $Res call({UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$UserInfoStateCopyWithImpl<$Res>
    implements $UserInfoStateCopyWith<$Res> {
  _$UserInfoStateCopyWithImpl(this._value, this._then);

  final UserInfoState _value;
  // ignore: unused_field
  final $Res Function(UserInfoState) _then;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  @override
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$UserInfoStateCopyWith<$Res>
    implements $UserInfoStateCopyWith<$Res> {
  factory _$UserInfoStateCopyWith(
          _UserInfoState value, $Res Function(_UserInfoState) then) =
      __$UserInfoStateCopyWithImpl<$Res>;
  @override
  $Res call({UserModel user});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$UserInfoStateCopyWithImpl<$Res>
    extends _$UserInfoStateCopyWithImpl<$Res>
    implements _$UserInfoStateCopyWith<$Res> {
  __$UserInfoStateCopyWithImpl(
      _UserInfoState _value, $Res Function(_UserInfoState) _then)
      : super(_value, (v) => _then(v as _UserInfoState));

  @override
  _UserInfoState get _value => super._value as _UserInfoState;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_UserInfoState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$_UserInfoState extends _UserInfoState {
  const _$_UserInfoState({this.user = const UserModel()}) : super._();

  @JsonKey()
  @override
  final UserModel user;

  @override
  String toString() {
    return 'UserInfoState(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserInfoState &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$UserInfoStateCopyWith<_UserInfoState> get copyWith =>
      __$UserInfoStateCopyWithImpl<_UserInfoState>(this, _$identity);
}

abstract class _UserInfoState extends UserInfoState {
  const factory _UserInfoState({UserModel user}) = _$_UserInfoState;
  const _UserInfoState._() : super._();

  @override
  UserModel get user;
  @override
  @JsonKey(ignore: true)
  _$UserInfoStateCopyWith<_UserInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
