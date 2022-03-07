
import 'package:closet_app_xxx/models/shop.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/libs/Firebase_providers.dart';



final shopRepositoryProvider = Provider<ShopRepository>((ref) => ShopRepository(ref.read));

class ShopRepository {
  final Reader _read;

  const ShopRepository(this._read);

  Future<List<Shop>> fetch({required String userId}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    final snap = await _fireStore
        .collection("users").doc(userId)
        .collection('shop').get();

    return snap.docs.map((doc) => Shop.fromDocument(doc)).toList();
  }



  Future<void> add({required Shop shop, required String userId}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    await _fireStore
        .collection("users").doc(userId)
        .collection('shop').add(shop.toDocument());
  }
}