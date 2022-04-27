// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'follow_brand_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FollowBrandPageStateTearOff {
  const _$FollowBrandPageStateTearOff();

  _FollowBrandPageState call(
      {List<Brand> follows = const <Brand>[], bool isLoading = false}) {
    return _FollowBrandPageState(
      follows: follows,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
const $FollowBrandPageState = _$FollowBrandPageStateTearOff();

/// @nodoc
mixin _$FollowBrandPageState {
  List<Brand> get follows => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowBrandPageStateCopyWith<FollowBrandPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowBrandPageStateCopyWith<$Res> {
  factory $FollowBrandPageStateCopyWith(FollowBrandPageState value,
          $Res Function(FollowBrandPageState) then) =
      _$FollowBrandPageStateCopyWithImpl<$Res>;
  $Res call({List<Brand> follows, bool isLoading});
}

/// @nodoc
class _$FollowBrandPageStateCopyWithImpl<$Res>
    implements $FollowBrandPageStateCopyWith<$Res> {
  _$FollowBrandPageStateCopyWithImpl(this._value, this._then);

  final FollowBrandPageState _value;
  // ignore: unused_field
  final $Res Function(FollowBrandPageState) _then;

  @override
  $Res call({
    Object? follows = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      follows: follows == freezed
          ? _value.follows
          : follows // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$FollowBrandPageStateCopyWith<$Res>
    implements $FollowBrandPageStateCopyWith<$Res> {
  factory _$FollowBrandPageStateCopyWith(_FollowBrandPageState value,
          $Res Function(_FollowBrandPageState) then) =
      __$FollowBrandPageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Brand> follows, bool isLoading});
}

/// @nodoc
class __$FollowBrandPageStateCopyWithImpl<$Res>
    extends _$FollowBrandPageStateCopyWithImpl<$Res>
    implements _$FollowBrandPageStateCopyWith<$Res> {
  __$FollowBrandPageStateCopyWithImpl(
      _FollowBrandPageState _value, $Res Function(_FollowBrandPageState) _then)
      : super(_value, (v) => _then(v as _FollowBrandPageState));

  @override
  _FollowBrandPageState get _value => super._value as _FollowBrandPageState;

  @override
  $Res call({
    Object? follows = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_FollowBrandPageState(
      follows: follows == freezed
          ? _value.follows
          : follows // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FollowBrandPageState extends _FollowBrandPageState
    with DiagnosticableTreeMixin {
  const _$_FollowBrandPageState(
      {this.follows = const <Brand>[], this.isLoading = false})
      : super._();

  @JsonKey()
  @override
  final List<Brand> follows;
  @JsonKey()
  @override
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FollowBrandPageState(follows: $follows, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FollowBrandPageState'))
      ..add(DiagnosticsProperty('follows', follows))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowBrandPageState &&
            const DeepCollectionEquality().equals(other.follows, follows) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(follows),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$FollowBrandPageStateCopyWith<_FollowBrandPageState> get copyWith =>
      __$FollowBrandPageStateCopyWithImpl<_FollowBrandPageState>(
          this, _$identity);
}

abstract class _FollowBrandPageState extends FollowBrandPageState {
  const factory _FollowBrandPageState({List<Brand> follows, bool isLoading}) =
      _$_FollowBrandPageState;
  const _FollowBrandPageState._() : super._();

  @override
  List<Brand> get follows;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$FollowBrandPageStateCopyWith<_FollowBrandPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
