import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/libs/Firebase_providers.dart';
import '../models/user.dart';

final followerRepositoryProvider =
    Provider<FollowerRepository>((ref) => FollowerRepository(ref.read));

class FollowerRepository {
  final Reader _read;

  const FollowerRepository(this._read);

  Future<List<UserModel>> fetch({required String userId}) async {
    List uidList = [''];
    List<UserModel> userList = [];

    await _read(firebaseFirestoreProvider)
        .collection('users')
        .doc(userId)
        .collection('follower')
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((doc) {
                uidList.add(doc.data()['uid']);
              })
            });

    for (var uid in uidList) {
      final snap = await _read(firebaseFirestoreProvider)
          .collection('users')
          .where('uid', isEqualTo: uid)
          .get();
      userList.addAll(
          snap.docs.map((doc) => UserModel.fromJson(doc.data())).toList());
    }

    return userList;
  }
}
