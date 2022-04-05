import 'package:closet_app_xxx/models/libs/Firebase_providers.dart';
import 'package:closet_app_xxx/models/share.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final shareRepositoryProvider =
    Provider<ShareRepository>((ref) => ShareRepository(ref.read));

class ShareRepository {
  final Reader _read;

  const ShareRepository(this._read);

  Future<void> add({required Share share}) async {
    final ref = _read(firebaseFirestoreProvider).collection('share');
    final id = ref.doc().id;
    await ref.doc(id).set(<String, dynamic>{
      ...share.toJson(),
      'itemId': id,
      'created': Timestamp.fromDate(DateTime.now()),
    });
    addFollowerTimeLine(userId: share.uid, share: share);
  }

  Future<void> delete({required String itemId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('share')
        .doc(itemId)
        .delete();
  }

//全フォロワーのTL追加
  Future<void> addFollowerTimeLine(
      {required String userId, required Share share}) async {
    await _read(firebaseFirestoreProvider)
        .collection('users')
        .doc(userId)
        .collection('follower')
        .get()
        .then((value) => value.docs.forEach((element) {
              final followerId = element.data()['uid'];

              final ref = _read(firebaseFirestoreProvider)
                  .collection('users')
                  .doc(followerId)
                  .collection('timeline')
                  .doc('share')
                  .collection('share');

              final id = ref.doc().id;

              ref.doc(id).set(<String, dynamic>{
                ...share.toJson(),
                'itemId': id,
                'created': Timestamp.fromDate(DateTime.now()),
              });
            }));
  }
}
