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
    addFollowerTimeLine(userId: share.uid, share: share, itemId: id);
  }

  Future<void> delete({required String itemId, required String userId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('share')
        .doc(itemId)
        .delete();
        deleteFollowerTimeLine(userId: userId,itemId: itemId);
  }

//全フォロワーのTL追加
  Future<void> addFollowerTimeLine(
      {required String userId,
      required Share share,
      required String itemId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('users')
        .doc(userId)
        .collection('follower')
        .get()
        .then((value) => value.docs.forEach((element) {
              final followerId = element.data()['uid'];

              _read(firebaseFirestoreProvider)
                  .collection('users')
                  .doc(followerId)
                  .collection('timeline')
                  .doc('share')
                  .collection('share')
                  .doc(itemId)
                  .set(<String, dynamic>{
                ...share.toJson(),
                'itemId': itemId,
                'created': Timestamp.fromDate(DateTime.now()),
              });
            }));
  }

  Future<void> deleteFollowerTimeLine(
      {required String userId,
      required String itemId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('users')
        .doc(userId)
        .collection('follower')
        .get()
        .then((value) => value.docs.forEach((element) {
              final followerId = element.data()['uid'];

              _read(firebaseFirestoreProvider)
                  .collection('users')
                  .doc(followerId)
                  .collection('timeline')
                  .doc('share')
                  .collection('share')
                  .doc(itemId)
                  .delete();
            }));
  }
}
