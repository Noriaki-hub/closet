// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'follow_button_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FollowButtonStateTearOff {
  const _$FollowButtonStateTearOff();

  _FollowButtonState call(
      {List<Follow> myFollowState = const <Follow>[],
      List<Follow> yourFollowerState = const <Follow>[],
      bool myAccountState = true}) {
    return _FollowButtonState(
      myFollowState: myFollowState,
      yourFollowerState: yourFollowerState,
      myAccountState: myAccountState,
    );
  }
}

/// @nodoc
const $FollowButtonState = _$FollowButtonStateTearOff();

/// @nodoc
mixin _$FollowButtonState {
  List<Follow> get myFollowState => throw _privateConstructorUsedError;
  List<Follow> get yourFollowerState => throw _privateConstructorUsedError;
  bool get myAccountState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowButtonStateCopyWith<FollowButtonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowButtonStateCopyWith<$Res> {
  factory $FollowButtonStateCopyWith(
          FollowButtonState value, $Res Function(FollowButtonState) then) =
      _$FollowButtonStateCopyWithImpl<$Res>;
  $Res call(
      {List<Follow> myFollowState,
      List<Follow> yourFollowerState,
      bool myAccountState});
}

/// @nodoc
class _$FollowButtonStateCopyWithImpl<$Res>
    implements $FollowButtonStateCopyWith<$Res> {
  _$FollowButtonStateCopyWithImpl(this._value, this._then);

  final FollowButtonState _value;
  // ignore: unused_field
  final $Res Function(FollowButtonState) _then;

  @override
  $Res call({
    Object? myFollowState = freezed,
    Object? yourFollowerState = freezed,
    Object? myAccountState = freezed,
  }) {
    return _then(_value.copyWith(
      myFollowState: myFollowState == freezed
          ? _value.myFollowState
          : myFollowState // ignore: cast_nullable_to_non_nullable
              as List<Follow>,
      yourFollowerState: yourFollowerState == freezed
          ? _value.yourFollowerState
          : yourFollowerState // ignore: cast_nullable_to_non_nullable
              as List<Follow>,
      myAccountState: myAccountState == freezed
          ? _value.myAccountState
          : myAccountState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$FollowButtonStateCopyWith<$Res>
    implements $FollowButtonStateCopyWith<$Res> {
  factory _$FollowButtonStateCopyWith(
          _FollowButtonState value, $Res Function(_FollowButtonState) then) =
      __$FollowButtonStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Follow> myFollowState,
      List<Follow> yourFollowerState,
      bool myAccountState});
}

/// @nodoc
class __$FollowButtonStateCopyWithImpl<$Res>
    extends _$FollowButtonStateCopyWithImpl<$Res>
    implements _$FollowButtonStateCopyWith<$Res> {
  __$FollowButtonStateCopyWithImpl(
      _FollowButtonState _value, $Res Function(_FollowButtonState) _then)
      : super(_value, (v) => _then(v as _FollowButtonState));

  @override
  _FollowButtonState get _value => super._value as _FollowButtonState;

  @override
  $Res call({
    Object? myFollowState = freezed,
    Object? yourFollowerState = freezed,
    Object? myAccountState = freezed,
  }) {
    return _then(_FollowButtonState(
      myFollowState: myFollowState == freezed
          ? _value.myFollowState
          : myFollowState // ignore: cast_nullable_to_non_nullable
              as List<Follow>,
      yourFollowerState: yourFollowerState == freezed
          ? _value.yourFollowerState
          : yourFollowerState // ignore: cast_nullable_to_non_nullable
              as List<Follow>,
      myAccountState: myAccountState == freezed
          ? _value.myAccountState
          : myAccountState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FollowButtonState extends _FollowButtonState {
  const _$_FollowButtonState(
      {this.myFollowState = const <Follow>[],
      this.yourFollowerState = const <Follow>[],
      this.myAccountState = true})
      : super._();

  @JsonKey()
  @override
  final List<Follow> myFollowState;
  @JsonKey()
  @override
  final List<Follow> yourFollowerState;
  @JsonKey()
  @override
  final bool myAccountState;

  @override
  String toString() {
    return 'FollowButtonState(myFollowState: $myFollowState, yourFollowerState: $yourFollowerState, myAccountState: $myAccountState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowButtonState &&
            const DeepCollectionEquality()
                .equals(other.myFollowState, myFollowState) &&
            const DeepCollectionEquality()
                .equals(other.yourFollowerState, yourFollowerState) &&
            const DeepCollectionEquality()
                .equals(other.myAccountState, myAccountState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(myFollowState),
      const DeepCollectionEquality().hash(yourFollowerState),
      const DeepCollectionEquality().hash(myAccountState));

  @JsonKey(ignore: true)
  @override
  _$FollowButtonStateCopyWith<_FollowButtonState> get copyWith =>
      __$FollowButtonStateCopyWithImpl<_FollowButtonState>(this, _$identity);
}

abstract class _FollowButtonState extends FollowButtonState {
  const factory _FollowButtonState(
      {List<Follow> myFollowState,
      List<Follow> yourFollowerState,
      bool myAccountState}) = _$_FollowButtonState;
  const _FollowButtonState._() : super._();

  @override
  List<Follow> get myFollowState;
  @override
  List<Follow> get yourFollowerState;
  @override
  bool get myAccountState;
  @override
  @JsonKey(ignore: true)
  _$FollowButtonStateCopyWith<_FollowButtonState> get copyWith =>
      throw _privateConstructorUsedError;
}
