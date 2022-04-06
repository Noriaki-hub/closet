// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sell.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SellTearOff {
  const _$SellTearOff();

  _Sell call(
      {@FireTimestampConverterNonNull() required DateTime createdSell,
      String itemId = '',
      int selling = 0,
      String sellingDay = '',
      String sellingMonth = '',
      String sellingYear = '',
      bool isSell = false}) {
    return _Sell(
      createdSell: createdSell,
      itemId: itemId,
      selling: selling,
      sellingDay: sellingDay,
      sellingMonth: sellingMonth,
      sellingYear: sellingYear,
      isSell: isSell,
    );
  }
}

/// @nodoc
const $Sell = _$SellTearOff();

/// @nodoc
mixin _$Sell {
  @FireTimestampConverterNonNull()
  DateTime get createdSell => throw _privateConstructorUsedError;
  String get itemId => throw _privateConstructorUsedError;
  int get selling => throw _privateConstructorUsedError;
  String get sellingDay => throw _privateConstructorUsedError;
  String get sellingMonth => throw _privateConstructorUsedError;
  String get sellingYear => throw _privateConstructorUsedError;
  bool get isSell => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SellCopyWith<Sell> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellCopyWith<$Res> {
  factory $SellCopyWith(Sell value, $Res Function(Sell) then) =
      _$SellCopyWithImpl<$Res>;
  $Res call(
      {@FireTimestampConverterNonNull() DateTime createdSell,
      String itemId,
      int selling,
      String sellingDay,
      String sellingMonth,
      String sellingYear,
      bool isSell});
}

/// @nodoc
class _$SellCopyWithImpl<$Res> implements $SellCopyWith<$Res> {
  _$SellCopyWithImpl(this._value, this._then);

  final Sell _value;
  // ignore: unused_field
  final $Res Function(Sell) _then;

  @override
  $Res call({
    Object? createdSell = freezed,
    Object? itemId = freezed,
    Object? selling = freezed,
    Object? sellingDay = freezed,
    Object? sellingMonth = freezed,
    Object? sellingYear = freezed,
    Object? isSell = freezed,
  }) {
    return _then(_value.copyWith(
      createdSell: createdSell == freezed
          ? _value.createdSell
          : createdSell // ignore: cast_nullable_to_non_nullable
              as DateTime,
      itemId: itemId == freezed
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      selling: selling == freezed
          ? _value.selling
          : selling // ignore: cast_nullable_to_non_nullable
              as int,
      sellingDay: sellingDay == freezed
          ? _value.sellingDay
          : sellingDay // ignore: cast_nullable_to_non_nullable
              as String,
      sellingMonth: sellingMonth == freezed
          ? _value.sellingMonth
          : sellingMonth // ignore: cast_nullable_to_non_nullable
              as String,
      sellingYear: sellingYear == freezed
          ? _value.sellingYear
          : sellingYear // ignore: cast_nullable_to_non_nullable
              as String,
      isSell: isSell == freezed
          ? _value.isSell
          : isSell // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SellCopyWith<$Res> implements $SellCopyWith<$Res> {
  factory _$SellCopyWith(_Sell value, $Res Function(_Sell) then) =
      __$SellCopyWithImpl<$Res>;
  @override
  $Res call(
      {@FireTimestampConverterNonNull() DateTime createdSell,
      String itemId,
      int selling,
      String sellingDay,
      String sellingMonth,
      String sellingYear,
      bool isSell});
}

/// @nodoc
class __$SellCopyWithImpl<$Res> extends _$SellCopyWithImpl<$Res>
    implements _$SellCopyWith<$Res> {
  __$SellCopyWithImpl(_Sell _value, $Res Function(_Sell) _then)
      : super(_value, (v) => _then(v as _Sell));

  @override
  _Sell get _value => super._value as _Sell;

  @override
  $Res call({
    Object? createdSell = freezed,
    Object? itemId = freezed,
    Object? selling = freezed,
    Object? sellingDay = freezed,
    Object? sellingMonth = freezed,
    Object? sellingYear = freezed,
    Object? isSell = freezed,
  }) {
    return _then(_Sell(
      createdSell: createdSell == freezed
          ? _value.createdSell
          : createdSell // ignore: cast_nullable_to_non_nullable
              as DateTime,
      itemId: itemId == freezed
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      selling: selling == freezed
          ? _value.selling
          : selling // ignore: cast_nullable_to_non_nullable
              as int,
      sellingDay: sellingDay == freezed
          ? _value.sellingDay
          : sellingDay // ignore: cast_nullable_to_non_nullable
              as String,
      sellingMonth: sellingMonth == freezed
          ? _value.sellingMonth
          : sellingMonth // ignore: cast_nullable_to_non_nullable
              as String,
      sellingYear: sellingYear == freezed
          ? _value.sellingYear
          : sellingYear // ignore: cast_nullable_to_non_nullable
              as String,
      isSell: isSell == freezed
          ? _value.isSell
          : isSell // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Sell extends _Sell with DiagnosticableTreeMixin {
  const _$_Sell(
      {@FireTimestampConverterNonNull() required this.createdSell,
      this.itemId = '',
      this.selling = 0,
      this.sellingDay = '',
      this.sellingMonth = '',
      this.sellingYear = '',
      this.isSell = false})
      : super._();

  @override
  @FireTimestampConverterNonNull()
  final DateTime createdSell;
  @JsonKey()
  @override
  final String itemId;
  @JsonKey()
  @override
  final int selling;
  @JsonKey()
  @override
  final String sellingDay;
  @JsonKey()
  @override
  final String sellingMonth;
  @JsonKey()
  @override
  final String sellingYear;
  @JsonKey()
  @override
  final bool isSell;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Sell(createdSell: $createdSell, itemId: $itemId, selling: $selling, sellingDay: $sellingDay, sellingMonth: $sellingMonth, sellingYear: $sellingYear, isSell: $isSell)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Sell'))
      ..add(DiagnosticsProperty('createdSell', createdSell))
      ..add(DiagnosticsProperty('itemId', itemId))
      ..add(DiagnosticsProperty('selling', selling))
      ..add(DiagnosticsProperty('sellingDay', sellingDay))
      ..add(DiagnosticsProperty('sellingMonth', sellingMonth))
      ..add(DiagnosticsProperty('sellingYear', sellingYear))
      ..add(DiagnosticsProperty('isSell', isSell));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sell &&
            const DeepCollectionEquality()
                .equals(other.createdSell, createdSell) &&
            const DeepCollectionEquality().equals(other.itemId, itemId) &&
            const DeepCollectionEquality().equals(other.selling, selling) &&
            const DeepCollectionEquality()
                .equals(other.sellingDay, sellingDay) &&
            const DeepCollectionEquality()
                .equals(other.sellingMonth, sellingMonth) &&
            const DeepCollectionEquality()
                .equals(other.sellingYear, sellingYear) &&
            const DeepCollectionEquality().equals(other.isSell, isSell));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdSell),
      const DeepCollectionEquality().hash(itemId),
      const DeepCollectionEquality().hash(selling),
      const DeepCollectionEquality().hash(sellingDay),
      const DeepCollectionEquality().hash(sellingMonth),
      const DeepCollectionEquality().hash(sellingYear),
      const DeepCollectionEquality().hash(isSell));

  @JsonKey(ignore: true)
  @override
  _$SellCopyWith<_Sell> get copyWith =>
      __$SellCopyWithImpl<_Sell>(this, _$identity);
}

abstract class _Sell extends Sell {
  const factory _Sell(
      {@FireTimestampConverterNonNull() required DateTime createdSell,
      String itemId,
      int selling,
      String sellingDay,
      String sellingMonth,
      String sellingYear,
      bool isSell}) = _$_Sell;
  const _Sell._() : super._();

  @override
  @FireTimestampConverterNonNull()
  DateTime get createdSell;
  @override
  String get itemId;
  @override
  int get selling;
  @override
  String get sellingDay;
  @override
  String get sellingMonth;
  @override
  String get sellingYear;
  @override
  bool get isSell;
  @override
  @JsonKey(ignore: true)
  _$SellCopyWith<_Sell> get copyWith => throw _privateConstructorUsedError;
}
