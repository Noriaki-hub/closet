// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'month_picker_dialog_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MonthPickerDialogStateTearOff {
  const _$MonthPickerDialogStateTearOff();

  _MonthPickerDialogState call({String? selectedMonth, String? selectedYear}) {
    return _MonthPickerDialogState(
      selectedMonth: selectedMonth,
      selectedYear: selectedYear,
    );
  }
}

/// @nodoc
const $MonthPickerDialogState = _$MonthPickerDialogStateTearOff();

/// @nodoc
mixin _$MonthPickerDialogState {
  String? get selectedMonth => throw _privateConstructorUsedError;
  String? get selectedYear => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MonthPickerDialogStateCopyWith<MonthPickerDialogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthPickerDialogStateCopyWith<$Res> {
  factory $MonthPickerDialogStateCopyWith(MonthPickerDialogState value,
          $Res Function(MonthPickerDialogState) then) =
      _$MonthPickerDialogStateCopyWithImpl<$Res>;
  $Res call({String? selectedMonth, String? selectedYear});
}

/// @nodoc
class _$MonthPickerDialogStateCopyWithImpl<$Res>
    implements $MonthPickerDialogStateCopyWith<$Res> {
  _$MonthPickerDialogStateCopyWithImpl(this._value, this._then);

  final MonthPickerDialogState _value;
  // ignore: unused_field
  final $Res Function(MonthPickerDialogState) _then;

  @override
  $Res call({
    Object? selectedMonth = freezed,
    Object? selectedYear = freezed,
  }) {
    return _then(_value.copyWith(
      selectedMonth: selectedMonth == freezed
          ? _value.selectedMonth
          : selectedMonth // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedYear: selectedYear == freezed
          ? _value.selectedYear
          : selectedYear // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MonthPickerDialogStateCopyWith<$Res>
    implements $MonthPickerDialogStateCopyWith<$Res> {
  factory _$MonthPickerDialogStateCopyWith(_MonthPickerDialogState value,
          $Res Function(_MonthPickerDialogState) then) =
      __$MonthPickerDialogStateCopyWithImpl<$Res>;
  @override
  $Res call({String? selectedMonth, String? selectedYear});
}

/// @nodoc
class __$MonthPickerDialogStateCopyWithImpl<$Res>
    extends _$MonthPickerDialogStateCopyWithImpl<$Res>
    implements _$MonthPickerDialogStateCopyWith<$Res> {
  __$MonthPickerDialogStateCopyWithImpl(_MonthPickerDialogState _value,
      $Res Function(_MonthPickerDialogState) _then)
      : super(_value, (v) => _then(v as _MonthPickerDialogState));

  @override
  _MonthPickerDialogState get _value => super._value as _MonthPickerDialogState;

  @override
  $Res call({
    Object? selectedMonth = freezed,
    Object? selectedYear = freezed,
  }) {
    return _then(_MonthPickerDialogState(
      selectedMonth: selectedMonth == freezed
          ? _value.selectedMonth
          : selectedMonth // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedYear: selectedYear == freezed
          ? _value.selectedYear
          : selectedYear // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_MonthPickerDialogState extends _MonthPickerDialogState {
  const _$_MonthPickerDialogState({this.selectedMonth, this.selectedYear})
      : super._();

  @override
  final String? selectedMonth;
  @override
  final String? selectedYear;

  @override
  String toString() {
    return 'MonthPickerDialogState(selectedMonth: $selectedMonth, selectedYear: $selectedYear)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MonthPickerDialogState &&
            const DeepCollectionEquality()
                .equals(other.selectedMonth, selectedMonth) &&
            const DeepCollectionEquality()
                .equals(other.selectedYear, selectedYear));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedMonth),
      const DeepCollectionEquality().hash(selectedYear));

  @JsonKey(ignore: true)
  @override
  _$MonthPickerDialogStateCopyWith<_MonthPickerDialogState> get copyWith =>
      __$MonthPickerDialogStateCopyWithImpl<_MonthPickerDialogState>(
          this, _$identity);
}

abstract class _MonthPickerDialogState extends MonthPickerDialogState {
  const factory _MonthPickerDialogState(
      {String? selectedMonth,
      String? selectedYear}) = _$_MonthPickerDialogState;
  const _MonthPickerDialogState._() : super._();

  @override
  String? get selectedMonth;
  @override
  String? get selectedYear;
  @override
  @JsonKey(ignore: true)
  _$MonthPickerDialogStateCopyWith<_MonthPickerDialogState> get copyWith =>
      throw _privateConstructorUsedError;
}
