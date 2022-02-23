import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friendsRequest_model.freezed.dart';
part 'friendsRequest_model.g.dart';

@freezed
abstract class FriendsRequest implements _$FriendsRequest {
  const FriendsRequest._();

  const factory FriendsRequest({
    required String uid,
    String? itemId,
  }) = _FriendsRequest;

  factory FriendsRequest.fromJson(Map<String, dynamic> json) => _$FriendsRequestFromJson(json);

  factory FriendsRequest.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return FriendsRequest.fromJson(data).copyWith(itemId: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('itemId');
}




