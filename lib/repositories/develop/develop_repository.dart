import 'package:closet_app_xxx/models/libs/Firebase_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final developRepositoryProvider =
    Provider<DevelopRepository>((ref) => DevelopRepository(ref.read));

class DevelopRepository {
  final Reader _read;

  const DevelopRepository(this._read);

  Future<void> addStatusForAllUser() async {
    final _fireStore = _read(firebaseFirestoreProvider);

    await _fireStore.collection('users').get().then((snapshot) => {
          snapshot.docs.forEach((doc) {
            _fireStore
                .collection('users')
                .doc(doc.id)
                .collection('status')
                .doc('status')
                .set(<String, dynamic>{
              'likedCount': 0,
              'clothesAllCount': 0,
              'clothesCount': 0,
              'buying': 0,
              'selling': 0,
              'uid': doc.id
            });
          })
        });
  }

  Future<void> addUserStatusAllClothes() async {
    final _fireStore = _read(firebaseFirestoreProvider);

    await _fireStore.collection('clothes').get().then((snapshot) => {
          snapshot.docs.forEach((doc) {
            final uid = doc.data()['uid'];
            _fireStore
                .collection('users')
                .doc(uid)
                .collection('status')
                .doc('status')
                .collection('closet')
                .doc(doc.id)
                // .delete();
            .set(doc.data());
          })
        });
  }
}
