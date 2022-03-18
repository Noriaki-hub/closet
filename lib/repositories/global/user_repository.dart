
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
        .get();
    final data = snap.data();
        if(data == null){
          return UserModel();
        }
    return UserModel.fromJson(data);
  }

  Future<UserModel> fetchUser({required String userId}) async{

    final _fireStore = await _read(firebaseFirestoreProvider);

    final snap = await _fireStore
        .collection('users')
        .doc(userId)
        .get();
    final data = snap.data();
    if(data == null){
      return UserModel();
    }
    return UserModel.fromJson(data);
  }



  Future<void> register({required UserModel user, }) async {
    final _fireStore = _read(firebaseFirestoreProvider);
   await _fireStore.collection("users").doc(user.uid).set(
        {
          'email' : user.email,
          'uid' : user.uid,
          'image' : user.image,
          'name' : user.name,
          'id' : user.id

        }
    );
  }

  Future<void> update({required UserModel user }) async {
    final _fireStore = _read(firebaseFirestoreProvider);
    await _fireStore.collection("users").doc(user.uid).update(
        {
          'image' : user.image,
          'name' : user.name,
          'id' : user.id
        }
    );
  }
}