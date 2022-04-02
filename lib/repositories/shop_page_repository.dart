import 'package:closet_app_xxx/models/libs/Firebase_providers.dart';
import 'package:closet_app_xxx/models/shop.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final shopRepositoryProvider =
    Provider<ShopRepository>((ref) => ShopRepository(ref.read));

class ShopRepository {
  final Reader _read;

  const ShopRepository(this._read);

  Future<List<Shop>> fetch({required String userId}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    final snap = await _fireStore
        .collection("users")
        .doc(userId)
        .collection('shop')
        .get();

    return snap.docs
        .map((doc) => Shop.fromJson(doc.data()).copyWith(itemId: doc.id))
        .toList();
  }

  Future<void> add({required Shop shop, required String userId}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    await _fireStore
        .collection("users")
        .doc(userId)
        .collection('shop')
        .add(shop.toJson());
  }

  Future<void> update({required String userId, required Shop shop}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    await _fireStore
        .collection("users")
        .doc(userId)
        .collection('shop')
        .doc(shop.itemId)
        .update({'image': shop.image, 'name': shop.name, 'url': shop.url});
  }

  Future<void> delete({required String userId, required Shop shop}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    await _fireStore
        .collection("users")
        .doc(userId)
        .collection('shop')
        .doc(shop.itemId)
        .delete();
  }
}
