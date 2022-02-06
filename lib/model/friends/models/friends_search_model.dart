import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friends_search_model.freezed.dart';
part 'friends_search_model.g.dart';

@freezed
abstract class FriendsSearch implements _$FriendsSearch {
  const FriendsSearch._();

  const factory FriendsSearch({
    required String email,
    required String image,
    required String uid,
    required String name,
    required String id,
  }) = _FriendsSearch;

  factory FriendsSearch.fromJson(Map<String, dynamic> json) => _$FriendsSearchFromJson(json);

  factory FriendsSearch.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return FriendsSearch.fromJson(data);
  }

}
