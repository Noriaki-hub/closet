// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notice_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NoticeStateTearOff {
  const _$NoticeStateTearOff();

  _NoticeState call(
      {List<Notice> notices = const <Notice>[], String version = ''}) {
    return _NoticeState(
      notices: notices,
      version: version,
    );
  }
}

/// @nodoc
const $NoticeState = _$NoticeStateTearOff();

/// @nodoc
mixin _$NoticeState {
  List<Notice> get notices => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoticeStateCopyWith<NoticeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeStateCopyWith<$Res> {
  factory $NoticeStateCopyWith(
          NoticeState value, $Res Function(NoticeState) then) =
      _$NoticeStateCopyWithImpl<$Res>;
  $Res call({List<Notice> notices, String version});
}

/// @nodoc
class _$NoticeStateCopyWithImpl<$Res> implements $NoticeStateCopyWith<$Res> {
  _$NoticeStateCopyWithImpl(this._value, this._then);

  final NoticeState _value;
  // ignore: unused_field
  final $Res Function(NoticeState) _then;

  @override
  $Res call({
    Object? notices = freezed,
    Object? version = freezed,
  }) {
    return _then(_value.copyWith(
      notices: notices == freezed
          ? _value.notices
          : notices // ignore: cast_nullable_to_non_nullable
              as List<Notice>,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$NoticeStateCopyWith<$Res>
    implements $NoticeStateCopyWith<$Res> {
  factory _$NoticeStateCopyWith(
          _NoticeState value, $Res Function(_NoticeState) then) =
      __$NoticeStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Notice> notices, String version});
}

/// @nodoc
class __$NoticeStateCopyWithImpl<$Res> extends _$NoticeStateCopyWithImpl<$Res>
    implements _$NoticeStateCopyWith<$Res> {
  __$NoticeStateCopyWithImpl(
      _NoticeState _value, $Res Function(_NoticeState) _then)
      : super(_value, (v) => _then(v as _NoticeState));

  @override
  _NoticeState get _value => super._value as _NoticeState;

  @override
  $Res call({
    Object? notices = freezed,
    Object? version = freezed,
  }) {
    return _then(_NoticeState(
      notices: notices == freezed
          ? _value.notices
          : notices // ignore: cast_nullable_to_non_nullable
              as List<Notice>,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NoticeState implements _NoticeState {
  const _$_NoticeState({this.notices = const <Notice>[], this.version = ''});

  @JsonKey()
  @override
  final List<Notice> notices;
  @JsonKey()
  @override
  final String version;

  @override
  String toString() {
    return 'NoticeState(notices: $notices, version: $version)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoticeState &&
            const DeepCollectionEquality().equals(other.notices, notices) &&
            const DeepCollectionEquality().equals(other.version, version));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(notices),
      const DeepCollectionEquality().hash(version));

  @JsonKey(ignore: true)
  @override
  _$NoticeStateCopyWith<_NoticeState> get copyWith =>
      __$NoticeStateCopyWithImpl<_NoticeState>(this, _$identity);
}

abstract class _NoticeState implements NoticeState {
  const factory _NoticeState({List<Notice> notices, String version}) =
      _$_NoticeState;

  @override
  List<Notice> get notices;
  @override
  String get version;
  @override
  @JsonKey(ignore: true)
  _$NoticeStateCopyWith<_NoticeState> get copyWith =>
      throw _privateConstructorUsedError;
}
