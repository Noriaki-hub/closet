// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shop_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShopPageStateTearOff {
  const _$ShopPageStateTearOff();

  _ShopPageState call({List<Shop> shops = const <Shop>[]}) {
    return _ShopPageState(
      shops: shops,
    );
  }
}

/// @nodoc
const $ShopPageState = _$ShopPageStateTearOff();

/// @nodoc
mixin _$ShopPageState {
  List<Shop> get shops => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopPageStateCopyWith<ShopPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopPageStateCopyWith<$Res> {
  factory $ShopPageStateCopyWith(
          ShopPageState value, $Res Function(ShopPageState) then) =
      _$ShopPageStateCopyWithImpl<$Res>;
  $Res call({List<Shop> shops});
}

/// @nodoc
class _$ShopPageStateCopyWithImpl<$Res>
    implements $ShopPageStateCopyWith<$Res> {
  _$ShopPageStateCopyWithImpl(this._value, this._then);

  final ShopPageState _value;
  // ignore: unused_field
  final $Res Function(ShopPageState) _then;

  @override
  $Res call({
    Object? shops = freezed,
  }) {
    return _then(_value.copyWith(
      shops: shops == freezed
          ? _value.shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<Shop>,
    ));
  }
}

/// @nodoc
abstract class _$ShopPageStateCopyWith<$Res>
    implements $ShopPageStateCopyWith<$Res> {
  factory _$ShopPageStateCopyWith(
          _ShopPageState value, $Res Function(_ShopPageState) then) =
      __$ShopPageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Shop> shops});
}

/// @nodoc
class __$ShopPageStateCopyWithImpl<$Res>
    extends _$ShopPageStateCopyWithImpl<$Res>
    implements _$ShopPageStateCopyWith<$Res> {
  __$ShopPageStateCopyWithImpl(
      _ShopPageState _value, $Res Function(_ShopPageState) _then)
      : super(_value, (v) => _then(v as _ShopPageState));

  @override
  _ShopPageState get _value => super._value as _ShopPageState;

  @override
  $Res call({
    Object? shops = freezed,
  }) {
    return _then(_ShopPageState(
      shops: shops == freezed
          ? _value.shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<Shop>,
    ));
  }
}

/// @nodoc

class _$_ShopPageState extends _ShopPageState with DiagnosticableTreeMixin {
  const _$_ShopPageState({this.shops = const <Shop>[]}) : super._();

  @JsonKey()
  @override
  final List<Shop> shops;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShopPageState(shops: $shops)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShopPageState'))
      ..add(DiagnosticsProperty('shops', shops));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShopPageState &&
            const DeepCollectionEquality().equals(other.shops, shops));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(shops));

  @JsonKey(ignore: true)
  @override
  _$ShopPageStateCopyWith<_ShopPageState> get copyWith =>
      __$ShopPageStateCopyWithImpl<_ShopPageState>(this, _$identity);
}

abstract class _ShopPageState extends ShopPageState {
  const factory _ShopPageState({List<Shop> shops}) = _$_ShopPageState;
  const _ShopPageState._() : super._();

  @override
  List<Shop> get shops;
  @override
  @JsonKey(ignore: true)
  _$ShopPageStateCopyWith<_ShopPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
