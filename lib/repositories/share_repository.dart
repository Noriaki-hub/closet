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
  }

  Future<void> delete({required String itemId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('share')
        .doc(itemId)
        .delete();
  }
}
