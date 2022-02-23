import 'package:closet_app_xxx/model/auth/current/current_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../CustomExeption.dart';
import '../../Firebase_providers.dart';
import '../models/clothes_model.dart';

abstract class _BaseItemRepository {
  Future<List<Clothes>> retrieve({required String userId});
  Future<List<Clothes>> retrieveCategory({required String userId, required String category});
}

final clothesListRepositoryProvider = Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));

class _ItemRepository implements _BaseItemRepository {
  final Reader _read;

  const _ItemRepository(this._read);

  @override
  Future<List<Clothes>> retrieve({required String userId}) async {
    try {
      final snap = await _read(firebaseFirestoreProvider)
      .collection("users").doc(userId)
          .collection('clothes').where('isSell', isEqualTo: false).get();
      return snap.docs.map((doc) => Clothes.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<List<Clothes>> retrieveCategory({required String userId,required String category}) async {
    try {
      final snap = await _read(firebaseFirestoreProvider)
          .collection("users").doc(userId)
          .collection('clothes').where('category', isEqualTo: category).where('isSell', isEqualTo: false).get();
      return snap.docs.map((doc) => Clothes.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }


  @override
  Future<List<Clothes>> recent() async {
    try {
      final snap = await _read(firebaseFirestoreProvider)
          .collection("users").doc(_read(currentUserProvider).uid)
          .collection('clothes').where('isSell', isEqualTo: false).get();
      return snap.docs.map((doc) => Clothes.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }



  @override
  Future<String> add(Clothes clothes) async {
    try {
      final snap = await _read(firebaseFirestoreProvider)
          .collection("users").doc(_read(currentUserProvider).uid)
          .collection('clothes').add(clothes.toDocument());
      return snap.id;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

}