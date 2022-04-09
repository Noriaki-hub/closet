// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'media_add_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MediaAddPageStateTearOff {
  const _$MediaAddPageStateTearOff();

  _MediaAddPageState call(
      {File? imageFile, String name = '', String url = '', String image = ''}) {
    return _MediaAddPageState(
      imageFile: imageFile,
      name: name,
      url: url,
      image: image,
    );
  }
}

/// @nodoc
const $MediaAddPageState = _$MediaAddPageStateTearOff();

/// @nodoc
mixin _$MediaAddPageState {
  File? get imageFile => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaAddPageStateCopyWith<MediaAddPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaAddPageStateCopyWith<$Res> {
  factory $MediaAddPageStateCopyWith(
          MediaAddPageState value, $Res Function(MediaAddPageState) then) =
      _$MediaAddPageStateCopyWithImpl<$Res>;
  $Res call({File? imageFile, String name, String url, String image});
}

/// @nodoc
class _$MediaAddPageStateCopyWithImpl<$Res>
    implements $MediaAddPageStateCopyWith<$Res> {
  _$MediaAddPageStateCopyWithImpl(this._value, this._then);

  final MediaAddPageState _value;
  // ignore: unused_field
  final $Res Function(MediaAddPageState) _then;

  @override
  $Res call({
    Object? imageFile = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MediaAddPageStateCopyWith<$Res>
    implements $MediaAddPageStateCopyWith<$Res> {
  factory _$MediaAddPageStateCopyWith(
          _MediaAddPageState value, $Res Function(_MediaAddPageState) then) =
      __$MediaAddPageStateCopyWithImpl<$Res>;
  @override
  $Res call({File? imageFile, String name, String url, String image});
}

/// @nodoc
class __$MediaAddPageStateCopyWithImpl<$Res>
    extends _$MediaAddPageStateCopyWithImpl<$Res>
    implements _$MediaAddPageStateCopyWith<$Res> {
  __$MediaAddPageStateCopyWithImpl(
      _MediaAddPageState _value, $Res Function(_MediaAddPageState) _then)
      : super(_value, (v) => _then(v as _MediaAddPageState));

  @override
  _MediaAddPageState get _value => super._value as _MediaAddPageState;

  @override
  $Res call({
    Object? imageFile = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? image = freezed,
  }) {
    return _then(_MediaAddPageState(
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MediaAddPageState extends _MediaAddPageState {
  const _$_MediaAddPageState(
      {this.imageFile, this.name = '', this.url = '', this.image = ''})
      : super._();

  @override
  final File? imageFile;
  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String url;
  @JsonKey()
  @override
  final String image;

  @override
  String toString() {
    return 'MediaAddPageState(imageFile: $imageFile, name: $name, url: $url, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MediaAddPageState &&
            const DeepCollectionEquality().equals(other.imageFile, imageFile) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imageFile),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$MediaAddPageStateCopyWith<_MediaAddPageState> get copyWith =>
      __$MediaAddPageStateCopyWithImpl<_MediaAddPageState>(this, _$identity);
}

abstract class _MediaAddPageState extends MediaAddPageState {
  const factory _MediaAddPageState(
      {File? imageFile,
      String name,
      String url,
      String image}) = _$_MediaAddPageState;
  const _MediaAddPageState._() : super._();

  @override
  File? get imageFile;
  @override
  String get name;
  @override
  String get url;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$MediaAddPageStateCopyWith<_MediaAddPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
