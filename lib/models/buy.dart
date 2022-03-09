import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'buy.freezed.dart';

@freezed
class Buy with _$Buy {
  const Buy._();

  const factory Buy({
    DateTime? selectedDate,
    File? imageFile,
    @Default('')String description,
    @Default('No brand')String brands,
    @Default('')String category,
    @Default('')String price,
    @Default('')String day,
    @Default('')String month,
    @Default('')String year,
    @Default('')String imageURL,
  }) = _Buy;
}

