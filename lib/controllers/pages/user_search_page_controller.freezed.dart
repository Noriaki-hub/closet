// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_search_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserSearchPageStateTearOff {
  const _$UserSearchPageStateTearOff();

  _UserSearchPageState call(
      {List<UserModel> searchedUsers = const <UserModel>[],
      String searchId = ''}) {
    return _UserSearchPageState(
      searchedUsers: searchedUsers,
      searchId: searchId,
    );
  }
}

/// @nodoc
const $UserSearchPageState = _$UserSearchPageStateTearOff();

/// @nodoc
mixin _$UserSearchPageState {
  List<UserModel> get searchedUsers => throw _privateConstructorUsedError;
  String get searchId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserSearchPageStateCopyWith<UserSearchPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSearchPageStateCopyWith<$Res> {
  factory $UserSearchPageStateCopyWith(
          UserSearchPageState value, $Res Function(UserSearchPageState) then) =
      _$UserSearchPageStateCopyWithImpl<$Res>;
  $Res call({List<UserModel> searchedUsers, String searchId});
}

/// @nodoc
class _$UserSearchPageStateCopyWithImpl<$Res>
    implements $UserSearchPageStateCopyWith<$Res> {
  _$UserSearchPageStateCopyWithImpl(this._value, this._then);

  final UserSearchPageState _value;
  // ignore: unused_field
  final $Res Function(UserSearchPageState) _then;

  @override
  $Res call({
    Object? searchedUsers = freezed,
    Object? searchId = freezed,
  }) {
    return _then(_value.copyWith(
      searchedUsers: searchedUsers == freezed
          ? _value.searchedUsers
          : searchedUsers // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      searchId: searchId == freezed
          ? _value.searchId
          : searchId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserSearchPageStateCopyWith<$Res>
    implements $UserSearchPageStateCopyWith<$Res> {
  factory _$UserSearchPageStateCopyWith(_UserSearchPageState value,
          $Res Function(_UserSearchPageState) then) =
      __$UserSearchPageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<UserModel> searchedUsers, String searchId});
}

/// @nodoc
class __$UserSearchPageStateCopyWithImpl<$Res>
    extends _$UserSearchPageStateCopyWithImpl<$Res>
    implements _$UserSearchPageStateCopyWith<$Res> {
  __$UserSearchPageStateCopyWithImpl(
      _UserSearchPageState _value, $Res Function(_UserSearchPageState) _then)
      : super(_value, (v) => _then(v as _UserSearchPageState));

  @override
  _UserSearchPageState get _value => super._value as _UserSearchPageState;

  @override
  $Res call({
    Object? searchedUsers = freezed,
    Object? searchId = freezed,
  }) {
    return _then(_UserSearchPageState(
      searchedUsers: searchedUsers == freezed
          ? _value.searchedUsers
          : searchedUsers // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      searchId: searchId == freezed
          ? _value.searchId
          : searchId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserSearchPageState extends _UserSearchPageState
    with DiagnosticableTreeMixin {
  const _$_UserSearchPageState(
      {this.searchedUsers = const <UserModel>[], this.searchId = ''})
      : super._();

  @JsonKey()
  @override
  final List<UserModel> searchedUsers;
  @JsonKey()
  @override
  final String searchId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserSearchPageState(searchedUsers: $searchedUsers, searchId: $searchId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserSearchPageState'))
      ..add(DiagnosticsProperty('searchedUsers', searchedUsers))
      ..add(DiagnosticsProperty('searchId', searchId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserSearchPageState &&
            const DeepCollectionEquality()
                .equals(other.searchedUsers, searchedUsers) &&
            const DeepCollectionEquality().equals(other.searchId, searchId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(searchedUsers),
      const DeepCollectionEquality().hash(searchId));

  @JsonKey(ignore: true)
  @override
  _$UserSearchPageStateCopyWith<_UserSearchPageState> get copyWith =>
      __$UserSearchPageStateCopyWithImpl<_UserSearchPageState>(
          this, _$identity);
}

abstract class _UserSearchPageState extends UserSearchPageState {
  const factory _UserSearchPageState(
      {List<UserModel> searchedUsers,
      String searchId}) = _$_UserSearchPageState;
  const _UserSearchPageState._() : super._();

  @override
  List<UserModel> get searchedUsers;
  @override
  String get searchId;
  @override
  @JsonKey(ignore: true)
  _$UserSearchPageStateCopyWith<_UserSearchPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
