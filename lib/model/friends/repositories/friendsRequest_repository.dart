
import 'package:closet_app_xxx/model/friends/models/friendsRequest_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../CustomExeption.dart';
import '../../Firebase_providers.dart';


abstract class _BaseItemRepository {
  Future<List<FriendsRequest>> fetch({ required FriendsRequest myId,  required FriendsRequest yourId});
  Future<void> add({required FriendsRequest yourId, required FriendsRequest myId});
  Future<void> delete({required FriendsRequest yourId, required FriendsRequest myId});
}




final friendsRequestRepositoryProvider = Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));

class _ItemRepository implements _BaseItemRepository {
  final Reader _read;

  const _ItemRepository(this._read);


  @override
  Future<List<FriendsRequest>> fetch({ required FriendsRequest myId,  required FriendsRequest yourId}) async {
    try {

      final snap = await _read(firebaseFirestoreProvider)
          .collection('users').doc(myId.uid).collection("follow").where('uid',isEqualTo: yourId.uid)
          .get();
      return snap.docs.map((doc) => FriendsRequest.fromDocument(doc)).toList();

    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> add({required FriendsRequest yourId, required FriendsRequest myId}) async {
    try {
       await _read(firebaseFirestoreProvider)
          .collection('users').doc(yourId.uid).collection('follower')
          .add(myId.toDocument());
       await _read(firebaseFirestoreProvider)
           .collection('users').doc(myId.uid).collection('follow')
           .add(yourId.toDocument());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> delete({required FriendsRequest yourId, required FriendsRequest myId}) async {

    try {
      var follow = await _read(firebaseFirestoreProvider)
          .collection('users').doc(myId.uid).collection('follow')
          .where('uid', isEqualTo: yourId.uid).get();
      for (var doc in follow.docs) {
        await doc.reference.delete();
      }

      var follower = await _read(firebaseFirestoreProvider)
          .collection('users').doc(yourId.uid).collection('follower')
          .where('uid', isEqualTo: myId.uid).get();
      for (var doc in follower.docs) {
        await doc.reference.delete();
      }
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}









