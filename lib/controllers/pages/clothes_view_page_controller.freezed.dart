// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'clothes_view_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ClothesViewPageStateTearOff {
  const _$ClothesViewPageStateTearOff();

  _ClothesViewPageState call(
      {Clothes? clothes,
      bool isFavoriteState = false,
      bool isEdit = false,
      String buyingFormState = ''}) {
    return _ClothesViewPageState(
      clothes: clothes,
      isFavoriteState: isFavoriteState,
      isEdit: isEdit,
      buyingFormState: buyingFormState,
    );
  }
}

/// @nodoc
const $ClothesViewPageState = _$ClothesViewPageStateTearOff();

/// @nodoc
mixin _$ClothesViewPageState {
  Clothes? get clothes => throw _privateConstructorUsedError;
  bool get isFavoriteState => throw _privateConstructorUsedError;
  bool get isEdit => throw _privateConstructorUsedError;
  String get buyingFormState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClothesViewPageStateCopyWith<ClothesViewPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClothesViewPageStateCopyWith<$Res> {
  factory $ClothesViewPageStateCopyWith(ClothesViewPageState value,
          $Res Function(ClothesViewPageState) then) =
      _$ClothesViewPageStateCopyWithImpl<$Res>;
  $Res call(
      {Clothes? clothes,
      bool isFavoriteState,
      bool isEdit,
      String buyingFormState});

  $ClothesCopyWith<$Res>? get clothes;
}

/// @nodoc
class _$ClothesViewPageStateCopyWithImpl<$Res>
    implements $ClothesViewPageStateCopyWith<$Res> {
  _$ClothesViewPageStateCopyWithImpl(this._value, this._then);

  final ClothesViewPageState _value;
  // ignore: unused_field
  final $Res Function(ClothesViewPageState) _then;

  @override
  $Res call({
    Object? clothes = freezed,
    Object? isFavoriteState = freezed,
    Object? isEdit = freezed,
    Object? buyingFormState = freezed,
  }) {
    return _then(_value.copyWith(
      clothes: clothes == freezed
          ? _value.clothes
          : clothes // ignore: cast_nullable_to_non_nullable
              as Clothes?,
      isFavoriteState: isFavoriteState == freezed
          ? _value.isFavoriteState
          : isFavoriteState // ignore: cast_nullable_to_non_nullable
              as bool,
      isEdit: isEdit == freezed
          ? _value.isEdit
          : isEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      buyingFormState: buyingFormState == freezed
          ? _value.buyingFormState
          : buyingFormState // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $ClothesCopyWith<$Res>? get clothes {
    if (_value.clothes == null) {
      return null;
    }

    return $ClothesCopyWith<$Res>(_value.clothes!, (value) {
      return _then(_value.copyWith(clothes: value));
    });
  }
}

/// @nodoc
abstract class _$ClothesViewPageStateCopyWith<$Res>
    implements $ClothesViewPageStateCopyWith<$Res> {
  factory _$ClothesViewPageStateCopyWith(_ClothesViewPageState value,
          $Res Function(_ClothesViewPageState) then) =
      __$ClothesViewPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Clothes? clothes,
      bool isFavoriteState,
      bool isEdit,
      String buyingFormState});

  @override
  $ClothesCopyWith<$Res>? get clothes;
}

/// @nodoc
class __$ClothesViewPageStateCopyWithImpl<$Res>
    extends _$ClothesViewPageStateCopyWithImpl<$Res>
    implements _$ClothesViewPageStateCopyWith<$Res> {
  __$ClothesViewPageStateCopyWithImpl(
      _ClothesViewPageState _value, $Res Function(_ClothesViewPageState) _then)
      : super(_value, (v) => _then(v as _ClothesViewPageState));

  @override
  _ClothesViewPageState get _value => super._value as _ClothesViewPageState;

  @override
  $Res call({
    Object? clothes = freezed,
    Object? isFavoriteState = freezed,
    Object? isEdit = freezed,
    Object? buyingFormState = freezed,
  }) {
    return _then(_ClothesViewPageState(
      clothes: clothes == freezed
          ? _value.clothes
          : clothes // ignore: cast_nullable_to_non_nullable
              as Clothes?,
      isFavoriteState: isFavoriteState == freezed
          ? _value.isFavoriteState
          : isFavoriteState // ignore: cast_nullable_to_non_nullable
              as bool,
      isEdit: isEdit == freezed
          ? _value.isEdit
          : isEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      buyingFormState: buyingFormState == freezed
          ? _value.buyingFormState
          : buyingFormState // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ClothesViewPageState extends _ClothesViewPageState {
  const _$_ClothesViewPageState(
      {this.clothes,
      this.isFavoriteState = false,
      this.isEdit = false,
      this.buyingFormState = ''})
      : super._();

  @override
  final Clothes? clothes;
  @JsonKey()
  @override
  final bool isFavoriteState;
  @JsonKey()
  @override
  final bool isEdit;
  @JsonKey()
  @override
  final String buyingFormState;

  @override
  String toString() {
    return 'ClothesViewPageState(clothes: $clothes, isFavoriteState: $isFavoriteState, isEdit: $isEdit, buyingFormState: $buyingFormState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClothesViewPageState &&
            const DeepCollectionEquality().equals(other.clothes, clothes) &&
            const DeepCollectionEquality()
                .equals(other.isFavoriteState, isFavoriteState) &&
            const DeepCollectionEquality().equals(other.isEdit, isEdit) &&
            const DeepCollectionEquality()
                .equals(other.buyingFormState, buyingFormState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(clothes),
      const DeepCollectionEquality().hash(isFavoriteState),
      const DeepCollectionEquality().hash(isEdit),
      const DeepCollectionEquality().hash(buyingFormState));

  @JsonKey(ignore: true)
  @override
  _$ClothesViewPageStateCopyWith<_ClothesViewPageState> get copyWith =>
      __$ClothesViewPageStateCopyWithImpl<_ClothesViewPageState>(
          this, _$identity);
}

abstract class _ClothesViewPageState extends ClothesViewPageState {
  const factory _ClothesViewPageState(
      {Clothes? clothes,
      bool isFavoriteState,
      bool isEdit,
      String buyingFormState}) = _$_ClothesViewPageState;
  const _ClothesViewPageState._() : super._();

  @override
  Clothes? get clothes;
  @override
  bool get isFavoriteState;
  @override
  bool get isEdit;
  @override
  String get buyingFormState;
  @override
  @JsonKey(ignore: true)
  _$ClothesViewPageStateCopyWith<_ClothesViewPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
