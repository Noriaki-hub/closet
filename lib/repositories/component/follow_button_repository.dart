import 'package:closet_app_xxx/models/follow.dart';
import 'package:closet_app_xxx/models/libs/Firebase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final followButtonRepositoryProvider =
    Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));

class _ItemRepository {
  final Reader _read;

  const _ItemRepository(this._read);

  Future<List<Follow>> fetchMyFollow(
      {required String myId, required String yourId}) async {
    final snap = await _read(firebaseFirestoreProvider)
        .collection('users')
        .doc(myId)
        .collection("follow")
        .where('uid', isEqualTo: yourId)
        .get();
    return snap.docs.map((doc) => Follow.fromJson(doc.data())).toList();
  }

  Future<List<Follow>> fetchYourFollower(
      {required String myId, required String yourId}) async {
    final snap = await _read(firebaseFirestoreProvider)
        .collection('users')
        .doc(yourId)
        .collection("follower")
        .where('uid', isEqualTo: myId)
        .get();
    return snap.docs.map((doc) => Follow.fromJson(doc.data())).toList();
  }

  Future<void> add({required String yourId, required String myId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('users')
        .doc(yourId)
        .collection('follower')
        .add({'uid': myId});
    await _read(firebaseFirestoreProvider)
        .collection('users')
        .doc(myId)
        .collection('follow')
        .add({'uid': yourId});

    await addYourClothesList(yourId: yourId, myId: myId);
    addYourShareList(yourId: yourId, myId: myId);
  }

  Future<void> addYourClothesList(
      {required String yourId, required String myId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .where("uid", isEqualTo: yourId)
        .get()
        .then((value) => value.docs.forEach((element) {
              _read(firebaseFirestoreProvider)
                  .collection('users')
                  .doc(myId)
                  .collection('timeline')
                  .doc("clothes")
                  .collection('clothes')
                  .doc(element.data()['itemId'])
                  .set(element.data());
            }));
  }

  Future<void> addYourShareList(
      {required String yourId, required String myId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('share')
        .where("uid", isEqualTo: yourId)
        .get()
        .then((value) => value.docs.forEach((element) {
              _read(firebaseFirestoreProvider)
                  .collection('users')
                  .doc(myId)
                  .collection('timeline')
                  .doc("share")
                  .collection('share')
                  .doc(element.data()['itemId'])
                  .set(element.data());
            }));
  }

  Future<void> delete({
    required String yourId,
    required String myId,
  }) async {
    var follow = await _read(firebaseFirestoreProvider)
        .collection('users')
        .doc(myId)
        .collection('follow')
        .where('uid', isEqualTo: yourId)
        .get();
    for (var doc in follow.docs) {
      await doc.reference.delete();
    }

    var follower = await _read(firebaseFirestoreProvider)
        .collection('users')
        .doc(yourId)
        .collection('follower')
        .where('uid', isEqualTo: myId)
        .get();
    for (var doc in follower.docs) {
      await doc.reference.delete();
    }

    await deleteYourClothesList(yourId: yourId, myId: myId);
    deleteYourShareList(yourId: yourId, myId: myId);
  }

  Future<void> deleteYourClothesList(
      {required String yourId, required String myId}) async {
    final snap = await _read(firebaseFirestoreProvider)
        .collection('users')
        .doc(myId)
        .collection('timeline')
        .doc('clothes')
        .collection('clothes')
        .where('uid', isEqualTo: myId)
        .get();

    for (var doc in snap.docs) {
      await doc.reference.delete();
    }
  }

  Future<void> deleteYourShareList(
      {required String yourId, required String myId}) async {
    final snap = await _read(firebaseFirestoreProvider)
        .collection('users')
        .doc(myId)
        .collection('timeline')
        .doc('share')
        .collection('share')
        .where('uid', isEqualTo: myId)
        .get();

    for (var doc in snap.docs) {
      await doc.reference.delete();
    }
  }
}
