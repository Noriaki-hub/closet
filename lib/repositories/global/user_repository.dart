import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/models/libs/Firebase_providers.dart';
import 'package:closet_app_xxx/models/status.dart';
import 'package:closet_app_xxx/models/user.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider =
    Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));

class _ItemRepository {
  final Reader _read;

  _ItemRepository(this._read);

  Future<UserModel?> fetchCurrentUser() async {
    final _fireStore = _read(firebaseFirestoreProvider);
    final _currentUser = _read(firebaseAuthProvider).currentUser;

    final snap =
        await _fireStore.collection('users').doc(_currentUser?.uid).get();
    final data = snap.data();
    if (data == null) {
      return null;
    }
    return UserModel.fromJson(data);
  }

  Future<UserModel?> fetchUser({required String userId}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    final snap = await _fireStore.collection('users').doc(userId).get();
    final data = snap.data();
    if (data == null) {
      return null;
    }
    return UserModel.fromJson(data);
  }

  Future<void> register({
    required UserModel user,
  }) async {
    final _fireStore = _read(firebaseFirestoreProvider);
    final Status status = Status();
    await _fireStore.collection("users").doc(user.uid).set({
      'email': user.email,
      'uid': user.uid,
      'image': user.image,
      'name': user.name,
      'id': user.id
    });

    await _fireStore
        .collection("users")
        .doc(user.uid)
        .collection('status')
        .doc('status')
        .set(<String, dynamic>{
      ...status.toJson(),
      'uid': user.uid
    });
  }

  Future<void> update({required UserModel user}) async {
    final _fireStore = _read(firebaseFirestoreProvider);
    await _fireStore
        .collection("users")
        .doc(user.uid)
        .update({'image': user.image, 'name': user.name, 'id': user.id});
  }

  Future<List<UserModel>> fetchUserList(
      {required List<Clothes> clothesList}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    List<UserModel> userList = [];

    for (var clothes in clothesList) {
      final snap = await _fireStore.collection('users').doc(clothes.uid).get();
      final data = snap.data();
      if (data == null) {
        return [];
      }
      userList.add(UserModel.fromJson(data));
    }
    return userList;
  }

  Future<void> addInsta(
      {required String userId, required String userName}) async {
    final _fireStore = _read(firebaseFirestoreProvider);
    await _fireStore
        .collection('users')
        .doc(userId)
        .collection('profile')
        .doc('instagram')
        .set({'userName': userName});
  }

  Future<String> fetchInsta({required String userId}) async {
    final _fireStore = _read(firebaseFirestoreProvider);
    final snap = await _fireStore
        .collection('users')
        .doc(userId)
        .collection('profile')
        .doc('instagram')
        .get();
    final data = snap.data();

    return data != null ? data['userName'] : '';
  }

  Future<void> addIntro({required String userId, required String intro}) async {
    final _fireStore = _read(firebaseFirestoreProvider);
    await _fireStore
        .collection('users')
        .doc(userId)
        .collection('profile')
        .doc('introduction')
        .set({'introduction': intro});
  }

  Future<String> fetchIntro({required String userId}) async {
    final _fireStore = _read(firebaseFirestoreProvider);
    final snap = await _fireStore
        .collection('users')
        .doc(userId)
        .collection('profile')
        .doc('introduction')
        .get();
    final data = snap.data();

    return data != null ? data['introduction'] : '';
  }

  Future<List<String>> fetchClothesCountRankingUserList(
      {required String userId}) async {
    final List<String> list = [];
    final _fireStore = _read(firebaseFirestoreProvider);
    final snap = _fireStore
        .collectionGroup('status')
        .orderBy('count', descending: true)
        .limit(12);
    snap.get().then((snapshot) => {
          snapshot.docs.forEach((doc) {
            list.add(doc.data()['uid']);
          })
        });
    return list;
  }
}
