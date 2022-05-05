import 'package:closet_app_xxx/models/buy.dart';
import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/models/libs/Firebase_providers.dart';
import 'package:closet_app_xxx/models/sell.dart';
import 'package:closet_app_xxx/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clothesRepositoryProvider =
    Provider<_Repository>((ref) => _Repository(ref.read));

class _Repository {
  final Reader _read;

  _Repository(this._read);

  Future<List<Clothes>> fetchCloset(
      {required String userId,
      required bool isSell,
      required String category,
      required int limit}) async {
    final snap = category == 'ALL'
        ? await _read(firebaseFirestoreProvider)
            .collection('users')
            .doc(userId)
            .collection('status')
            .doc('status')
            .collection('closet')
            .where('isSell', isEqualTo: isSell)
            .orderBy('createdBuy', descending: true)
            .limit(limit)
            .get()
        : await _read(firebaseFirestoreProvider)
            .collection('users')
            .doc(userId)
            .collection('status')
            .doc('status')
            .collection('closet')
            .where('isSell', isEqualTo: isSell)
            .where('category', isEqualTo: category)
            .where('uid', isEqualTo: userId)
            .orderBy('createdBuy', descending: true)
            .limit(limit)
            .get();

    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }

  Future<List<Clothes>> fetchAddCloset(
      {required String userId,
      required bool isSell,
      required String category,
      required String lastItemId}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    DocumentSnapshot lastDoc =
        await _fireStore.collection('clothes').doc(lastItemId).get();

    final snap = category == 'ALL'
        ? await _read(firebaseFirestoreProvider)
            .collection('users')
            .doc(userId)
            .collection('status')
            .doc('status')
            .collection('closet')
            .where('isSell', isEqualTo: isSell)
            .orderBy('createdBuy', descending: true)
            .startAfterDocument(lastDoc)
            .limit(12)
            .get()
        : await _read(firebaseFirestoreProvider)
            .collection('users')
            .doc(userId)
            .collection('status')
            .doc('status')
            .collection('closet')
            .where('isSell', isEqualTo: isSell)
            .where('category', isEqualTo: category)
            .orderBy('createdBuy', descending: true)
            .startAfterDocument(lastDoc)
            .limit(12)
            .get();

    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }

  Future<List<Clothes>> fetchClosetRecent(
      {required String userId, required bool isSell}) async {
    final snap = await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .where('isSell', isEqualTo: isSell)
        .where('uid', isEqualTo: userId)
        .orderBy('createdBuy', descending: true)
        .limit(5)
        .get();
    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }

  Future<Clothes?> fetchClothes({required String itemId}) async {
    final snap = await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .doc(itemId)
        .get();
    final data = snap.data();
    final clothes = data != null ? Clothes.fromJson(data) : null;
    return clothes;
  }

  Future<List<Clothes>> fetchFavorite(
      {required String userId, required bool isSell}) async {
    final snap = await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .where('isSell', isEqualTo: isSell)
        .where('isFavorite', isEqualTo: true)
        .where('uid', isEqualTo: userId)
        .get();

    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }

