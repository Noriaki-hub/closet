import 'package:closet_app_xxx/models/media.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/libs/Firebase_providers.dart';

final mediaRepositoryProvider =
    Provider<MediaRepository>((ref) => MediaRepository(ref.read));

class MediaRepository {
  final Reader _read;

  const MediaRepository(this._read);

  Future<List<Media>> fetch({required String userId}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    final snap = await _fireStore
        .collection("users")
        .doc(userId)
        .collection('media')
        .get();

    return snap.docs
        .map((doc) => Media.fromJson(doc.data()).copyWith(itemId: doc.id))
        .toList();
  }

  Future<void> add({required Media media, required String userId}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    await _fireStore
        .collection("users")
        .doc(userId)
        .collection('media')
        .add(media.toJson());
  }

  Future<void> update({required String userId, required Media media}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    await _fireStore
        .collection("users")
        .doc(userId)
        .collection('media')
        .doc(media.itemId)
        .update({'image': media.image, 'name': media.name, 'url': media.url});
  }

  Future<void> delete({required String userId, required Media media}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    await _fireStore
        .collection("users")
        .doc(userId)
        .collection('media')
        .doc(media.itemId)
        .delete();
  }
}
