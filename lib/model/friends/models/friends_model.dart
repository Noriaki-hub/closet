import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friends_model.freezed.dart';
part 'friends_model.g.dart';




@freezed
abstract class Friends implements _$Friends {
  const Friends._();

  const factory Friends({
    String? id,
    required String image,
    required String uid,
    required String name,
  }) = _Friends;

  factory Friends.empty() => Friends(name: '', image: '', uid: '');


  factory Friends.fromJson(Map<String, dynamic> json) =>
      _$FriendsFromJson(json);

  // ドキュメントのスナップショットを変換するために利用
  factory Friends.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    // doc.idがitemIDのため、copyWithでIDをモデルにコピーする
    return Friends.fromJson(data).copyWith(id: doc.id);
  }
}

