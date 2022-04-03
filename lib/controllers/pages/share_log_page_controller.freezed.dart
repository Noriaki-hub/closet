// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'share_log_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShareLogPageStateTearOff {
  const _$ShareLogPageStateTearOff();

  _ShareLogPageState call(
      {String currentUrl = '',
      Share share = const Share(),
      String? title,
      String? image,
      String? description,
      String? url,
      String genre = ''}) {
    return _ShareLogPageState(
      currentUrl: currentUrl,
      share: share,
      title: title,
      image: image,
      description: description,
      url: url,
      genre: genre,
    );
  }
}

/// @nodoc
const $ShareLogPageState = _$ShareLogPageStateTearOff();

/// @nodoc
mixin _$ShareLogPageState {
  String get currentUrl => throw _privateConstructorUsedError;
  Share get share => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String get genre => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShareLogPageStateCopyWith<ShareLogPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareLogPageStateCopyWith<$Res> {
  factory $ShareLogPageStateCopyWith(
          ShareLogPageState value, $Res Function(ShareLogPageState) then) =
      _$ShareLogPageStateCopyWithImpl<$Res>;
  $Res call(
      {String currentUrl,
      Share share,
      String? title,
      String? image,
      String? description,
      String? url,
      String genre});

  $ShareCopyWith<$Res> get share;
}

/// @nodoc
class _$ShareLogPageStateCopyWithImpl<$Res>
    implements $ShareLogPageStateCopyWith<$Res> {
  _$ShareLogPageStateCopyWithImpl(this._value, this._then);

  final ShareLogPageState _value;
  // ignore: unused_field
  final $Res Function(ShareLogPageState) _then;

  @override
  $Res call({
    Object? currentUrl = freezed,
    Object? share = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? genre = freezed,
  }) {
    return _then(_value.copyWith(
      currentUrl: currentUrl == freezed
          ? _value.currentUrl
          : currentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      share: share == freezed
          ? _value.share
          : share // ignore: cast_nullable_to_non_nullable
              as Share,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      genre: genre == freezed
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $ShareCopyWith<$Res> get share {
    return $ShareCopyWith<$Res>(_value.share, (value) {
      return _then(_value.copyWith(share: value));
    });
  }
}

/// @nodoc
abstract class _$ShareLogPageStateCopyWith<$Res>
    implements $ShareLogPageStateCopyWith<$Res> {
  factory _$ShareLogPageStateCopyWith(
          _ShareLogPageState value, $Res Function(_ShareLogPageState) then) =
      __$ShareLogPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String currentUrl,
      Share share,
      String? title,
      String? image,
      String? description,
      String? url,
      String genre});

  @override
  $ShareCopyWith<$Res> get share;
}

/// @nodoc
class __$ShareLogPageStateCopyWithImpl<$Res>
    extends _$ShareLogPageStateCopyWithImpl<$Res>
    implements _$ShareLogPageStateCopyWith<$Res> {
  __$ShareLogPageStateCopyWithImpl(
      _ShareLogPageState _value, $Res Function(_ShareLogPageState) _then)
      : super(_value, (v) => _then(v as _ShareLogPageState));

  @override
  _ShareLogPageState get _value => super._value as _ShareLogPageState;

  @override
  $Res call({
    Object? currentUrl = freezed,
    Object? share = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? genre = freezed,
  }) {
    return _then(_ShareLogPageState(
      currentUrl: currentUrl == freezed
          ? _value.currentUrl
          : currentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      share: share == freezed
          ? _value.share
          : share // ignore: cast_nullable_to_non_nullable
              as Share,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      genre: genre == freezed
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ShareLogPageState extends _ShareLogPageState {
  const _$_ShareLogPageState(
      {this.currentUrl = '',
      this.share = const Share(),
      this.title,
      this.image,
      this.description,
      this.url,
      this.genre = ''})
      : super._();

  @JsonKey()
  @override
  final String currentUrl;
  @JsonKey()
  @override
  final Share share;
  @override
  final String? title;
  @override
  final String? image;
  @override
  final String? description;
  @override
  final String? url;
  @JsonKey()
  @override
  final String genre;

  @override
  String toString() {
    return 'ShareLogPageState(currentUrl: $currentUrl, share: $share, title: $title, image: $image, description: $description, url: $url, genre: $genre)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShareLogPageState &&
            const DeepCollectionEquality()
                .equals(other.currentUrl, currentUrl) &&
            const DeepCollectionEquality().equals(other.share, share) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.genre, genre));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentUrl),
      const DeepCollectionEquality().hash(share),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(genre));

  @JsonKey(ignore: true)
  @override
  _$ShareLogPageStateCopyWith<_ShareLogPageState> get copyWith =>
      __$ShareLogPageStateCopyWithImpl<_ShareLogPageState>(this, _$identity);
}

abstract class _ShareLogPageState extends ShareLogPageState {
  const factory _ShareLogPageState(
      {String currentUrl,
      Share share,
      String? title,
      String? image,
      String? description,
      String? url,
      String genre}) = _$_ShareLogPageState;
  const _ShareLogPageState._() : super._();

  @override
  String get currentUrl;
  @override
  Share get share;
  @override
  String? get title;
  @override
  String? get image;
  @override
  String? get description;
  @override
  String? get url;
  @override
  String get genre;
  @override
  @JsonKey(ignore: true)
  _$ShareLogPageStateCopyWith<_ShareLogPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
