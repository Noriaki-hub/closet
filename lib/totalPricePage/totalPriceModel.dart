import 'package:firebase_auth/firebase_auth.dart';

import '../clothes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class TotalPriceModel extends ChangeNotifier {

  List<Clothes>? clothes2;

  void fetchClothesList() async {
    final users= FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes').get();

    final List<Clothes> clothes3 = snapshot.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];


      return Clothes(brands, price, category);
    }).toList();
    this.clothes2 = clothes3;
    notifyListeners();
  }
}



class TopsTotal extends ChangeNotifier {

  List<Clothes>? topsclothes2;

  void fetchClothesListTops() async {
    final users= FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes')
        .where('category', isEqualTo: 'Tops').get();

    final List<Clothes> topsclothes3 = snapshot.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];


      return Clothes(brands, price, category);
    }).toList();
    this.topsclothes2 = topsclothes3;
    notifyListeners();
  }

}


class BottomsTotal extends ChangeNotifier {

  List<Clothes>? bottomsclothes2;

  void fetchClothesListBottoms() async {
    final users= FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes')
        .where('category', isEqualTo: 'Bottoms').get();

    final List<Clothes> bottomsclothes3 = snapshot.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];


      return Clothes(brands, price, category);
    }).toList();
    this.bottomsclothes2 = bottomsclothes3;
    notifyListeners();
  }

 }

class OuterTotal extends ChangeNotifier {

  List<Clothes>? outerclothes2;

  void fetchClothesListOuter() async {
    final users= FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes')
        .where('category', isEqualTo: 'Outer').get();

    final List<Clothes> outerclothes3 = snapshot.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];


      return Clothes(brands, price, category);
    }).toList();
    this.outerclothes2 = outerclothes3;
    notifyListeners();
  }

}

class FootwearTotal extends ChangeNotifier {

  List<Clothes>? footwearclothes2;

  void fetchClothesListFootwear() async {
    final users= FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes')
        .where('category', isEqualTo: 'Footwear').get();

    final List<Clothes> footwearclothes3 = snapshot.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];


      return Clothes(brands, price, category);
    }).toList();
    this.footwearclothes2 = footwearclothes3;
    notifyListeners();
  }

}

class AccessoriesTotal extends ChangeNotifier {

  List<Clothes>? accessoriesclothes2;

  void fetchClothesListAccessories() async {
    final users= FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes')
        .where('category', isEqualTo: 'Accessories').get();

    final List<Clothes> accessoriesclothes3 = snapshot.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];


      return Clothes(brands, price, category);
    }).toList();
    this.accessoriesclothes2 = accessoriesclothes3;
    notifyListeners();
  }

}