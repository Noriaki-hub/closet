// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'like_button_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LikeButtonStateTearOff {
  const _$LikeButtonStateTearOff();

  _LikeButtonState call(
      {List<UserModel> likes = const <UserModel>[],
      List<Like> myLikeState = const <Like>[],
      bool myAccountState = false}) {
    return _LikeButtonState(
      likes: likes,
      myLikeState: myLikeState,
      myAccountState: myAccountState,
    );
  }
}

/// @nodoc
const $LikeButtonState = _$LikeButtonStateTearOff();

/// @nodoc
mixin _$LikeButtonState {
  List<UserModel> get likes => throw _privateConstructorUsedError;
  List<Like> get myLikeState => throw _privateConstructorUsedError;
  bool get myAccountState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikeButtonStateCopyWith<LikeButtonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeButtonStateCopyWith<$Res> {
  factory $LikeButtonStateCopyWith(
          LikeButtonState value, $Res Function(LikeButtonState) then) =
      _$LikeButtonStateCopyWithImpl<$Res>;
  $Res call(
      {List<UserModel> likes, List<Like> myLikeState, bool myAccountState});
}

/// @nodoc
class _$LikeButtonStateCopyWithImpl<$Res>
    implements $LikeButtonStateCopyWith<$Res> {
  _$LikeButtonStateCopyWithImpl(this._value, this._then);

  final LikeButtonState _value;
  // ignore: unused_field
  final $Res Function(LikeButtonState) _then;

  @override
  $Res call({
    Object? likes = freezed,
    Object? myLikeState = freezed,
    Object? myAccountState = freezed,
  }) {
    return _then(_value.copyWith(
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      myLikeState: myLikeState == freezed
          ? _value.myLikeState
          : myLikeState // ignore: cast_nullable_to_non_nullable
              as List<Like>,
      myAccountState: myAccountState == freezed
          ? _value.myAccountState
          : myAccountState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$LikeButtonStateCopyWith<$Res>
    implements $LikeButtonStateCopyWith<$Res> {
  factory _$LikeButtonStateCopyWith(
          _LikeButtonState value, $Res Function(_LikeButtonState) then) =
      __$LikeButtonStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<UserModel> likes, List<Like> myLikeState, bool myAccountState});
}

/// @nodoc
class __$LikeButtonStateCopyWithImpl<$Res>
    extends _$LikeButtonStateCopyWithImpl<$Res>
    implements _$LikeButtonStateCopyWith<$Res> {
  __$LikeButtonStateCopyWithImpl(
      _LikeButtonState _value, $Res Function(_LikeButtonState) _then)
      : super(_value, (v) => _then(v as _LikeButtonState));

  @override
  _LikeButtonState get _value => super._value as _LikeButtonState;

  @override
  $Res call({
    Object? likes = freezed,
    Object? myLikeState = freezed,
    Object? myAccountState = freezed,
  }) {
    return _then(_LikeButtonState(
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      myLikeState: myLikeState == freezed
          ? _value.myLikeState
          : myLikeState // ignore: cast_nullable_to_non_nullable
              as List<Like>,
      myAccountState: myAccountState == freezed
          ? _value.myAccountState
          : myAccountState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LikeButtonState extends _LikeButtonState {
  const _$_LikeButtonState(
      {this.likes = const <UserModel>[],
      this.myLikeState = const <Like>[],
      this.myAccountState = false})
      : super._();

  @JsonKey()
  @override
  final List<UserModel> likes;
  @JsonKey()
  @override
  final List<Like> myLikeState;
  @JsonKey()
  @override
  final bool myAccountState;

  @override
  String toString() {
    return 'LikeButtonState(likes: $likes, myLikeState: $myLikeState, myAccountState: $myAccountState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LikeButtonState &&
            const DeepCollectionEquality().equals(other.likes, likes) &&
            const DeepCollectionEquality()
                .equals(other.myLikeState, myLikeState) &&
            const DeepCollectionEquality()
                .equals(other.myAccountState, myAccountState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(likes),
      const DeepCollectionEquality().hash(myLikeState),
      const DeepCollectionEquality().hash(myAccountState));

  @JsonKey(ignore: true)
  @override
  _$LikeButtonStateCopyWith<_LikeButtonState> get copyWith =>
      __$LikeButtonStateCopyWithImpl<_LikeButtonState>(this, _$identity);
}

abstract class _LikeButtonState extends LikeButtonState {
  const factory _LikeButtonState(
      {List<UserModel> likes,
      List<Like> myLikeState,
      bool myAccountState}) = _$_LikeButtonState;
  const _LikeButtonState._() : super._();

  @override
  List<UserModel> get likes;
  @override
  List<Like> get myLikeState;
  @override
  bool get myAccountState;
  @override
  @JsonKey(ignore: true)
  _$LikeButtonStateCopyWith<_LikeButtonState> get copyWith =>
      throw _privateConstructorUsedError;
}
