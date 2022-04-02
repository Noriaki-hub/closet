// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Buy _$$_BuyFromJson(Map<String, dynamic> json) => _$_Buy(
      createdBuy:
          const FireTimestampConverterNonNull().fromJson(json['createdBuy']),
      createdSell: json['createdSell'] == null
          ? null
          : DateTime.parse(json['createdSell'] as String),
      itemId: json['itemId'] as String? ?? '',
      brands: json['brands'] as String? ?? '',
      price: json['price'] as String? ?? '',
      category: json['category'] as String? ?? '',
      imageURL: json['imageURL'] as String? ?? '',
      selling: json['selling'] as String? ?? '',
      description: json['description'] as String? ?? '',
      day: json['day'] as String? ?? '',
      month: json['month'] as String? ?? '',
      year: json['year'] as String? ?? '',
      sellingDay: json['sellingDay'] as String? ?? '',
      sellingMonth: json['sellingMonth'] as String? ?? '',
      sellingYear: json['sellingYear'] as String? ?? '',
      isSell: json['isSell'] as bool? ?? false,
      isFavorite: json['isFavorite'] as bool? ?? false,
      uid: json['uid'] as String? ?? '',
      buyingForm: json['buyingForm'] as String? ?? '',
    );

Map<String, dynamic> _$$_BuyToJson(_$_Buy instance) => <String, dynamic>{
      'createdBuy':
          const FireTimestampConverterNonNull().toJson(instance.createdBuy),
      'createdSell': instance.createdSell?.toIso8601String(),
      'itemId': instance.itemId,
      'brands': instance.brands,
      'price': instance.price,
      'category': instance.category,
      'imageURL': instance.imageURL,
      'selling': instance.selling,
      'description': instance.description,
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
      'sellingDay': instance.sellingDay,
      'sellingMonth': instance.sellingMonth,
      'sellingYear': instance.sellingYear,
      'isSell': instance.isSell,
      'isFavorite': instance.isFavorite,
      'uid': instance.uid,
      'buyingForm': instance.buyingForm,
    };
