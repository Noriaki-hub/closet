import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sell.freezed.dart';

@freezed
class Sell with _$Sell {
  const Sell._();

  const factory Sell({
    DateTime? selectedDate,
    @Default('')String itemId,
    @Default('')String description,
    @Default('')String brands,
    @Default('')String image,
    @Default('')String selling,
    @Default('')String day,
    @Default('')String month,
    @Default('')String year,
  }) = _Sell;

}

