import 'package:closet_app_xxx/model/auth/current/current_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../CustomExeption.dart';
import '../../Firebase_providers.dart';
import '../models/clothes_model.dart';

abstract class _BaseItemRepository {
  Future<List<Clothes>> retrieveBuy({required String year, required String month});
  Future<List<Clothes>> retrieveSell({required String year, required String month});
}

final calenderRepositoryProvider = Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));

class _ItemRepository implements _BaseItemRepository {
  final Reader _read;

  const _ItemRepository(this._read);

  @override
  Future<List<Clothes>> retrieveBuy({required String year, required String month}) async {
    try {
      final snap = await _read(firebaseFirestoreProvider)
          .collection("users").doc(_read(currentUserProvider).uid)
          .collection('clothes')
          .where('year', isEqualTo: year)
          .where('month', isEqualTo: month).get();
      return snap.docs.map((doc) => Clothes.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<List<Clothes>> retrieveSell({required String year, required String month}) async {
    try {
      final snap = await _read(firebaseFirestoreProvider)
          .collection("users").doc(_read(currentUserProvider).uid)
          .collection('clothes')
          .where('year', isEqualTo: year)
          .where('month', isEqualTo: month)
          .where('isSell', isEqualTo: true).get();
      return snap.docs.map((doc) => Clothes.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}