  Future<String> fetchBuying(
      {required String userId,
      required String month,
      required String year}) async {
    List<int> list = [];
    double sum = 0;

    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .where('year', isEqualTo: year)
        .where('month', isEqualTo: month)
        .where('uid', isEqualTo: userId)
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((doc) {
                list.add(doc.data()['price']);
              })
            });

    if (list.isNotEmpty) {
      sum = list
          .map<double>((clothes) => clothes.toDouble())
          .reduce((curr, next) => curr + next);
    }
    return sum.floor().toString();
  }

  Future<String> fetchBuyingAll({
    required String userId,
  }) async {
    List<int> list = [];
    double sum = 0;

    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .where('uid', isEqualTo: userId)
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((doc) {
                list.add(doc.data()['price']);
              })
            });

    if (list.isNotEmpty) {
      sum = list
          .map<double>((clothes) => clothes.toDouble())
          .reduce((curr, next) => curr + next);
    }

    return sum.floor().toString();
  }

  Future<String> fetchSelling(
      {required String userId,
      required String month,
      required String year}) async {
    List<int> list = [];
    double sum = 0;

    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .where('sellingYear', isEqualTo: year)
        .where('sellingMonth', isEqualTo: month)
        .where('isSell', isEqualTo: true)
        .where('uid', isEqualTo: userId)
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((doc) {
                list.add(doc.data()['selling']);
              })
            });
    if (list.isNotEmpty) {
      sum = list
          .map<double>((clothes) => clothes.toDouble())
          .reduce((curr, next) => curr + next);
    }

    return sum.floor().toString();
  }

  Future<String> fetchSellingAll({required String userId}) async {
    List<int> list = [];
    double sum = 0;

    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .where('isSell', isEqualTo: true)
        .where('uid', isEqualTo: userId)
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((doc) {
                list.add(doc.data()['selling']);
              })
            });
    if (list.isNotEmpty) {
      sum = list
          .map<double>((clothes) => clothes.toDouble())
          .reduce((curr, next) => curr + next);
    }

    return sum.floor().toString();
  }

  Future<List<Clothes>> fetchSortBuyCloset(
      {required String userId,
      required String year,
      required String month}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    final snap = await _fireStore
        .collection('clothes')
        .where('year', isEqualTo: year)
        .where('month', isEqualTo: month)
        .where('uid', isEqualTo: userId)
        .get();
    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }

  Future<List<Clothes>> fetchSortSellCloset(
      {required String userId,
      required String year,
      required String month}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    final snap = await _fireStore
        .collection('clothes')
        .where('sellingYear', isEqualTo: year)
        .where('sellingMonth', isEqualTo: month)
        .where('isSell', isEqualTo: true)
        .where('uid', isEqualTo: userId)
        .get();
    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }

  //CRUD
  Future<void> add({required Buy clothes, required UserModel user}) async {
    final ref = _read(firebaseFirestoreProvider).collection('clothes');
    final id = ref.doc().id;
    await ref.doc(id).set(<String, dynamic>{
      ...clothes.toJson(),
      'itemId': id,
      'createdBuy': Timestamp.fromDate(clothes.createdBuy),
    });

    addFollowerTimeLine(userId: user.uid, clothes: clothes, itemId: id);
  }

  Future<void> sell({
    required Sell clothes,
    required String userId,
  }) async {
    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .doc(clothes.itemId)
        .update({
      'isSell': clothes.isSell,
      'selling': clothes.selling,
      'sellingDay': clothes.sellingDay,
      'sellingMonth': clothes.sellingMonth,
      'sellingYear': clothes.sellingYear,
      'createdSell': Timestamp.fromDate(clothes.createdSell)
    });
  }

  Future<void> delete({required String itemId, required UserModel user}) async {
    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .doc(itemId)
        .delete();
    deleteFollowerTimeLine(userId: user.uid, itemId: itemId);
  }

  Future<void> update({required Clothes clothes}) async {
    final _fireStore = _read(firebaseFirestoreProvider);

    await _fireStore.collection('clothes').doc(clothes.itemId).update({
      "brandId": clothes.brandId,
      'imageURL': clothes.imageURL,
      "description": clothes.description,
      "category": clothes.category,
      "price": clothes.price,
      "year": clothes.year,
      "day": clothes.day,
      "month": clothes.month,
      "selling": clothes.selling,
      "sellingYear": clothes.sellingYear,
      "sellingMonth": clothes.sellingMonth,
      "sellingDay": clothes.sellingDay,
      'createdBuy': clothes.createdBuy,
      'createdSell': clothes.createdSell
    });
  }

  //全フォロワーのTLに追加
  Future<void> addFollowerTimeLine(
      {required String userId,
      required Buy clothes,
      required String itemId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('users')
        .doc(userId)
        .collection('follower')
        .get()
        .then((value) => value.docs.forEach((element) {
              final followerId = element.data()['uid'];

              final ref = _read(firebaseFirestoreProvider)
                  .collection('users')
                  .doc(followerId)
                  .collection('timeline')
                  .doc('clothes')
                  .collection('clothes');

              ref.doc(itemId).set(<String, dynamic>{
                ...clothes.toJson(),
                'itemId': itemId,
                'createdBuy': Timestamp.fromDate(clothes.createdBuy),
              });
            }));
  }

  Future<void> deleteFollowerTimeLine(
      {required String userId, required String itemId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('users')
        .doc(userId)
        .collection('follower')
        .get()
        .then((value) => value.docs.forEach((element) {
              final followerId = element.data()['uid'];

              _read(firebaseFirestoreProvider)
                  .collection('users')
                  .doc(followerId)
                  .collection('timeline')
                  .doc('clothes')
                  .collection('clothes')
                  .doc(itemId)
                  .delete();
            }));
  }

//お気に入り
  Future<void> updateFavoriteTrue({required String itemId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .doc(itemId)
        .update({'isFavorite': true});
  }

  Future<void> updateFavoriteFalse({required String itemId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .doc(itemId)
        .update({'isFavorite': false});
  }

  //ランキング
  Future<List<Clothes>> fetchPriceRanking({required String category}) async {
    final snap = category == 'ALL'
        ? await _read(firebaseFirestoreProvider)
            .collection('clothes')
            .orderBy('price', descending: true)
            .limit(12)
            .get()
        : await _read(firebaseFirestoreProvider)
            .collection('clothes')
            .where('category', isEqualTo: category)
            .orderBy('price', descending: true)
            .limit(12)
            .get();

    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }

  Future<List<Clothes>> fetchAddPriceRanking(
      {required String category, required String lastItemId}) async {
    final _fireStore = _read(firebaseFirestoreProvider);
    DocumentSnapshot lastDoc =
        await _fireStore.collection('clothes').doc(lastItemId).get();

    final snap = category == 'ALL'
        ? await _read(firebaseFirestoreProvider)
            .collection('clothes')
            .orderBy('price', descending: true)
            .startAfterDocument(lastDoc)
            .limit(12)
            .get()
        : await _read(firebaseFirestoreProvider)
            .collection('clothes')
            .where('category', isEqualTo: category)
            .orderBy('price', descending: true)
            .startAfterDocument(lastDoc)
            .limit(12)
            .get();

    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }

  Future<List<Clothes>> fetchLikeRanking({required String category}) async {
    final snap = category == 'ALL'
        ? await _read(firebaseFirestoreProvider)
            .collection('clothes')
            .orderBy('likedCount', descending: true)
            .limit(12)
            .get()
        : await _read(firebaseFirestoreProvider)
            .collection('clothes')
            .where('category', isEqualTo: category)
            .orderBy('likedCount', descending: true)
            .limit(12)
            .get();

    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }

  Future<List<Clothes>> fetchAddLikeRanking(
      {required String category, required String lastItemId}) async {
    final _fireStore = _read(firebaseFirestoreProvider);
    DocumentSnapshot lastDoc =
        await _fireStore.collection('clothes').doc(lastItemId).get();

    final snap = category == 'ALL'
        ? await _read(firebaseFirestoreProvider)
            .collection('clothes')
            .orderBy('likedCount', descending: true)
            .startAfterDocument(lastDoc)
            .limit(12)
            .get()
        : await _read(firebaseFirestoreProvider)
            .collection('clothes')
            .where('category', isEqualTo: category)
            .orderBy('likedCount', descending: true)
            .startAfterDocument(lastDoc)
            .limit(12)
            .get();

    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }
}
