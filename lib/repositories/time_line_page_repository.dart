import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/models/libs/Firebase_providers.dart';
import 'package:closet_app_xxx/models/share.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeLineRepositoryProvider =
    Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));

class _ItemRepository {
  final Reader _read;

  _ItemRepository(this._read);

//全てのユーザー
  Future<List<Clothes>> fetchTimeLines() async {
    final _fireStore = _read(firebaseFirestoreProvider);

    final snap = await _fireStore
        .collection("clothes")
        .orderBy('createdBuy', descending: true)
        .limit(5)
        .get();

    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }

  Future<List<Clothes>> fetchAddTimeLines({required String lastItemId}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    DocumentSnapshot lastDoc =
        await _fireStore.collection('clothes').doc(lastItemId).get();

    final snap = await _fireStore
        .collection("clothes")
        .orderBy('createdBuy', descending: true)
        .startAfterDocument(lastDoc)
        .limit(5)
        .get();

    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }

//フォローしているユーザー
  Future<List<Clothes>> fetchFollowTimeLines({required String userId}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    final snap = await _fireStore
        .collection("users")
        .doc(userId)
        .collection('timeline')
        .doc('clothes')
        .collection('clothes')
        .orderBy('createdBuy', descending: true)
        .limit(5)
        .get();

    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }

  Future<List<Clothes>> fetchAddFollowTimeLines(
      {required String userId, required String lastItemId}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    DocumentSnapshot lastDoc =
        await _fireStore.collection('clothes').doc(lastItemId).get();

    final snap = await _fireStore
        .collection("users")
        .doc(userId)
        .collection('timeline')
        .doc('clothes')
        .collection('clothes')
        .orderBy('createdBuy', descending: true)
        .startAfterDocument(lastDoc)
        .limit(5)
        .get();

    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }

//全てのユーザー
  Future<List<Share>> fetchShares({required String genre, required int limit}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    final snap = await _fireStore
        .collection("share")
        .where('genre', isEqualTo: genre)
        .orderBy('created', descending: true)
        .limit(limit)
        .get();

    return snap.docs.map((doc) => Share.fromJson(doc.data())).toList();
  }

  Future<List<Share>> fetchAddShares(
      {required String lastItemId, required String genre}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    DocumentSnapshot lastDoc =
        await _fireStore.collection('share').doc(lastItemId).get();

    final snap = await _fireStore
        .collection("share")
        .where('genre', isEqualTo: genre)
        .orderBy('created', descending: true)
        .startAfterDocument(lastDoc)
        .limit(12)
        .get();

    return snap.docs.map((doc) => Share.fromJson(doc.data())).toList();
  }

//フォローしているユーザー
  Future<List<Share>> fetchFollowShares(
      {required String userId, required String genre}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    final snap = await _fireStore
        .collection("users")
        .doc(userId)
        .collection('timeline')
        .doc('share')
        .collection('share')
        .where('genre', isEqualTo: genre)
        .orderBy('created', descending: true)
        .limit(12)
        .get();

    return snap.docs.map((doc) => Share.fromJson(doc.data())).toList();
  }

  Future<List<Share>> fetchAddFollowShares(
      {required String userId,
      required String lastItemId,
      required String genre}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    DocumentSnapshot lastDoc =
        await _fireStore.collection('share').doc(lastItemId).get();

    final snap = await _fireStore
        .collection("users")
        .doc(userId)
        .collection('timeline')
        .doc('share')
        .collection('share')
        .where('genre', isEqualTo: genre)
        .orderBy('created', descending: true)
        .startAfterDocument(lastDoc)
        .limit(12)
        .get();

    return snap.docs.map((doc) => Share.fromJson(doc.data())).toList();
  }
}
