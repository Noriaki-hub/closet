import 'package:closet_app_xxx/controllers/global/date_now_controller.dart';
import 'package:closet_app_xxx/models/clothes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/libs/Firebase_providers.dart';
import '../models/date.dart';

final homeRepositoryProvider = Provider<homeRepository>((ref) => homeRepository(ref.read));

class homeRepository {
  final Reader _read;

  homeRepository(this._read);

  Future<List<Clothes>> fetchClosetAll(
      {required String userId, required bool isSell, required String category}) async {
    final snap = category == 'ALL' ?
    await _read(firebaseFirestoreProvider)
        .collection("users").doc(userId)
        .collection('clothes')
        .where('isSell', isEqualTo: isSell)
        .get() :
    await _read(firebaseFirestoreProvider)
        .collection("users").doc(userId)
        .collection('clothes')
        .where('isSell', isEqualTo: isSell).where(
        'category', isEqualTo: category).get();


    return snap.docs.map((doc) => Clothes.fromDocument(doc)).toList();
  }



  Future<List<Clothes>> fetchFavorite(
      {required String userId,  required bool isSell}) async {
    final snap =
    await _read(firebaseFirestoreProvider)
        .collection("users").doc(userId)
        .collection('clothes')
        .where('isSell', isEqualTo: isSell)
        .where('isFavorite', isEqualTo: true).get();

    return snap.docs.map((doc) => Clothes.fromDocument(doc)).toList();
  }

  Future<String> fetchThisMonthBuying(
      {required String userId, required Date date}) async {


     List<String> list = [];
     double sum = 0;

     await _read(firebaseFirestoreProvider)
        .collection("users").doc(userId)
        .collection('clothes')
        .where('isSell', isEqualTo: false)
        .where('year', isEqualTo: date.year).where('month', isEqualTo: date.month).get()
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



  Future<String> fetchThisMonthSelling(
      {required String userId, required Date date}) async {

    List list = [];
    double sum = 0;

    await _read(firebaseFirestoreProvider)
        .collection("users").doc(userId)
        .collection('clothes')
        .where('isSell', isEqualTo: true)
        .where('sellingYear', isEqualTo: date.year).where('sellingMonth', isEqualTo: date.month).get()
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