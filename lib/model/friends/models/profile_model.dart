import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class Profile implements _$Profile {
  const Profile._();

  const factory Profile({
    required String brands,
    required String price,
    required String category,
    required String imageURL,
    required String selling,
    required String assetURL,
    required String description,
  }) = _Profile;



  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  factory Profile.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Profile.fromJson(data);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}

