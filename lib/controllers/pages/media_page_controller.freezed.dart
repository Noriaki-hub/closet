// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'media_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MediaPageStateTearOff {
  const _$MediaPageStateTearOff();

  _MeidaPageState call({List<Media> medias = const <Media>[]}) {
    return _MeidaPageState(
      medias: medias,
    );
  }
}

/// @nodoc
const $MediaPageState = _$MediaPageStateTearOff();

/// @nodoc
mixin _$MediaPageState {
  List<Media> get medias => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaPageStateCopyWith<MediaPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaPageStateCopyWith<$Res> {
  factory $MediaPageStateCopyWith(
          MediaPageState value, $Res Function(MediaPageState) then) =
      _$MediaPageStateCopyWithImpl<$Res>;
  $Res call({List<Media> medias});
}

/// @nodoc
class _$MediaPageStateCopyWithImpl<$Res>
    implements $MediaPageStateCopyWith<$Res> {
  _$MediaPageStateCopyWithImpl(this._value, this._then);

  final MediaPageState _value;
  // ignore: unused_field
  final $Res Function(MediaPageState) _then;

  @override
  $Res call({
    Object? medias = freezed,
  }) {
    return _then(_value.copyWith(
      medias: medias == freezed
          ? _value.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<Media>,
    ));
  }
}

/// @nodoc
abstract class _$MeidaPageStateCopyWith<$Res>
    implements $MediaPageStateCopyWith<$Res> {
  factory _$MeidaPageStateCopyWith(
          _MeidaPageState value, $Res Function(_MeidaPageState) then) =
      __$MeidaPageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Media> medias});
}

/// @nodoc
class __$MeidaPageStateCopyWithImpl<$Res>
    extends _$MediaPageStateCopyWithImpl<$Res>
    implements _$MeidaPageStateCopyWith<$Res> {
  __$MeidaPageStateCopyWithImpl(
      _MeidaPageState _value, $Res Function(_MeidaPageState) _then)
      : super(_value, (v) => _then(v as _MeidaPageState));

  @override
  _MeidaPageState get _value => super._value as _MeidaPageState;

  @override
  $Res call({
    Object? medias = freezed,
  }) {
    return _then(_MeidaPageState(
      medias: medias == freezed
          ? _value.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<Media>,
    ));
  }
}

/// @nodoc

class _$_MeidaPageState extends _MeidaPageState with DiagnosticableTreeMixin {
  const _$_MeidaPageState({this.medias = const <Media>[]}) : super._();

  @JsonKey()
  @override
  final List<Media> medias;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MediaPageState(medias: $medias)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MediaPageState'))
      ..add(DiagnosticsProperty('medias', medias));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MeidaPageState &&
            const DeepCollectionEquality().equals(other.medias, medias));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(medias));

  @JsonKey(ignore: true)
  @override
  _$MeidaPageStateCopyWith<_MeidaPageState> get copyWith =>
      __$MeidaPageStateCopyWithImpl<_MeidaPageState>(this, _$identity);
}

abstract class _MeidaPageState extends MediaPageState {
  const factory _MeidaPageState({List<Media> medias}) = _$_MeidaPageState;
  const _MeidaPageState._() : super._();

  @override
  List<Media> get medias;
  @override
  @JsonKey(ignore: true)
  _$MeidaPageStateCopyWith<_MeidaPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
