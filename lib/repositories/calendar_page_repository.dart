
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../models/libs/Firebase_providers.dart';
import '../models/clothes.dart';
import '../models/date.dart';


final calenderRepositoryProvider = Provider<_ItemRepository>((ref) => _ItemRepository(ref.read));

class _ItemRepository{
  final Reader _read;

  const _ItemRepository(this._read);


  Future<List<Clothes>> fetchBuyClothesList({required String userId, required String year, required String month}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    final snap = await _fireStore
        .collection('clothes')
        .where('year', isEqualTo: year)
        .where('month', isEqualTo: month)
        .where('uid', isEqualTo: userId)
        .get();
    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();

  }


  Future<List<Clothes>> fetchSellClothesList({required String userId, required String year, required String month}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

      final snap = await _fireStore
          .collection('clothes')
          .where('sellingYear', isEqualTo: year)
          .where('sellingMonth', isEqualTo: month)
          .where('isSell', isEqualTo: true)
          .where('uid', isEqualTo: userId).get();
      return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();

  }

  Future<String> fetchBuying(
      {required String userId, required String month, required String year}) async {


    List<String> list = [];
    double sum = 0;

    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .where('year', isEqualTo: year)
        .where('month', isEqualTo: month)
        .where('uid', isEqualTo: userId).get()
        .then((snapshot) => {
      snapshot.docs.forEach((doc) {
        list.add(doc.data()['price']);
      })
    });

    if(list.isNotEmpty){
      sum = list.map<double>((clothes) => double.parse(clothes)).reduce((curr, next) => curr + next);
    }
    return sum.floor().toString();
  }



  Future<String> fetchSelling(
      {required String userId, required String month, required String year}) async {

    List list = [];
    double sum = 0;

    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .where('sellingYear', isEqualTo: year).where('sellingMonth', isEqualTo: month)
        .where('isSell', isEqualTo: true).where('uid', isEqualTo: userId)
        .get()
        .then((snapshot) => {
      snapshot.docs.forEach((doc) {
        list.add(doc.data()['selling']);
      })
    });
    if(list.isNotEmpty){
      sum = list.map<double>((clothes) => double.parse(clothes)).reduce((curr, next) => curr + next);
    }

    return sum.floor().toString();
  }
}