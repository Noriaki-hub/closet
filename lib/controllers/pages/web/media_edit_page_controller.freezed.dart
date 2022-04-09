// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'media_edit_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MediaEditPageStateTearOff {
  const _$MediaEditPageStateTearOff();

  _MediaEditPageState call(
      {File? imageFile, String image = '', String url = '', String name = ''}) {
    return _MediaEditPageState(
      imageFile: imageFile,
      image: image,
      url: url,
      name: name,
    );
  }
}

/// @nodoc
const $MediaEditPageState = _$MediaEditPageStateTearOff();

/// @nodoc
mixin _$MediaEditPageState {
  File? get imageFile => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaEditPageStateCopyWith<MediaEditPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaEditPageStateCopyWith<$Res> {
  factory $MediaEditPageStateCopyWith(
          MediaEditPageState value, $Res Function(MediaEditPageState) then) =
      _$MediaEditPageStateCopyWithImpl<$Res>;
  $Res call({File? imageFile, String image, String url, String name});
}

/// @nodoc
class _$MediaEditPageStateCopyWithImpl<$Res>
    implements $MediaEditPageStateCopyWith<$Res> {
  _$MediaEditPageStateCopyWithImpl(this._value, this._then);

  final MediaEditPageState _value;
  // ignore: unused_field
  final $Res Function(MediaEditPageState) _then;

  @override
  $Res call({
    Object? imageFile = freezed,
    Object? image = freezed,
    Object? url = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MediaEditPageStateCopyWith<$Res>
    implements $MediaEditPageStateCopyWith<$Res> {
  factory _$MediaEditPageStateCopyWith(
          _MediaEditPageState value, $Res Function(_MediaEditPageState) then) =
      __$MediaEditPageStateCopyWithImpl<$Res>;
  @override
  $Res call({File? imageFile, String image, String url, String name});
}

/// @nodoc
class __$MediaEditPageStateCopyWithImpl<$Res>
    extends _$MediaEditPageStateCopyWithImpl<$Res>
    implements _$MediaEditPageStateCopyWith<$Res> {
  __$MediaEditPageStateCopyWithImpl(
      _MediaEditPageState _value, $Res Function(_MediaEditPageState) _then)
      : super(_value, (v) => _then(v as _MediaEditPageState));

  @override
  _MediaEditPageState get _value => super._value as _MediaEditPageState;

  @override
  $Res call({
    Object? imageFile = freezed,
    Object? image = freezed,
    Object? url = freezed,
    Object? name = freezed,
  }) {
    return _then(_MediaEditPageState(
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MediaEditPageState extends _MediaEditPageState {
  const _$_MediaEditPageState(
      {this.imageFile, this.image = '', this.url = '', this.name = ''})
      : super._();

  @override
  final File? imageFile;
  @JsonKey()
  @override
  final String image;
  @JsonKey()
  @override
  final String url;
  @JsonKey()
  @override
  final String name;

  @override
  String toString() {
    return 'MediaEditPageState(imageFile: $imageFile, image: $image, url: $url, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MediaEditPageState &&
            const DeepCollectionEquality().equals(other.imageFile, imageFile) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imageFile),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$MediaEditPageStateCopyWith<_MediaEditPageState> get copyWith =>
      __$MediaEditPageStateCopyWithImpl<_MediaEditPageState>(this, _$identity);
}

abstract class _MediaEditPageState extends MediaEditPageState {
  const factory _MediaEditPageState(
      {File? imageFile,
      String image,
      String url,
      String name}) = _$_MediaEditPageState;
  const _MediaEditPageState._() : super._();

  @override
  File? get imageFile;
  @override
  String get image;
  @override
  String get url;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$MediaEditPageStateCopyWith<_MediaEditPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
