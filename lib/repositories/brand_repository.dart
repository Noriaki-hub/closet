import 'package:closet_app_xxx/models/brand.dart';
import 'package:closet_app_xxx/models/clothes.dart';
import 'package:closet_app_xxx/models/libs/Firebase_providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final brandRepositoryProvider =
    Provider<_Repository>((ref) => _Repository(ref.read));

class _Repository {
  final Reader _read;

  _Repository(this._read);

  Future<List<Brand>> fetchBrandList({required List searchWords}) async {
    List<Brand> brandList = [];
    final snap = await _read(firebaseFirestoreProvider)
        .collection('record')
        .doc('0')
        .get();

    final data = snap.data();

    if (data != null) {
      List list = data['brandList'];
      list.forEach((element) {
        brandList.add(Brand.fromJson(element));
      });
    }

    return brandList;
  }

  Future<Brand?> fetchBrand({required String brandId}) async {
    final snap = await _read(firebaseFirestoreProvider)
        .collection('brands')
        .doc(brandId)
        .get();

    final data = snap.data();

    if (data != null) {
      return Brand.fromJson(data);
    }

    return null;
  }

  Future<bool> fetchMyFollow(
      {required String myId, required String brandId}) async {
    final snap = await _read(firebaseFirestoreProvider)
        .collection('brands')
        .doc(brandId)
        .collection('follower')
        .doc(myId)
        .get();

    bool myFollow = snap.data() == null ? false : true;

    return myFollow;
  }

  Future<void> addFollower(
      {required String myId, required String brandId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('brands')
        .doc(brandId)
        .collection('follower')
        .doc(myId)
        .set({'uid': myId, "brandId": brandId});

    await _read(firebaseFirestoreProvider)
        .collection('users')
        .doc(myId)
        .collection('brandFollows')
        .doc(brandId)
        .set({'brandId': brandId});
  }

  Future<void> deleteFollower(
      {required String myId, required String brandId}) async {
    await _read(firebaseFirestoreProvider)
        .collection('brands')
        .doc(brandId)
        .collection('follower')
        .doc(myId)
        .delete();

    await _read(firebaseFirestoreProvider)
        .collection('users')
        .doc(myId)
        .collection('brandFollows')
        .doc(brandId)
        .delete();
  }

  Future<List<Clothes>> fetchBrandClothesList(
      {required int brandId, required int limit}) async {
    final snap = await _read(firebaseFirestoreProvider)
        .collection('clothes')
        .where('brandId', isEqualTo: brandId)
        .limit(limit)
        .get();

    return snap.docs.map((doc) => Clothes.fromJson(doc.data())).toList();
  }

  
}
