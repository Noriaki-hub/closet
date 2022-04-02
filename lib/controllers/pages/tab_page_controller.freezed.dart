// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tab_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TabPageStateTearOff {
  const _$TabPageStateTearOff();

  _TabPageState call({String image = ''}) {
    return _TabPageState(
      image: image,
    );
  }
}

/// @nodoc
const $TabPageState = _$TabPageStateTearOff();

/// @nodoc
mixin _$TabPageState {
  String get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TabPageStateCopyWith<TabPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabPageStateCopyWith<$Res> {
  factory $TabPageStateCopyWith(
          TabPageState value, $Res Function(TabPageState) then) =
      _$TabPageStateCopyWithImpl<$Res>;
  $Res call({String image});
}

/// @nodoc
class _$TabPageStateCopyWithImpl<$Res> implements $TabPageStateCopyWith<$Res> {
  _$TabPageStateCopyWithImpl(this._value, this._then);

  final TabPageState _value;
  // ignore: unused_field
  final $Res Function(TabPageState) _then;

  @override
  $Res call({
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TabPageStateCopyWith<$Res>
    implements $TabPageStateCopyWith<$Res> {
  factory _$TabPageStateCopyWith(
          _TabPageState value, $Res Function(_TabPageState) then) =
      __$TabPageStateCopyWithImpl<$Res>;
  @override
  $Res call({String image});
}

/// @nodoc
class __$TabPageStateCopyWithImpl<$Res> extends _$TabPageStateCopyWithImpl<$Res>
    implements _$TabPageStateCopyWith<$Res> {
  __$TabPageStateCopyWithImpl(
      _TabPageState _value, $Res Function(_TabPageState) _then)
      : super(_value, (v) => _then(v as _TabPageState));

  @override
  _TabPageState get _value => super._value as _TabPageState;

  @override
  $Res call({
    Object? image = freezed,
  }) {
    return _then(_TabPageState(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TabPageState extends _TabPageState with DiagnosticableTreeMixin {
  const _$_TabPageState({this.image = ''}) : super._();

  @JsonKey()
  @override
  final String image;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TabPageState(image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TabPageState'))
      ..add(DiagnosticsProperty('image', image));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TabPageState &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$TabPageStateCopyWith<_TabPageState> get copyWith =>
      __$TabPageStateCopyWithImpl<_TabPageState>(this, _$identity);
}

abstract class _TabPageState extends TabPageState {
  const factory _TabPageState({String image}) = _$_TabPageState;
  const _TabPageState._() : super._();

  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$TabPageStateCopyWith<_TabPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
