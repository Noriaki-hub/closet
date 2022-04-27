// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'brand_view_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BrandViewPageStateTearOff {
  const _$BrandViewPageStateTearOff();

  _BrandViewPageState call(
      {bool isMyFollow = false,
      List<Clothes> clothesList = const <Clothes>[],
      bool isLoadingForFollowState = false}) {
    return _BrandViewPageState(
      isMyFollow: isMyFollow,
      clothesList: clothesList,
      isLoadingForFollowState: isLoadingForFollowState,
    );
  }
}

/// @nodoc
const $BrandViewPageState = _$BrandViewPageStateTearOff();

/// @nodoc
mixin _$BrandViewPageState {
  bool get isMyFollow => throw _privateConstructorUsedError;
  List<Clothes> get clothesList => throw _privateConstructorUsedError;
  bool get isLoadingForFollowState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BrandViewPageStateCopyWith<BrandViewPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandViewPageStateCopyWith<$Res> {
  factory $BrandViewPageStateCopyWith(
          BrandViewPageState value, $Res Function(BrandViewPageState) then) =
      _$BrandViewPageStateCopyWithImpl<$Res>;
  $Res call(
      {bool isMyFollow,
      List<Clothes> clothesList,
      bool isLoadingForFollowState});
}

/// @nodoc
class _$BrandViewPageStateCopyWithImpl<$Res>
    implements $BrandViewPageStateCopyWith<$Res> {
  _$BrandViewPageStateCopyWithImpl(this._value, this._then);

  final BrandViewPageState _value;
  // ignore: unused_field
  final $Res Function(BrandViewPageState) _then;

  @override
  $Res call({
    Object? isMyFollow = freezed,
    Object? clothesList = freezed,
    Object? isLoadingForFollowState = freezed,
  }) {
    return _then(_value.copyWith(
      isMyFollow: isMyFollow == freezed
          ? _value.isMyFollow
          : isMyFollow // ignore: cast_nullable_to_non_nullable
              as bool,
      clothesList: clothesList == freezed
          ? _value.clothesList
          : clothesList // ignore: cast_nullable_to_non_nullable
              as List<Clothes>,
      isLoadingForFollowState: isLoadingForFollowState == freezed
          ? _value.isLoadingForFollowState
          : isLoadingForFollowState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$BrandViewPageStateCopyWith<$Res>
    implements $BrandViewPageStateCopyWith<$Res> {
  factory _$BrandViewPageStateCopyWith(
          _BrandViewPageState value, $Res Function(_BrandViewPageState) then) =
      __$BrandViewPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isMyFollow,
      List<Clothes> clothesList,
      bool isLoadingForFollowState});
}

/// @nodoc
class __$BrandViewPageStateCopyWithImpl<$Res>
    extends _$BrandViewPageStateCopyWithImpl<$Res>
    implements _$BrandViewPageStateCopyWith<$Res> {
  __$BrandViewPageStateCopyWithImpl(
      _BrandViewPageState _value, $Res Function(_BrandViewPageState) _then)
      : super(_value, (v) => _then(v as _BrandViewPageState));

  @override
  _BrandViewPageState get _value => super._value as _BrandViewPageState;

  @override
  $Res call({
    Object? isMyFollow = freezed,
    Object? clothesList = freezed,
    Object? isLoadingForFollowState = freezed,
  }) {
    return _then(_BrandViewPageState(
      isMyFollow: isMyFollow == freezed
          ? _value.isMyFollow
          : isMyFollow // ignore: cast_nullable_to_non_nullable
              as bool,
      clothesList: clothesList == freezed
          ? _value.clothesList
          : clothesList // ignore: cast_nullable_to_non_nullable
              as List<Clothes>,
      isLoadingForFollowState: isLoadingForFollowState == freezed
          ? _value.isLoadingForFollowState
          : isLoadingForFollowState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BrandViewPageState extends _BrandViewPageState
    with DiagnosticableTreeMixin {
  const _$_BrandViewPageState(
      {this.isMyFollow = false,
      this.clothesList = const <Clothes>[],
      this.isLoadingForFollowState = false})
      : super._();

  @JsonKey()
  @override
  final bool isMyFollow;
  @JsonKey()
  @override
  final List<Clothes> clothesList;
  @JsonKey()
  @override
  final bool isLoadingForFollowState;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BrandViewPageState(isMyFollow: $isMyFollow, clothesList: $clothesList, isLoadingForFollowState: $isLoadingForFollowState)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BrandViewPageState'))
      ..add(DiagnosticsProperty('isMyFollow', isMyFollow))
      ..add(DiagnosticsProperty('clothesList', clothesList))
      ..add(DiagnosticsProperty(
          'isLoadingForFollowState', isLoadingForFollowState));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BrandViewPageState &&
            const DeepCollectionEquality()
                .equals(other.isMyFollow, isMyFollow) &&
            const DeepCollectionEquality()
                .equals(other.clothesList, clothesList) &&
            const DeepCollectionEquality().equals(
                other.isLoadingForFollowState, isLoadingForFollowState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isMyFollow),
      const DeepCollectionEquality().hash(clothesList),
      const DeepCollectionEquality().hash(isLoadingForFollowState));

  @JsonKey(ignore: true)
  @override
  _$BrandViewPageStateCopyWith<_BrandViewPageState> get copyWith =>
      __$BrandViewPageStateCopyWithImpl<_BrandViewPageState>(this, _$identity);
}

abstract class _BrandViewPageState extends BrandViewPageState {
  const factory _BrandViewPageState(
      {bool isMyFollow,
      List<Clothes> clothesList,
      bool isLoadingForFollowState}) = _$_BrandViewPageState;
  const _BrandViewPageState._() : super._();

  @override
  bool get isMyFollow;
  @override
  List<Clothes> get clothesList;
  @override
  bool get isLoadingForFollowState;
  @override
  @JsonKey(ignore: true)
  _$BrandViewPageStateCopyWith<_BrandViewPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
