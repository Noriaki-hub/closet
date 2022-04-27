// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'buy_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BuyPageStateTearOff {
  const _$BuyPageStateTearOff();

  _BuyPageState call(
      {DateTime? selectedDate,
      File? imageFile,
      List<Brand> brandList = const <Brand>[],
      String description = '',
      Brand selectedBrand = const Brand(),
      String category = '',
      String price = '',
      String day = '',
      String month = '',
      String year = '',
      String imageURL = '',
      String buyingForm = ''}) {
    return _BuyPageState(
      selectedDate: selectedDate,
      imageFile: imageFile,
      brandList: brandList,
      description: description,
      selectedBrand: selectedBrand,
      category: category,
      price: price,
      day: day,
      month: month,
      year: year,
      imageURL: imageURL,
      buyingForm: buyingForm,
    );
  }
}

/// @nodoc
const $BuyPageState = _$BuyPageStateTearOff();

/// @nodoc
mixin _$BuyPageState {
  DateTime? get selectedDate => throw _privateConstructorUsedError;
  File? get imageFile => throw _privateConstructorUsedError;
  List<Brand> get brandList => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Brand get selectedBrand => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get day => throw _privateConstructorUsedError;
  String get month => throw _privateConstructorUsedError;
  String get year => throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;
  String get buyingForm => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BuyPageStateCopyWith<BuyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuyPageStateCopyWith<$Res> {
  factory $BuyPageStateCopyWith(
          BuyPageState value, $Res Function(BuyPageState) then) =
      _$BuyPageStateCopyWithImpl<$Res>;
  $Res call(
      {DateTime? selectedDate,
      File? imageFile,
      List<Brand> brandList,
      String description,
      Brand selectedBrand,
      String category,
      String price,
      String day,
      String month,
      String year,
      String imageURL,
      String buyingForm});

  $BrandCopyWith<$Res> get selectedBrand;
}

/// @nodoc
class _$BuyPageStateCopyWithImpl<$Res> implements $BuyPageStateCopyWith<$Res> {
  _$BuyPageStateCopyWithImpl(this._value, this._then);

  final BuyPageState _value;
  // ignore: unused_field
  final $Res Function(BuyPageState) _then;

  @override
  $Res call({
    Object? selectedDate = freezed,
    Object? imageFile = freezed,
    Object? brandList = freezed,
    Object? description = freezed,
    Object? selectedBrand = freezed,
    Object? category = freezed,
    Object? price = freezed,
    Object? day = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? imageURL = freezed,
    Object? buyingForm = freezed,
  }) {
    return _then(_value.copyWith(
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      brandList: brandList == freezed
          ? _value.brandList
          : brandList // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      selectedBrand: selectedBrand == freezed
          ? _value.selectedBrand
          : selectedBrand // ignore: cast_nullable_to_non_nullable
              as Brand,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      buyingForm: buyingForm == freezed
          ? _value.buyingForm
          : buyingForm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $BrandCopyWith<$Res> get selectedBrand {
    return $BrandCopyWith<$Res>(_value.selectedBrand, (value) {
      return _then(_value.copyWith(selectedBrand: value));
    });
  }
}

/// @nodoc
abstract class _$BuyPageStateCopyWith<$Res>
    implements $BuyPageStateCopyWith<$Res> {
  factory _$BuyPageStateCopyWith(
          _BuyPageState value, $Res Function(_BuyPageState) then) =
      __$BuyPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime? selectedDate,
      File? imageFile,
      List<Brand> brandList,
      String description,
      Brand selectedBrand,
      String category,
      String price,
      String day,
      String month,
      String year,
      String imageURL,
      String buyingForm});

  @override
  $BrandCopyWith<$Res> get selectedBrand;
}

/// @nodoc
class __$BuyPageStateCopyWithImpl<$Res> extends _$BuyPageStateCopyWithImpl<$Res>
    implements _$BuyPageStateCopyWith<$Res> {
  __$BuyPageStateCopyWithImpl(
      _BuyPageState _value, $Res Function(_BuyPageState) _then)
      : super(_value, (v) => _then(v as _BuyPageState));

  @override
  _BuyPageState get _value => super._value as _BuyPageState;

  @override
  $Res call({
    Object? selectedDate = freezed,
    Object? imageFile = freezed,
    Object? brandList = freezed,
    Object? description = freezed,
    Object? selectedBrand = freezed,
    Object? category = freezed,
    Object? price = freezed,
    Object? day = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? imageURL = freezed,
    Object? buyingForm = freezed,
  }) {
    return _then(_BuyPageState(
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      brandList: brandList == freezed
          ? _value.brandList
          : brandList // ignore: cast_nullable_to_non_nullable
              as List<Brand>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      selectedBrand: selectedBrand == freezed
          ? _value.selectedBrand
          : selectedBrand // ignore: cast_nullable_to_non_nullable
              as Brand,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      buyingForm: buyingForm == freezed
          ? _value.buyingForm
          : buyingForm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BuyPageState extends _BuyPageState {
  const _$_BuyPageState(
      {this.selectedDate,
      this.imageFile,
      this.brandList = const <Brand>[],
      this.description = '',
      this.selectedBrand = const Brand(),
      this.category = '',
      this.price = '',
      this.day = '',
      this.month = '',
      this.year = '',
      this.imageURL = '',
      this.buyingForm = ''})
      : super._();

  @override
  final DateTime? selectedDate;
  @override
  final File? imageFile;
  @JsonKey()
  @override
  final List<Brand> brandList;
  @JsonKey()
  @override
  final String description;
  @JsonKey()
  @override
  final Brand selectedBrand;
  @JsonKey()
  @override
  final String category;
  @JsonKey()
  @override
  final String price;
  @JsonKey()
  @override
  final String day;
  @JsonKey()
  @override
  final String month;
  @JsonKey()
  @override
  final String year;
  @JsonKey()
  @override
  final String imageURL;
  @JsonKey()
  @override
  final String buyingForm;

  @override
  String toString() {
    return 'BuyPageState(selectedDate: $selectedDate, imageFile: $imageFile, brandList: $brandList, description: $description, selectedBrand: $selectedBrand, category: $category, price: $price, day: $day, month: $month, year: $year, imageURL: $imageURL, buyingForm: $buyingForm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BuyPageState &&
            const DeepCollectionEquality()
                .equals(other.selectedDate, selectedDate) &&
            const DeepCollectionEquality().equals(other.imageFile, imageFile) &&
            const DeepCollectionEquality().equals(other.brandList, brandList) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.selectedBrand, selectedBrand) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.day, day) &&
            const DeepCollectionEquality().equals(other.month, month) &&
            const DeepCollectionEquality().equals(other.year, year) &&
            const DeepCollectionEquality().equals(other.imageURL, imageURL) &&
            const DeepCollectionEquality()
                .equals(other.buyingForm, buyingForm));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedDate),
      const DeepCollectionEquality().hash(imageFile),
      const DeepCollectionEquality().hash(brandList),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(selectedBrand),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(day),
      const DeepCollectionEquality().hash(month),
      const DeepCollectionEquality().hash(year),
      const DeepCollectionEquality().hash(imageURL),
      const DeepCollectionEquality().hash(buyingForm));

  @JsonKey(ignore: true)
  @override
  _$BuyPageStateCopyWith<_BuyPageState> get copyWith =>
      __$BuyPageStateCopyWithImpl<_BuyPageState>(this, _$identity);
}

abstract class _BuyPageState extends BuyPageState {
  const factory _BuyPageState(
      {DateTime? selectedDate,
      File? imageFile,
      List<Brand> brandList,
      String description,
      Brand selectedBrand,
      String category,
      String price,
      String day,
      String month,
      String year,
      String imageURL,
      String buyingForm}) = _$_BuyPageState;
  const _BuyPageState._() : super._();

  @override
  DateTime? get selectedDate;
  @override
  File? get imageFile;
  @override
  List<Brand> get brandList;
  @override
  String get description;
  @override
  Brand get selectedBrand;
  @override
  String get category;
  @override
  String get price;
  @override
  String get day;
  @override
  String get month;
  @override
  String get year;
  @override
  String get imageURL;
  @override
  String get buyingForm;
  @override
  @JsonKey(ignore: true)
  _$BuyPageStateCopyWith<_BuyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
