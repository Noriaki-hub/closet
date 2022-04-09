// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calendar_picker_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CalendarPickerTearOff {
  const _$CalendarPickerTearOff();

  _CalendarPicker call(
      {DateTime? selectedDate,
      String year = '',
      String month = '',
      String day = ''}) {
    return _CalendarPicker(
      selectedDate: selectedDate,
      year: year,
      month: month,
      day: day,
    );
  }
}

/// @nodoc
const $CalendarPicker = _$CalendarPickerTearOff();

/// @nodoc
mixin _$CalendarPicker {
  DateTime? get selectedDate => throw _privateConstructorUsedError;
  String get year => throw _privateConstructorUsedError;
  String get month => throw _privateConstructorUsedError;
  String get day => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarPickerCopyWith<CalendarPicker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarPickerCopyWith<$Res> {
  factory $CalendarPickerCopyWith(
          CalendarPicker value, $Res Function(CalendarPicker) then) =
      _$CalendarPickerCopyWithImpl<$Res>;
  $Res call({DateTime? selectedDate, String year, String month, String day});
}

/// @nodoc
class _$CalendarPickerCopyWithImpl<$Res>
    implements $CalendarPickerCopyWith<$Res> {
  _$CalendarPickerCopyWithImpl(this._value, this._then);

  final CalendarPicker _value;
  // ignore: unused_field
  final $Res Function(CalendarPicker) _then;

  @override
  $Res call({
    Object? selectedDate = freezed,
    Object? year = freezed,
    Object? month = freezed,
    Object? day = freezed,
  }) {
    return _then(_value.copyWith(
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CalendarPickerCopyWith<$Res>
    implements $CalendarPickerCopyWith<$Res> {
  factory _$CalendarPickerCopyWith(
          _CalendarPicker value, $Res Function(_CalendarPicker) then) =
      __$CalendarPickerCopyWithImpl<$Res>;
  @override
  $Res call({DateTime? selectedDate, String year, String month, String day});
}

/// @nodoc
class __$CalendarPickerCopyWithImpl<$Res>
    extends _$CalendarPickerCopyWithImpl<$Res>
    implements _$CalendarPickerCopyWith<$Res> {
  __$CalendarPickerCopyWithImpl(
      _CalendarPicker _value, $Res Function(_CalendarPicker) _then)
      : super(_value, (v) => _then(v as _CalendarPicker));

  @override
  _CalendarPicker get _value => super._value as _CalendarPicker;

  @override
  $Res call({
    Object? selectedDate = freezed,
    Object? year = freezed,
    Object? month = freezed,
    Object? day = freezed,
  }) {
    return _then(_CalendarPicker(
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CalendarPicker extends _CalendarPicker {
  const _$_CalendarPicker(
      {this.selectedDate, this.year = '', this.month = '', this.day = ''})
      : super._();

  @override
  final DateTime? selectedDate;
  @JsonKey()
  @override
  final String year;
  @JsonKey()
  @override
  final String month;
  @JsonKey()
  @override
  final String day;

  @override
  String toString() {
    return 'CalendarPicker(selectedDate: $selectedDate, year: $year, month: $month, day: $day)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalendarPicker &&
            const DeepCollectionEquality()
                .equals(other.selectedDate, selectedDate) &&
            const DeepCollectionEquality().equals(other.year, year) &&
            const DeepCollectionEquality().equals(other.month, month) &&
            const DeepCollectionEquality().equals(other.day, day));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedDate),
      const DeepCollectionEquality().hash(year),
      const DeepCollectionEquality().hash(month),
      const DeepCollectionEquality().hash(day));

  @JsonKey(ignore: true)
  @override
  _$CalendarPickerCopyWith<_CalendarPicker> get copyWith =>
      __$CalendarPickerCopyWithImpl<_CalendarPicker>(this, _$identity);
}

abstract class _CalendarPicker extends CalendarPicker {
  const factory _CalendarPicker(
      {DateTime? selectedDate,
      String year,
      String month,
      String day}) = _$_CalendarPicker;
  const _CalendarPicker._() : super._();

  @override
  DateTime? get selectedDate;
  @override
  String get year;
  @override
  String get month;
  @override
  String get day;
  @override
  @JsonKey(ignore: true)
  _$CalendarPickerCopyWith<_CalendarPicker> get copyWith =>
      throw _privateConstructorUsedError;
}
