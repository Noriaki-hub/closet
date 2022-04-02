// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shop_edit_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShopEditPageStateTearOff {
  const _$ShopEditPageStateTearOff();

  _ShopEditPageState call(
      {File? imageFile, String image = '', String url = '', String name = ''}) {
    return _ShopEditPageState(
      imageFile: imageFile,
      image: image,
      url: url,
      name: name,
    );
  }
}

/// @nodoc
const $ShopEditPageState = _$ShopEditPageStateTearOff();

/// @nodoc
mixin _$ShopEditPageState {
  File? get imageFile => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopEditPageStateCopyWith<ShopEditPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopEditPageStateCopyWith<$Res> {
  factory $ShopEditPageStateCopyWith(
          ShopEditPageState value, $Res Function(ShopEditPageState) then) =
      _$ShopEditPageStateCopyWithImpl<$Res>;
  $Res call({File? imageFile, String image, String url, String name});
}

/// @nodoc
class _$ShopEditPageStateCopyWithImpl<$Res>
    implements $ShopEditPageStateCopyWith<$Res> {
  _$ShopEditPageStateCopyWithImpl(this._value, this._then);

  final ShopEditPageState _value;
  // ignore: unused_field
  final $Res Function(ShopEditPageState) _then;

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
abstract class _$ShopEditPageStateCopyWith<$Res>
    implements $ShopEditPageStateCopyWith<$Res> {
  factory _$ShopEditPageStateCopyWith(
          _ShopEditPageState value, $Res Function(_ShopEditPageState) then) =
      __$ShopEditPageStateCopyWithImpl<$Res>;
  @override
  $Res call({File? imageFile, String image, String url, String name});
}

/// @nodoc
class __$ShopEditPageStateCopyWithImpl<$Res>
    extends _$ShopEditPageStateCopyWithImpl<$Res>
    implements _$ShopEditPageStateCopyWith<$Res> {
  __$ShopEditPageStateCopyWithImpl(
      _ShopEditPageState _value, $Res Function(_ShopEditPageState) _then)
      : super(_value, (v) => _then(v as _ShopEditPageState));

  @override
  _ShopEditPageState get _value => super._value as _ShopEditPageState;

  @override
  $Res call({
    Object? imageFile = freezed,
    Object? image = freezed,
    Object? url = freezed,
    Object? name = freezed,
  }) {
    return _then(_ShopEditPageState(
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

class _$_ShopEditPageState extends _ShopEditPageState {
  const _$_ShopEditPageState(
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
    return 'ShopEditPageState(imageFile: $imageFile, image: $image, url: $url, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShopEditPageState &&
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
  _$ShopEditPageStateCopyWith<_ShopEditPageState> get copyWith =>
      __$ShopEditPageStateCopyWithImpl<_ShopEditPageState>(this, _$identity);
}

abstract class _ShopEditPageState extends ShopEditPageState {
  const factory _ShopEditPageState(
      {File? imageFile,
      String image,
      String url,
      String name}) = _$_ShopEditPageState;
  const _ShopEditPageState._() : super._();

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
  _$ShopEditPageStateCopyWith<_ShopEditPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
