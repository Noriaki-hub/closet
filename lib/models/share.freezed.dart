// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'share.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Share _$ShareFromJson(Map<String, dynamic> json) {
  return _Share.fromJson(json);
}

/// @nodoc
class _$ShareTearOff {
  const _$ShareTearOff();

  _Share call(
      {String itemId = '',
      String url = '',
      String uid = '',
      String genre = '',
      String title = '',
      String image = ''}) {
    return _Share(
      itemId: itemId,
      url: url,
      uid: uid,
      genre: genre,
      title: title,
      image: image,
    );
  }

  Share fromJson(Map<String, Object?> json) {
    return Share.fromJson(json);
  }
}

/// @nodoc
const $Share = _$ShareTearOff();

/// @nodoc
mixin _$Share {
  String get itemId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get genre => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShareCopyWith<Share> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareCopyWith<$Res> {
  factory $ShareCopyWith(Share value, $Res Function(Share) then) =
      _$ShareCopyWithImpl<$Res>;
  $Res call(
      {String itemId,
      String url,
      String uid,
      String genre,
      String title,
      String image});
}

/// @nodoc
class _$ShareCopyWithImpl<$Res> implements $ShareCopyWith<$Res> {
  _$ShareCopyWithImpl(this._value, this._then);

  final Share _value;
  // ignore: unused_field
  final $Res Function(Share) _then;

  @override
  $Res call({
    Object? itemId = freezed,
    Object? url = freezed,
    Object? uid = freezed,
    Object? genre = freezed,
    Object? title = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      itemId: itemId == freezed
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      genre: genre == freezed
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ShareCopyWith<$Res> implements $ShareCopyWith<$Res> {
  factory _$ShareCopyWith(_Share value, $Res Function(_Share) then) =
      __$ShareCopyWithImpl<$Res>;
  @override
  $Res call(
      {String itemId,
      String url,
      String uid,
      String genre,
      String title,
      String image});
}

/// @nodoc
class __$ShareCopyWithImpl<$Res> extends _$ShareCopyWithImpl<$Res>
    implements _$ShareCopyWith<$Res> {
  __$ShareCopyWithImpl(_Share _value, $Res Function(_Share) _then)
      : super(_value, (v) => _then(v as _Share));

  @override
  _Share get _value => super._value as _Share;

  @override
  $Res call({
    Object? itemId = freezed,
    Object? url = freezed,
    Object? uid = freezed,
    Object? genre = freezed,
    Object? title = freezed,
    Object? image = freezed,
  }) {
    return _then(_Share(
      itemId: itemId == freezed
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      genre: genre == freezed
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Share extends _Share with DiagnosticableTreeMixin {
  const _$_Share(
      {this.itemId = '',
      this.url = '',
      this.uid = '',
      this.genre = '',
      this.title = '',
      this.image = ''})
      : super._();

  factory _$_Share.fromJson(Map<String, dynamic> json) =>
      _$$_ShareFromJson(json);

  @JsonKey()
  @override
  final String itemId;
  @JsonKey()
  @override
  final String url;
  @JsonKey()
  @override
  final String uid;
  @JsonKey()
  @override
  final String genre;
  @JsonKey()
  @override
  final String title;
  @JsonKey()
  @override
  final String image;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Share(itemId: $itemId, url: $url, uid: $uid, genre: $genre, title: $title, image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Share'))
      ..add(DiagnosticsProperty('itemId', itemId))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('genre', genre))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('image', image));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Share &&
            const DeepCollectionEquality().equals(other.itemId, itemId) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.genre, genre) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(itemId),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(genre),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$ShareCopyWith<_Share> get copyWith =>
      __$ShareCopyWithImpl<_Share>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShareToJson(this);
  }
}

abstract class _Share extends Share {
  const factory _Share(
      {String itemId,
      String url,
      String uid,
      String genre,
      String title,
      String image}) = _$_Share;
  const _Share._() : super._();

  factory _Share.fromJson(Map<String, dynamic> json) = _$_Share.fromJson;

  @override
  String get itemId;
  @override
  String get url;
  @override
  String get uid;
  @override
  String get genre;
  @override
  String get title;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$ShareCopyWith<_Share> get copyWith => throw _privateConstructorUsedError;
}
