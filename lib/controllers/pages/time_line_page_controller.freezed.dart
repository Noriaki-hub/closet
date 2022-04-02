// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'time_line_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimeLinePageStateTearOff {
  const _$TimeLinePageStateTearOff();

  _TimeLinePageState call(
      {List<Clothes> timeLineList = const <Clothes>[],
      bool isLoading = false,
      bool isAddClothes = true}) {
    return _TimeLinePageState(
      timeLineList: timeLineList,
      isLoading: isLoading,
      isAddClothes: isAddClothes,
    );
  }
}

/// @nodoc
const $TimeLinePageState = _$TimeLinePageStateTearOff();

/// @nodoc
mixin _$TimeLinePageState {
  List<Clothes> get timeLineList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isAddClothes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimeLinePageStateCopyWith<TimeLinePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeLinePageStateCopyWith<$Res> {
  factory $TimeLinePageStateCopyWith(
          TimeLinePageState value, $Res Function(TimeLinePageState) then) =
      _$TimeLinePageStateCopyWithImpl<$Res>;
  $Res call({List<Clothes> timeLineList, bool isLoading, bool isAddClothes});
}

/// @nodoc
class _$TimeLinePageStateCopyWithImpl<$Res>
    implements $TimeLinePageStateCopyWith<$Res> {
  _$TimeLinePageStateCopyWithImpl(this._value, this._then);

  final TimeLinePageState _value;
  // ignore: unused_field
  final $Res Function(TimeLinePageState) _then;

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
              as List<Clothes>,
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
abstract class _$TimeLinePageStateCopyWith<$Res>
    implements $TimeLinePageStateCopyWith<$Res> {
  factory _$TimeLinePageStateCopyWith(
          _TimeLinePageState value, $Res Function(_TimeLinePageState) then) =
      __$TimeLinePageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Clothes> timeLineList, bool isLoading, bool isAddClothes});
}

/// @nodoc
class __$TimeLinePageStateCopyWithImpl<$Res>
    extends _$TimeLinePageStateCopyWithImpl<$Res>
    implements _$TimeLinePageStateCopyWith<$Res> {
  __$TimeLinePageStateCopyWithImpl(
      _TimeLinePageState _value, $Res Function(_TimeLinePageState) _then)
      : super(_value, (v) => _then(v as _TimeLinePageState));

  @override
  _TimeLinePageState get _value => super._value as _TimeLinePageState;

  @override
  $Res call({
    Object? timeLineList = freezed,
    Object? isLoading = freezed,
    Object? isAddClothes = freezed,
  }) {
    return _then(_TimeLinePageState(
      timeLineList: timeLineList == freezed
          ? _value.timeLineList
          : timeLineList // ignore: cast_nullable_to_non_nullable
              as List<Clothes>,
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

class _$_TimeLinePageState extends _TimeLinePageState {
  const _$_TimeLinePageState(
      {this.timeLineList = const <Clothes>[],
      this.isLoading = false,
      this.isAddClothes = true})
      : super._();

  @JsonKey()
  @override
  final List<Clothes> timeLineList;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final bool isAddClothes;

  @override
  String toString() {
    return 'TimeLinePageState(timeLineList: $timeLineList, isLoading: $isLoading, isAddClothes: $isAddClothes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimeLinePageState &&
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
  _$TimeLinePageStateCopyWith<_TimeLinePageState> get copyWith =>
      __$TimeLinePageStateCopyWithImpl<_TimeLinePageState>(this, _$identity);
}

abstract class _TimeLinePageState extends TimeLinePageState {
  const factory _TimeLinePageState(
      {List<Clothes> timeLineList,
      bool isLoading,
      bool isAddClothes}) = _$_TimeLinePageState;
  const _TimeLinePageState._() : super._();

  @override
  List<Clothes> get timeLineList;
  @override
  bool get isLoading;
  @override
  bool get isAddClothes;
  @override
  @JsonKey(ignore: true)
  _$TimeLinePageStateCopyWith<_TimeLinePageState> get copyWith =>
      throw _privateConstructorUsedError;
}
