
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../CustomExeption.dart';
import '../../Firebase_providers.dart';
import '../models/friends_model.dart';

abstract class BaseItemRepository {
  // アイテムのリストを返す
  Future<List<Friends>> retrieveItems({required String userId});
}

final friendsRepositoryProvider = Provider<FriendsRepository>((ref) => FriendsRepository(ref.read));

class FriendsRepository implements BaseItemRepository {
  final Reader _read;

  const FriendsRepository(this._read);

  @override
  Future<List<Friends>> retrieveItems({required String userId}) async {
    try {
      // UserIdに紐づく、アイテムを取得
      final snap = await _read(firebaseFirestoreProvider)
          .collection('users').doc(userId).collection('follows')
          .get();
      return snap.docs.map((doc) => Friends.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}