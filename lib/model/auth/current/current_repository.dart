import 'package:closet_app_xxx/model/User/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Firebase_providers.dart';


abstract class _BaseItemRepository {
  // アイテムのリストを返す
  Future<UserModel> retrieve();
}

final currentUserRepositoryProvider = Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));

class _ItemRepository implements _BaseItemRepository {
  final Reader _read;

  const _ItemRepository(this._read);

  @override
  Future<UserModel> retrieve() async{
    final user = await _read(firebaseFirestoreProvider)
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> doc) {
      return UserModel.fromDocument(doc);
    });
    return user;
  }
}