import 'package:closet_app_xxx/model/friends/models/friends_search_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../CustomExeption.dart';
import '../../Firebase_providers.dart';

abstract class _BaseItemRepository {
  // アイテムのリストを返す
  Future<List<FriendsSearch>> retrieve({required String id});
}

final searchUserRepositoryProvider = Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));

class _ItemRepository implements _BaseItemRepository {
  final Reader _read;

  const _ItemRepository(this._read);

  @override
  Future<List<FriendsSearch>> retrieve({required String id}) async {
    try {
      // UserIdに紐づく、アイテムを取得
      final snap = await _read(firebaseFirestoreProvider)
          .collection('users')
          .where('id' ,isEqualTo: id)
          .get();
      return snap.docs.map((doc) => FriendsSearch.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}