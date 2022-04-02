// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'media_log_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MediaLogPageStateTearOff {
  const _$MediaLogPageStateTearOff();

  _MediaLogPageState call(
      {List<Share> timeLineList = const <Share>[],
      bool isLoading = false,
      bool isAddClothes = true}) {
    return _MediaLogPageState(
      timeLineList: timeLineList,
      isLoading: isLoading,
      isAddClothes: isAddClothes,
    );
  }
}

/// @nodoc
const $MediaLogPageState = _$MediaLogPageStateTearOff();

/// @nodoc
mixin _$MediaLogPageState {
  List<Share> get timeLineList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isAddClothes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaLogPageStateCopyWith<MediaLogPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaLogPageStateCopyWith<$Res> {
  factory $MediaLogPageStateCopyWith(
          MediaLogPageState value, $Res Function(MediaLogPageState) then) =
      _$MediaLogPageStateCopyWithImpl<$Res>;
  $Res call({List<Share> timeLineList, bool isLoading, bool isAddClothes});
}

/// @nodoc
class _$MediaLogPageStateCopyWithImpl<$Res>
    implements $MediaLogPageStateCopyWith<$Res> {
  _$MediaLogPageStateCopyWithImpl(this._value, this._then);

  final MediaLogPageState _value;
  // ignore: unused_field
  final $Res Function(MediaLogPageState) _then;

  @override
  $Res call({
    Object? timeLineList = freezed,
    Object? isLoading = freezed,
    Object? isAddClothes = freezed,
  }) {
    return _then(_value.copyWith(
      timeLineList: timeLineList == freezed
          ? _value.timeLineList
          : timeLineList // ignore: cast_nullable_to_non_nullable
              as List<Share>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddClothes: isAddClothes == freezed
          ? _value.isAddClothes
          : isAddClothes // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$MediaLogPageStateCopyWith<$Res>
    implements $MediaLogPageStateCopyWith<$Res> {
  factory _$MediaLogPageStateCopyWith(
          _MediaLogPageState value, $Res Function(_MediaLogPageState) then) =
      __$MediaLogPageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Share> timeLineList, bool isLoading, bool isAddClothes});
}

/// @nodoc
class __$MediaLogPageStateCopyWithImpl<$Res>
    extends _$MediaLogPageStateCopyWithImpl<$Res>
    implements _$MediaLogPageStateCopyWith<$Res> {
  __$MediaLogPageStateCopyWithImpl(
      _MediaLogPageState _value, $Res Function(_MediaLogPageState) _then)
      : super(_value, (v) => _then(v as _MediaLogPageState));

  @override
  _MediaLogPageState get _value => super._value as _MediaLogPageState;

  @override
  $Res call({
    Object? timeLineList = freezed,
    Object? isLoading = freezed,
    Object? isAddClothes = freezed,
  }) {
    return _then(_MediaLogPageState(
      timeLineList: timeLineList == freezed
          ? _value.timeLineList
          : timeLineList // ignore: cast_nullable_to_non_nullable
              as List<Share>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddClothes: isAddClothes == freezed
          ? _value.isAddClothes
          : isAddClothes // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MediaLogPageState extends _MediaLogPageState {
  const _$_MediaLogPageState(
      {this.timeLineList = const <Share>[],
      this.isLoading = false,
      this.isAddClothes = true})
      : super._();

  @JsonKey()
  @override
  final List<Share> timeLineList;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final bool isAddClothes;

  @override
  String toString() {
    return 'MediaLogPageState(timeLineList: $timeLineList, isLoading: $isLoading, isAddClothes: $isAddClothes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MediaLogPageState &&
            const DeepCollectionEquality()
                .equals(other.timeLineList, timeLineList) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isAddClothes, isAddClothes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(timeLineList),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isAddClothes));

  @JsonKey(ignore: true)
  @override
  _$MediaLogPageStateCopyWith<_MediaLogPageState> get copyWith =>
      __$MediaLogPageStateCopyWithImpl<_MediaLogPageState>(this, _$identity);
}

abstract class _MediaLogPageState extends MediaLogPageState {
  const factory _MediaLogPageState(
      {List<Share> timeLineList,
      bool isLoading,
      bool isAddClothes}) = _$_MediaLogPageState;
  const _MediaLogPageState._() : super._();

  @override
  List<Share> get timeLineList;
  @override
  bool get isLoading;
  @override
  bool get isAddClothes;
  @override
  @JsonKey(ignore: true)
  _$MediaLogPageStateCopyWith<_MediaLogPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
