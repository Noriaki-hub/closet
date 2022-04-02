// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'follow_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FollowPageStateTearOff {
  const _$FollowPageStateTearOff();

  _FollowPageState call({List<UserModel> follows = const <UserModel>[]}) {
    return _FollowPageState(
      follows: follows,
    );
  }
}

/// @nodoc
const $FollowPageState = _$FollowPageStateTearOff();

/// @nodoc
mixin _$FollowPageState {
  List<UserModel> get follows => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowPageStateCopyWith<FollowPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowPageStateCopyWith<$Res> {
  factory $FollowPageStateCopyWith(
          FollowPageState value, $Res Function(FollowPageState) then) =
      _$FollowPageStateCopyWithImpl<$Res>;
  $Res call({List<UserModel> follows});
}

/// @nodoc
class _$FollowPageStateCopyWithImpl<$Res>
    implements $FollowPageStateCopyWith<$Res> {
  _$FollowPageStateCopyWithImpl(this._value, this._then);

  final FollowPageState _value;
  // ignore: unused_field
  final $Res Function(FollowPageState) _then;

  @override
  $Res call({
    Object? follows = freezed,
  }) {
    return _then(_value.copyWith(
      follows: follows == freezed
          ? _value.follows
          : follows // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ));
  }
}

/// @nodoc
abstract class _$FollowPageStateCopyWith<$Res>
    implements $FollowPageStateCopyWith<$Res> {
  factory _$FollowPageStateCopyWith(
          _FollowPageState value, $Res Function(_FollowPageState) then) =
      __$FollowPageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<UserModel> follows});
}

/// @nodoc
class __$FollowPageStateCopyWithImpl<$Res>
    extends _$FollowPageStateCopyWithImpl<$Res>
    implements _$FollowPageStateCopyWith<$Res> {
  __$FollowPageStateCopyWithImpl(
      _FollowPageState _value, $Res Function(_FollowPageState) _then)
      : super(_value, (v) => _then(v as _FollowPageState));

  @override
  _FollowPageState get _value => super._value as _FollowPageState;

  @override
  $Res call({
    Object? follows = freezed,
  }) {
    return _then(_FollowPageState(
      follows: follows == freezed
          ? _value.follows
          : follows // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ));
  }
}

/// @nodoc

class _$_FollowPageState extends _FollowPageState with DiagnosticableTreeMixin {
  const _$_FollowPageState({this.follows = const <UserModel>[]}) : super._();

  @JsonKey()
  @override
  final List<UserModel> follows;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FollowPageState(follows: $follows)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FollowPageState'))
      ..add(DiagnosticsProperty('follows', follows));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowPageState &&
            const DeepCollectionEquality().equals(other.follows, follows));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(follows));

  @JsonKey(ignore: true)
  @override
  _$FollowPageStateCopyWith<_FollowPageState> get copyWith =>
      __$FollowPageStateCopyWithImpl<_FollowPageState>(this, _$identity);
}

abstract class _FollowPageState extends FollowPageState {
  const factory _FollowPageState({List<UserModel> follows}) =
      _$_FollowPageState;
  const _FollowPageState._() : super._();

  @override
  List<UserModel> get follows;
  @override
  @JsonKey(ignore: true)
  _$FollowPageStateCopyWith<_FollowPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
