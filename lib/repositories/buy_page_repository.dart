import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/buy.dart';
import '../models/libs/Firebase_providers.dart';
import '../models/clothes.dart';
import '../models/user.dart';


final buyRepositoryProvider = Provider<buyRepository>((ref) => buyRepository(ref.read));

class buyRepository {
  final Reader _read;

  const buyRepository(this._read);

  Future<void> add({required Buy clothes, required UserModel user}) async {
      final ref = await _read(firebaseFirestoreProvider)
          .collection('clothes');
      final id = ref.doc().id;
      await ref.doc(id).set(<String, dynamic>{
        ...clothes.toJson(),
        'itemId' : id,
        'createdBuy': Timestamp.fromDate(clothes.createdBuy),
      });
  }
}