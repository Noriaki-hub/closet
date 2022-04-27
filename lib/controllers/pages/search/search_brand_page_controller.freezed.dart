// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_brand_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchBrandPageStateTearOff {
  const _$SearchBrandPageStateTearOff();

  _SearchBrandPageState call(
      {List<Brand> brandList = const <Brand>[],
      List<Brand> searchedBrandList = const <Brand>[],
      List<String> searchWords = const [],
      dynamic formText = ''}) {
    return _SearchBrandPageState(
      brandList: brandList,
      searchedBrandList: searchedBrandList,
      searchWords: searchWords,
      formText: formText,
    );
  }
}

/// @nodoc
const $SearchBrandPageState = _$SearchBrandPageStateTearOff();

/// @nodoc
mixin _$SearchBrandPageState {
  List<Brand> get brandList => throw _privateConstructorUsedError;
  List<Brand> get searchedBrandList => throw _privateConstructorUsedError;
  List<String> get searchWords => throw _privateConstructorUsedError;
  dynamic get formText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchBrandPageStateCopyWith<SearchBrandPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchBrandPageStateCopyWith<$Res> {
  factory $SearchBrandPageStateCopyWith(SearchBrandPageState value,
          $Res Function(SearchBrandPageState) then) =
      _$SearchBrandPageStateCopyWithImpl<$Res>;
  $Res call(
      {List<Brand> brandList,
      List<Brand> searchedBrandList,
      List<String> searchWords,
      dynamic formText});
}

/// @nodoc
class _$SearchBrandPageStateCopyWithImpl<$Res>
    implements $SearchBrandPageStateCopyWith<$Res> {
  _$SearchBrandPageStateCopyWithImpl(this._value, this._then);

  final SearchBrandPageState _value;
  // ignore: unused_field
  final $Res Function(SearchBrandPageState) _then;

  @override
  $Res call({
    Object? brandList = freezed,
    Object? searchedBrandList = freezed,
    Object? searchWords = freezed,
    Object? formText = freezed,
  }) {
    return _then(_value.copyWith(
      brandList: brandList == freezed
          ? _value.brandList
          : brandList // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      searchedBrandList: searchedBrandList == freezed
          ? _value.searchedBrandList
          : searchedBrandList // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      searchWords: searchWords == freezed
          ? _value.searchWords
          : searchWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      formText: formText == freezed
          ? _value.formText
          : formText // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$SearchBrandPageStateCopyWith<$Res>
    implements $SearchBrandPageStateCopyWith<$Res> {
  factory _$SearchBrandPageStateCopyWith(_SearchBrandPageState value,
          $Res Function(_SearchBrandPageState) then) =
      __$SearchBrandPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Brand> brandList,
      List<Brand> searchedBrandList,
      List<String> searchWords,
      dynamic formText});
}

/// @nodoc
class __$SearchBrandPageStateCopyWithImpl<$Res>
    extends _$SearchBrandPageStateCopyWithImpl<$Res>
    implements _$SearchBrandPageStateCopyWith<$Res> {
  __$SearchBrandPageStateCopyWithImpl(
      _SearchBrandPageState _value, $Res Function(_SearchBrandPageState) _then)
      : super(_value, (v) => _then(v as _SearchBrandPageState));

  @override
  _SearchBrandPageState get _value => super._value as _SearchBrandPageState;

  @override
  $Res call({
    Object? brandList = freezed,
    Object? searchedBrandList = freezed,
    Object? searchWords = freezed,
    Object? formText = freezed,
  }) {
    return _then(_SearchBrandPageState(
      brandList: brandList == freezed
          ? _value.brandList
          : brandList // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      searchedBrandList: searchedBrandList == freezed
          ? _value.searchedBrandList
          : searchedBrandList // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      searchWords: searchWords == freezed
          ? _value.searchWords
          : searchWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      formText: formText == freezed ? _value.formText : formText,
    ));
  }
}

/// @nodoc

class _$_SearchBrandPageState extends _SearchBrandPageState {
  const _$_SearchBrandPageState(
      {this.brandList = const <Brand>[],
      this.searchedBrandList = const <Brand>[],
      this.searchWords = const [],
      this.formText = ''})
      : super._();

  @JsonKey()
  @override
  final List<Brand> brandList;
  @JsonKey()
  @override
  final List<Brand> searchedBrandList;
  @JsonKey()
  @override
  final List<String> searchWords;
  @JsonKey()
  @override
  final dynamic formText;

  @override
  String toString() {
    return 'SearchBrandPageState(brandList: $brandList, searchedBrandList: $searchedBrandList, searchWords: $searchWords, formText: $formText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchBrandPageState &&
            const DeepCollectionEquality().equals(other.brandList, brandList) &&
            const DeepCollectionEquality()
                .equals(other.searchedBrandList, searchedBrandList) &&
            const DeepCollectionEquality()
                .equals(other.searchWords, searchWords) &&
            const DeepCollectionEquality().equals(other.formText, formText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(brandList),
      const DeepCollectionEquality().hash(searchedBrandList),
      const DeepCollectionEquality().hash(searchWords),
      const DeepCollectionEquality().hash(formText));

  @JsonKey(ignore: true)
  @override
  _$SearchBrandPageStateCopyWith<_SearchBrandPageState> get copyWith =>
      __$SearchBrandPageStateCopyWithImpl<_SearchBrandPageState>(
          this, _$identity);
}

abstract class _SearchBrandPageState extends SearchBrandPageState {
  const factory _SearchBrandPageState(
      {List<Brand> brandList,
      List<Brand> searchedBrandList,
      List<String> searchWords,
      dynamic formText}) = _$_SearchBrandPageState;
  const _SearchBrandPageState._() : super._();

  @override
  List<Brand> get brandList;
  @override
  List<Brand> get searchedBrandList;
  @override
  List<String> get searchWords;
  @override
  dynamic get formText;
  @override
  @JsonKey(ignore: true)
  _$SearchBrandPageStateCopyWith<_SearchBrandPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
