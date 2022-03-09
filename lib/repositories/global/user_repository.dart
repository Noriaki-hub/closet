
import 'package:closet_app_xxx/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/libs/Firebase_providers.dart';




final userRepositoryProvider = Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));

class _ItemRepository {
  final Reader _read;

  _ItemRepository(this._read);


  Future<UserModel> fetchCurrentUser() async{

    final _fireStore = await _read(firebaseFirestoreProvider);
    final _currentUser = await _read(firebaseAuthProvider).currentUser;

    final snap = await _fireStore
        .collection('users')
        .doc(_currentUser?.uid)
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> doc) {
      return UserModel.fromDocument(doc);
    });
    return snap;
  }

  Future<void> register({required UserModel user, }) async {
    final _fireStore = _read(firebaseFirestoreProvider);
   await _fireStore.collection("users").doc(user.uid).set(
        {
          'email' : user.email,
          'uid' : user.uid,
          'image' : user.image,
          'name' : user.name,
          'id' : ''

        }
    );
  }
}