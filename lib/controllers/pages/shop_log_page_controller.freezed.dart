// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shop_log_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShopLogPageStateTearOff {
  const _$ShopLogPageStateTearOff();

  _ShopLogPageState call(
      {List<Share> timeLineList = const <Share>[],
      bool isLoading = false,
      bool isAddClothes = true}) {
    return _ShopLogPageState(
      timeLineList: timeLineList,
      isLoading: isLoading,
      isAddClothes: isAddClothes,
    );
  }
}

/// @nodoc
const $ShopLogPageState = _$ShopLogPageStateTearOff();

/// @nodoc
mixin _$ShopLogPageState {
  List<Share> get timeLineList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isAddClothes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopLogPageStateCopyWith<ShopLogPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopLogPageStateCopyWith<$Res> {
  factory $ShopLogPageStateCopyWith(
          ShopLogPageState value, $Res Function(ShopLogPageState) then) =
      _$ShopLogPageStateCopyWithImpl<$Res>;
  $Res call({List<Share> timeLineList, bool isLoading, bool isAddClothes});
}

/// @nodoc
class _$ShopLogPageStateCopyWithImpl<$Res>
    implements $ShopLogPageStateCopyWith<$Res> {
  _$ShopLogPageStateCopyWithImpl(this._value, this._then);

  final ShopLogPageState _value;
  // ignore: unused_field
  final $Res Function(ShopLogPageState) _then;

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
abstract class _$ShopLogPageStateCopyWith<$Res>
    implements $ShopLogPageStateCopyWith<$Res> {
  factory _$ShopLogPageStateCopyWith(
          _ShopLogPageState value, $Res Function(_ShopLogPageState) then) =
      __$ShopLogPageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Share> timeLineList, bool isLoading, bool isAddClothes});
}

/// @nodoc
class __$ShopLogPageStateCopyWithImpl<$Res>
    extends _$ShopLogPageStateCopyWithImpl<$Res>
    implements _$ShopLogPageStateCopyWith<$Res> {
  __$ShopLogPageStateCopyWithImpl(
      _ShopLogPageState _value, $Res Function(_ShopLogPageState) _then)
      : super(_value, (v) => _then(v as _ShopLogPageState));

  @override
  _ShopLogPageState get _value => super._value as _ShopLogPageState;

  @override
  $Res call({
    Object? timeLineList = freezed,
    Object? isLoading = freezed,
    Object? isAddClothes = freezed,
  }) {
    return _then(_ShopLogPageState(
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

class _$_ShopLogPageState extends _ShopLogPageState {
  const _$_ShopLogPageState(
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
    return 'ShopLogPageState(timeLineList: $timeLineList, isLoading: $isLoading, isAddClothes: $isAddClothes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShopLogPageState &&
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
  _$ShopLogPageStateCopyWith<_ShopLogPageState> get copyWith =>
      __$ShopLogPageStateCopyWithImpl<_ShopLogPageState>(this, _$identity);
}

abstract class _ShopLogPageState extends ShopLogPageState {
  const factory _ShopLogPageState(
      {List<Share> timeLineList,
      bool isLoading,
      bool isAddClothes}) = _$_ShopLogPageState;
  const _ShopLogPageState._() : super._();

  @override
  List<Share> get timeLineList;
  @override
  bool get isLoading;
  @override
  bool get isAddClothes;
  @override
  @JsonKey(ignore: true)
  _$ShopLogPageStateCopyWith<_ShopLogPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
