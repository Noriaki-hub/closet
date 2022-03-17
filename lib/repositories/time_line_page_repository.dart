
import 'package:closet_app_xxx/models/clothes.dart';
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
        .limit(20)
        .get();


    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();

  }
}