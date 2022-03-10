import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/libs/Firebase_providers.dart';
import '../models/clothes.dart';
import '../models/sell.dart';


final sellRepositoryProvider = Provider<sellRepository>((ref) => sellRepository(ref.read));

class sellRepository {
  final Reader _read;

  const sellRepository(this._read);



  Future<List<Clothes>> fetch({required String userId, }) async {
    final _fireStore = _read(firebaseFirestoreProvider);


     final snap = await _fireStore
        .collection('clothes').where('isSell', isEqualTo: false).where('uid', isEqualTo: userId).get();

     return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }



  Future<void> sell({required Sell clothes , required String userId, }) async {
      await _read(firebaseFirestoreProvider)
          .collection('clothes').doc(clothes.itemId).update({
        'isSell' : clothes.isSell,
        'selling' : clothes.selling,
        'sellingDay' : clothes.sellingDay,
        'sellingMonth' : clothes.sellingMonth,
        'sellingYear' : clothes.sellingYear,
        'createdSell' : Timestamp.fromDate(clothes.createdSell)
      });
  }
}