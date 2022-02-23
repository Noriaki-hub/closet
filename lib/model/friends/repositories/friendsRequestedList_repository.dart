import 'package:closet_app_xxx/model/auth/current/current_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../CustomExeption.dart';
import '../../Firebase_providers.dart';
import '../models/friends_model.dart';



abstract class _BaseItemRepository {
  // アイテムのリストを返す
  Future<List<Friends>> retrieveRequestedList();
}

final friendsRequestedRepositoryProvider = Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));


class _ItemRepository implements _BaseItemRepository {
  final Reader _read;

  const _ItemRepository(this._read);

  @override
  Future<List<Friends>> retrieveRequestedList() async {
    try {
      final snap = await _read(firebaseFirestoreProvider)
          .collection('users').doc(_read(currentUserProvider).uid).collection('getRequest')
          .get();
      return snap.docs.map((doc) => Friends.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

}