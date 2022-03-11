
import 'package:closet_app_xxx/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/libs/Firebase_providers.dart';

final searchUserRepositoryProvider = Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));

class _ItemRepository {
  final Reader _read;

  const _ItemRepository(this._read);

  Future<List<UserModel>> fetch({required String searchId}) async {
    final _fireStore =  _read(firebaseFirestoreProvider);


      final snap = await _fireStore
          .collection('users')
          .where('id' ,isEqualTo: searchId)
          .get();

      return snap.docs.map((doc) => UserModel.fromJson(doc.data())).toList();

  }
}