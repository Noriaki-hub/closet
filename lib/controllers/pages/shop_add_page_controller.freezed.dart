// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shop_add_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShopAddPageStateTearOff {
  const _$ShopAddPageStateTearOff();

  _ShopAddPageState call(
      {File? imageFile, String name = '', String url = '', String image = ''}) {
    return _ShopAddPageState(
      imageFile: imageFile,
      name: name,
      url: url,
      image: image,
    );
  }
}

/// @nodoc
const $ShopAddPageState = _$ShopAddPageStateTearOff();

/// @nodoc
mixin _$ShopAddPageState {
  File? get imageFile => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopAddPageStateCopyWith<ShopAddPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopAddPageStateCopyWith<$Res> {
  factory $ShopAddPageStateCopyWith(
          ShopAddPageState value, $Res Function(ShopAddPageState) then) =
      _$ShopAddPageStateCopyWithImpl<$Res>;
  $Res call({File? imageFile, String name, String url, String image});
}

/// @nodoc
class _$ShopAddPageStateCopyWithImpl<$Res>
    implements $ShopAddPageStateCopyWith<$Res> {
  _$ShopAddPageStateCopyWithImpl(this._value, this._then);

  final ShopAddPageState _value;
  // ignore: unused_field
  final $Res Function(ShopAddPageState) _then;

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
abstract class _$ShopAddPageStateCopyWith<$Res>
    implements $ShopAddPageStateCopyWith<$Res> {
  factory _$ShopAddPageStateCopyWith(
          _ShopAddPageState value, $Res Function(_ShopAddPageState) then) =
      __$ShopAddPageStateCopyWithImpl<$Res>;
  @override
  $Res call({File? imageFile, String name, String url, String image});
}

/// @nodoc
class __$ShopAddPageStateCopyWithImpl<$Res>
    extends _$ShopAddPageStateCopyWithImpl<$Res>
    implements _$ShopAddPageStateCopyWith<$Res> {
  __$ShopAddPageStateCopyWithImpl(
      _ShopAddPageState _value, $Res Function(_ShopAddPageState) _then)
      : super(_value, (v) => _then(v as _ShopAddPageState));

  @override
  _ShopAddPageState get _value => super._value as _ShopAddPageState;

  @override
  $Res call({
    Object? imageFile = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? image = freezed,
  }) {
    return _then(_ShopAddPageState(
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

class _$_ShopAddPageState extends _ShopAddPageState {
  const _$_ShopAddPageState(
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
    return 'ShopAddPageState(imageFile: $imageFile, name: $name, url: $url, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShopAddPageState &&
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
  _$ShopAddPageStateCopyWith<_ShopAddPageState> get copyWith =>
      __$ShopAddPageStateCopyWithImpl<_ShopAddPageState>(this, _$identity);
}

abstract class _ShopAddPageState extends ShopAddPageState {
  const factory _ShopAddPageState(
      {File? imageFile,
      String name,
      String url,
      String image}) = _$_ShopAddPageState;
  const _ShopAddPageState._() : super._();

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
  _$ShopAddPageStateCopyWith<_ShopAddPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
