import 'package:closet_app_xxx/models/libs/Firebase_providers.dart';
import 'package:closet_app_xxx/models/status.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final statusRepositoryProvider =
    Provider<StatusRepository>((ref) => StatusRepository(ref.read));

class StatusRepository {
  final Reader _read;

  const StatusRepository(this._read);

  Future<List<Status>> fetchBuyingStatus({required int limit}) async {
    final snap = await _read(firebaseFirestoreProvider)
        .collectionGroup('status')
        .orderBy('buying', descending: true)
        .limit(limit)
        .get();

    return snap.docs.map((doc) => Status.fromJson(doc.data())).toList();
  }

  Future<List<Status>> fetchLikedCountStatus({required int limit}) async {
    final snap = await _read(firebaseFirestoreProvider)
        .collectionGroup('status')
        .orderBy('likedCount', descending: true)
        .limit(limit)
        .get();

    return snap.docs.map((doc) => Status.fromJson(doc.data())).toList();
  }

  Future<List<Status>> fetchClothesCountStatus({required int limit}) async {
    final snap = await _read(firebaseFirestoreProvider)
        .collectionGroup('status')
        .orderBy('clothesCount', descending: true)
        .limit(limit)
        .get();

    return snap.docs.map((doc) => Status.fromJson(doc.data())).toList();
  }
}
