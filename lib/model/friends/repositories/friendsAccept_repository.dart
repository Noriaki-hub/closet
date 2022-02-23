import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../CustomExeption.dart';
import '../../Firebase_providers.dart';
import '../../auth/current/current_controller.dart';
import '../models/friends_model.dart';

abstract class _BaseItemRepository {
  Future<String> addFriends({required String userId, required Friends my, required Friends your});
  Future<void> deleteRequest({ required String userId});
}




final friendsAcceptRepositoryProvider = Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));

class _ItemRepository implements _BaseItemRepository {
  final Reader _read;

  const _ItemRepository(this._read);


  @override
  Future<String> addFriends({required String userId, required Friends my, required Friends your}) async {
    try {
      // 自分のリストに追加
      final snap = await _read(firebaseFirestoreProvider)
          .collection('users').doc(_read(currentUserProvider).uid).collection('friends')
          .add(your.toDocument());
      // 相手のリストの追加
      await _read(firebaseFirestoreProvider)
          . collection('users').doc(userId).collection('friends')
          .add(my.toDocument());
      return snap.id;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> deleteRequest({ required String userId}) async {
    try {
      var snap = await _read(firebaseFirestoreProvider)
          .collection('users').doc(_read(currentUserProvider).uid).collection('getRequest')
          .where('uid', isEqualTo: userId).get();
      for (var doc in snap.docs) {
        await doc.reference.delete();
      }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
