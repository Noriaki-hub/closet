import 'package:closet_app_xxx/Screen/home/home_screen.dart';
import 'package:closet_app_xxx/model/User/models/user_model.dart';
import 'package:closet_app_xxx/model/friends/models/friends_search_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../CustomExeption.dart';
import '../Firebase_providers.dart';

abstract class _BaseItemRepository {
  // アイテムのリストを返す
  Future<User> retrieve();
}

final currentUserRepositoryProvider = Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));

class _ItemRepository implements _BaseItemRepository {
  final Reader _read;

  const _ItemRepository(this._read);

  @override
  Future<User> retrieve() async{
    final user = await _read(firebaseFirestoreProvider)
        .collection('users')
        .doc(current!.uid)
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> doc) {
      return User.fromDocument(doc);
    });
    return user;
  }
}