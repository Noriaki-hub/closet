import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../CustomExeption.dart';
import '../../Firebase_providers.dart';
import '../../User/models/user_model.dart';

abstract class BaseItemRepository {
  // アイテムのリストを返す
  Future<List<UserModel>> retrieveItems({required String userId});
}

final friendsRepositoryProvider = Provider<FriendsRepository>((ref) => FriendsRepository(ref.read));

class FriendsRepository implements BaseItemRepository {
  final Reader _read;

  const FriendsRepository(this._read);

  @override
  Future<List<UserModel>> retrieveItems({required String userId}) async {
    try {
      final uidList = [];

       await _read(firebaseFirestoreProvider)
          .collection('users').doc(userId).collection('follow')
          .get().then((snapshot) => {
        snapshot.docs.forEach((doc) {
          uidList.add(doc.data()['uid']);
        })
      });

      final snap = await _read(firebaseFirestoreProvider)
          .collection('users').where('uid', whereIn: uidList)
          .get();
      return snap.docs.map((doc) => UserModel.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

}