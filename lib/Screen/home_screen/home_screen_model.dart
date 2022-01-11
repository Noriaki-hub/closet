import 'package:closet_app_xxx/Screen/closet_screen/closet_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


class Total{
  String brands;
  String price;
  String category;

  Total(this.brands,
      this.price,
      this.category,);
}

class HomeModel extends ChangeNotifier {




  List<Total>? clothes;
  List<Total>? clothesTops;
  List<Total>? clothesBottoms;
  List<Total>? clothesOuter;
  List<Total>? clothesFootwear;
  List<Total>? clothesAccessories;

  List<Closet>? clothesList;


  void getNumberAll() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;


    final QuerySnapshot snapshot = await users.doc(user?.uid).collection(
        'clothes')
        .where( 'isSell', isEqualTo : false).get();

    final QuerySnapshot snapshotTops = await users.doc(user?.uid).collection(
        'clothes')
        .where('isSell', isEqualTo : false)
        .where('category', isEqualTo: 'Tops')
        .get();

    final QuerySnapshot snapshotBottoms = await users.doc(user?.uid).collection(
        'clothes')
        .where('isSell', isEqualTo : false)
        .where('category', isEqualTo: 'Bottoms')
        .get();

    final QuerySnapshot snapshotOuter = await users.doc(user?.uid).collection(
        'clothes')
        .where('isSell', isEqualTo : false)
        .where('category', isEqualTo: 'Outer')
        .get();

    final QuerySnapshot snapshotFootwear = await users.doc(user?.uid)
        .collection(
        'clothes')
        .where('isSell', isEqualTo : false)
        .where('category', isEqualTo: 'Footwear')
        .get();

    final QuerySnapshot snapshotAccessories = await users.doc(user?.uid)
        .collection(
        'clothes')
        .where('isSell', isEqualTo : false)
        .where('category', isEqualTo: 'Accessories')
        .get();


    final List<Total> clothes = snapshot.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];


      return Total(
        brands,
        price,
        category,
      );
    }).toList();


    final List<Total> clothesTops = snapshotTops.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];


      return Total(
        brands,
        price,
        category,
      );
    }).toList();

    final List<Total> clothesBottoms = snapshotBottoms.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];


      return Total(
        brands,
        price,
        category,
      );
    }).toList();

    final List<Total> clothesOuter = snapshotOuter.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];


      return Total(
        brands,
        price,
        category,
      );
    }).toList();

    final List<Total> clothesFootwear = snapshotFootwear.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];


      return Total(
        brands,
        price,
        category,
      );
    }).toList();

    final List<Total> clothesAccessories = snapshotAccessories.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];


      return Total(
        brands,
        price,
        category,
      );
    }).toList();
    this.clothes = clothes;
    this.clothesTops = clothesTops;
    this.clothesBottoms = clothesBottoms;
    this.clothesOuter = clothesOuter;
    this.clothesFootwear = clothesFootwear;
    this.clothesAccessories = clothesAccessories;
    notifyListeners();
  }
}
