import 'package:closet_app_xxx/models/media.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/libs/Firebase_providers.dart';
import '../models/user.dart';


final mediaRepositoryProvider = Provider<mediaRepository>((ref) => mediaRepository(ref.read));

class mediaRepository {
  final Reader _read;

  const mediaRepository(this._read);

  Future<List<Media>> fetch({required String userId}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    final snap = await _fireStore
        .collection("users").doc(userId)
        .collection('media').get();

    return snap.docs.map((doc) => Media.fromDocument(doc)).toList();
  }



  Future<void> add({required Media media, required String userId}) async {
         final _fireStore = _read(firebaseFirestoreProvider);

         await _fireStore
        .collection("users").doc(userId)
        .collection('media').add(media.toDocument());
  }
}