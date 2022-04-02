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
      {List<Follow> MyFollowState = const <Follow>[],
      List<Follow> YourFollowerState = const <Follow>[],
      bool MyAccountState = true}) {
    return _FollowButtonState(
      MyFollowState: MyFollowState,
      YourFollowerState: YourFollowerState,
      MyAccountState: MyAccountState,
    );
  }
}

/// @nodoc
const $FollowButtonState = _$FollowButtonStateTearOff();

/// @nodoc
mixin _$FollowButtonState {
  List<Follow> get MyFollowState => throw _privateConstructorUsedError;
  List<Follow> get YourFollowerState => throw _privateConstructorUsedError;
  bool get MyAccountState => throw _privateConstructorUsedError;

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
      {List<Follow> MyFollowState,
      List<Follow> YourFollowerState,
      bool MyAccountState});
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
    Object? MyFollowState = freezed,
    Object? YourFollowerState = freezed,
    Object? MyAccountState = freezed,
  }) {
    return _then(_value.copyWith(
      MyFollowState: MyFollowState == freezed
          ? _value.MyFollowState
          : MyFollowState // ignore: cast_nullable_to_non_nullable
              as List<Follow>,
      YourFollowerState: YourFollowerState == freezed
          ? _value.YourFollowerState
          : YourFollowerState // ignore: cast_nullable_to_non_nullable
              as List<Follow>,
      MyAccountState: MyAccountState == freezed
          ? _value.MyAccountState
          : MyAccountState // ignore: cast_nullable_to_non_nullable
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
      {List<Follow> MyFollowState,
      List<Follow> YourFollowerState,
      bool MyAccountState});
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
    Object? MyFollowState = freezed,
    Object? YourFollowerState = freezed,
    Object? MyAccountState = freezed,
  }) {
    return _then(_FollowButtonState(
      MyFollowState: MyFollowState == freezed
          ? _value.MyFollowState
          : MyFollowState // ignore: cast_nullable_to_non_nullable
              as List<Follow>,
      YourFollowerState: YourFollowerState == freezed
          ? _value.YourFollowerState
          : YourFollowerState // ignore: cast_nullable_to_non_nullable
              as List<Follow>,
      MyAccountState: MyAccountState == freezed
          ? _value.MyAccountState
          : MyAccountState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FollowButtonState extends _FollowButtonState {
  const _$_FollowButtonState(
      {this.MyFollowState = const <Follow>[],
      this.YourFollowerState = const <Follow>[],
      this.MyAccountState = true})
      : super._();

  @JsonKey()
  @override
  final List<Follow> MyFollowState;
  @JsonKey()
  @override
  final List<Follow> YourFollowerState;
  @JsonKey()
  @override
  final bool MyAccountState;

  @override
  String toString() {
    return 'FollowButtonState(MyFollowState: $MyFollowState, YourFollowerState: $YourFollowerState, MyAccountState: $MyAccountState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowButtonState &&
            const DeepCollectionEquality()
                .equals(other.MyFollowState, MyFollowState) &&
            const DeepCollectionEquality()
                .equals(other.YourFollowerState, YourFollowerState) &&
            const DeepCollectionEquality()
                .equals(other.MyAccountState, MyAccountState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(MyFollowState),
      const DeepCollectionEquality().hash(YourFollowerState),
      const DeepCollectionEquality().hash(MyAccountState));

  @JsonKey(ignore: true)
  @override
  _$FollowButtonStateCopyWith<_FollowButtonState> get copyWith =>
      __$FollowButtonStateCopyWithImpl<_FollowButtonState>(this, _$identity);
}

abstract class _FollowButtonState extends FollowButtonState {
  const factory _FollowButtonState(
      {List<Follow> MyFollowState,
      List<Follow> YourFollowerState,
      bool MyAccountState}) = _$_FollowButtonState;
  const _FollowButtonState._() : super._();

  @override
  List<Follow> get MyFollowState;
  @override
  List<Follow> get YourFollowerState;
  @override
  bool get MyAccountState;
  @override
  @JsonKey(ignore: true)
  _$FollowButtonStateCopyWith<_FollowButtonState> get copyWith =>
      throw _privateConstructorUsedError;
}
