// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'config_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConfigStateTearOff {
  const _$ConfigStateTearOff();

  _ConfigState call({bool? isMaintenance, bool? isUpdateCheck}) {
    return _ConfigState(
      isMaintenance: isMaintenance,
      isUpdateCheck: isUpdateCheck,
    );
  }
}

/// @nodoc
const $ConfigState = _$ConfigStateTearOff();

/// @nodoc
mixin _$ConfigState {
  bool? get isMaintenance => throw _privateConstructorUsedError;
  bool? get isUpdateCheck => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConfigStateCopyWith<ConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigStateCopyWith<$Res> {
  factory $ConfigStateCopyWith(
          ConfigState value, $Res Function(ConfigState) then) =
      _$ConfigStateCopyWithImpl<$Res>;
  $Res call({bool? isMaintenance, bool? isUpdateCheck});
}

/// @nodoc
class _$ConfigStateCopyWithImpl<$Res> implements $ConfigStateCopyWith<$Res> {
  _$ConfigStateCopyWithImpl(this._value, this._then);

  final ConfigState _value;
  // ignore: unused_field
  final $Res Function(ConfigState) _then;

  @override
  $Res call({
    Object? isMaintenance = freezed,
    Object? isUpdateCheck = freezed,
  }) {
    return _then(_value.copyWith(
      isMaintenance: isMaintenance == freezed
          ? _value.isMaintenance
          : isMaintenance // ignore: cast_nullable_to_non_nullable
              as bool?,
      isUpdateCheck: isUpdateCheck == freezed
          ? _value.isUpdateCheck
          : isUpdateCheck // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$ConfigStateCopyWith<$Res>
    implements $ConfigStateCopyWith<$Res> {
  factory _$ConfigStateCopyWith(
          _ConfigState value, $Res Function(_ConfigState) then) =
      __$ConfigStateCopyWithImpl<$Res>;
  @override
  $Res call({bool? isMaintenance, bool? isUpdateCheck});
}

/// @nodoc
class __$ConfigStateCopyWithImpl<$Res> extends _$ConfigStateCopyWithImpl<$Res>
    implements _$ConfigStateCopyWith<$Res> {
  __$ConfigStateCopyWithImpl(
      _ConfigState _value, $Res Function(_ConfigState) _then)
      : super(_value, (v) => _then(v as _ConfigState));

  @override
  _ConfigState get _value => super._value as _ConfigState;

  @override
  $Res call({
    Object? isMaintenance = freezed,
    Object? isUpdateCheck = freezed,
  }) {
    return _then(_ConfigState(
      isMaintenance: isMaintenance == freezed
          ? _value.isMaintenance
          : isMaintenance // ignore: cast_nullable_to_non_nullable
              as bool?,
      isUpdateCheck: isUpdateCheck == freezed
          ? _value.isUpdateCheck
          : isUpdateCheck // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_ConfigState implements _ConfigState {
  const _$_ConfigState({this.isMaintenance, this.isUpdateCheck});

  @override
  final bool? isMaintenance;
  @override
  final bool? isUpdateCheck;

  @override
  String toString() {
    return 'ConfigState(isMaintenance: $isMaintenance, isUpdateCheck: $isUpdateCheck)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConfigState &&
            const DeepCollectionEquality()
                .equals(other.isMaintenance, isMaintenance) &&
            const DeepCollectionEquality()
                .equals(other.isUpdateCheck, isUpdateCheck));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isMaintenance),
      const DeepCollectionEquality().hash(isUpdateCheck));

  @JsonKey(ignore: true)
  @override
  _$ConfigStateCopyWith<_ConfigState> get copyWith =>
      __$ConfigStateCopyWithImpl<_ConfigState>(this, _$identity);
}

abstract class _ConfigState implements ConfigState {
  const factory _ConfigState({bool? isMaintenance, bool? isUpdateCheck}) =
      _$_ConfigState;

  @override
  bool? get isMaintenance;
  @override
  bool? get isUpdateCheck;
  @override
  @JsonKey(ignore: true)
  _$ConfigStateCopyWith<_ConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}
