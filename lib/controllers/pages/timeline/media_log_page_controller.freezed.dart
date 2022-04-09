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
      {Map<Share, UserModel> logMap = const <Share, UserModel>{},
      bool isLoading = false,
      List<Share> logList = const <Share>[],
      String lastItemId = '',
      bool isAddClothes = true}) {
    return _MediaLogPageState(
      logMap: logMap,
      isLoading: isLoading,
      logList: logList,
      lastItemId: lastItemId,
      isAddClothes: isAddClothes,
    );
  }
}

/// @nodoc
const $MediaLogPageState = _$MediaLogPageStateTearOff();

/// @nodoc
mixin _$MediaLogPageState {
  Map<Share, UserModel> get logMap => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<Share> get logList => throw _privateConstructorUsedError;
  String get lastItemId => throw _privateConstructorUsedError;
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
  $Res call(
      {Map<Share, UserModel> logMap,
      bool isLoading,
      List<Share> logList,
      String lastItemId,
      bool isAddClothes});
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
    Object? logMap = freezed,
    Object? isLoading = freezed,
    Object? logList = freezed,
    Object? lastItemId = freezed,
    Object? isAddClothes = freezed,
  }) {
    return _then(_value.copyWith(
      logMap: logMap == freezed
          ? _value.logMap
          : logMap // ignore: cast_nullable_to_non_nullable
              as Map<Share, UserModel>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      logList: logList == freezed
          ? _value.logList
          : logList // ignore: cast_nullable_to_non_nullable
              as List<Share>,
      lastItemId: lastItemId == freezed
          ? _value.lastItemId
          : lastItemId // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call(
      {Map<Share, UserModel> logMap,
      bool isLoading,
      List<Share> logList,
      String lastItemId,
      bool isAddClothes});
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
    Object? logMap = freezed,
    Object? isLoading = freezed,
    Object? logList = freezed,
    Object? lastItemId = freezed,
    Object? isAddClothes = freezed,
  }) {
    return _then(_MediaLogPageState(
      logMap: logMap == freezed
          ? _value.logMap
          : logMap // ignore: cast_nullable_to_non_nullable
              as Map<Share, UserModel>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      logList: logList == freezed
          ? _value.logList
          : logList // ignore: cast_nullable_to_non_nullable
              as List<Share>,
      lastItemId: lastItemId == freezed
          ? _value.lastItemId
          : lastItemId // ignore: cast_nullable_to_non_nullable
              as String,
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
      {this.logMap = const <Share, UserModel>{},
      this.isLoading = false,
      this.logList = const <Share>[],
      this.lastItemId = '',
      this.isAddClothes = true})
      : super._();

  @JsonKey()
  @override
  final Map<Share, UserModel> logMap;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final List<Share> logList;
  @JsonKey()
  @override
  final String lastItemId;
  @JsonKey()
  @override
  final bool isAddClothes;

  @override
  String toString() {
    return 'MediaLogPageState(logMap: $logMap, isLoading: $isLoading, logList: $logList, lastItemId: $lastItemId, isAddClothes: $isAddClothes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MediaLogPageState &&
            const DeepCollectionEquality().equals(other.logMap, logMap) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.logList, logList) &&
            const DeepCollectionEquality()
                .equals(other.lastItemId, lastItemId) &&
            const DeepCollectionEquality()
                .equals(other.isAddClothes, isAddClothes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(logMap),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(logList),
      const DeepCollectionEquality().hash(lastItemId),
      const DeepCollectionEquality().hash(isAddClothes));

  @JsonKey(ignore: true)
  @override
  _$MediaLogPageStateCopyWith<_MediaLogPageState> get copyWith =>
      __$MediaLogPageStateCopyWithImpl<_MediaLogPageState>(this, _$identity);
}

abstract class _MediaLogPageState extends MediaLogPageState {
  const factory _MediaLogPageState(
      {Map<Share, UserModel> logMap,
      bool isLoading,
      List<Share> logList,
      String lastItemId,
      bool isAddClothes}) = _$_MediaLogPageState;
  const _MediaLogPageState._() : super._();

  @override
  Map<Share, UserModel> get logMap;
  @override
  bool get isLoading;
  @override
  List<Share> get logList;
  @override
  String get lastItemId;
  @override
  bool get isAddClothes;
  @override
  @JsonKey(ignore: true)
  _$MediaLogPageStateCopyWith<_MediaLogPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
