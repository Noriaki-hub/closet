
import 'package:closet_app_xxx/models/clothes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/libs/Firebase_providers.dart';

final timeLineRepositoryProvider = Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));

class _ItemRepository {
  final Reader _read;

  _ItemRepository(this._read);

  Future<List<Clothes>> fetchTimeLines({required String userId}) async {
    final _fireStore =  _read(firebaseFirestoreProvider);

    final uidList = [userId];

    await _fireStore
        .collection('users').doc(userId).collection('follow')
        .get().then((snapshot) => {
      snapshot.docs.forEach((doc) {
        uidList.add(doc.data()['uid']);
      })
    });
    
    final snap = await _fireStore.collection("clothes")
        .where('uid', whereIn: uidList)
        .orderBy('createdBuy', descending: true)
        .limit(5)
        .get();


    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();

  }

  Future<List<Clothes>> fetchAddTimeLines({required String userId, required String lastItemId}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    final uidList = [userId];

    DocumentSnapshot lastDoc = await _fireStore.collection('clothes').doc(
        lastItemId).get();

    await _fireStore
        .collection('users').doc(userId).collection('follow')
        .get().then((snapshot) =>
    {
      snapshot.docs.forEach((doc) {
        uidList.add(doc.data()['uid']);
      })
    });

    final snap = await _fireStore.collection("clothes")
        .where('uid', whereIn: uidList)
        .orderBy('createdBuy', descending: true)
        .startAfterDocument(lastDoc)
        .limit(5)
        .get();


    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }
}