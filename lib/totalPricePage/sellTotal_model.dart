import 'package:closet_app_xxx/clothes_buy/clothes_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class SellTotalPriceModel extends ChangeNotifier {

  List<Clothes>? clothes2;

  void fetchSellClothesList() async {
    final users= FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes').get();

    final List<Clothes> clothes3 = snapshot.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];
      final String id = document.id;
      final String imageURL = data['imageURL'];
      final String selling = data['selling'];



      return Clothes(
        brands,
        price,
        category,
        id,
        imageURL,
        selling,
      );
    }).toList();
    this.clothes2 = clothes3;
    notifyListeners();
  }
}



class SellTopsTotal extends ChangeNotifier {

  List<Clothes>? topsclothes2;

  void fetchSellClothesListTops() async {
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
      final String id = document.id;
      final String imageURL = data['imageURL'];
      final String selling = data['selling'];



      return Clothes(
        brands,
        price,
        category,
        id,
        imageURL,
        selling,
      );
    }).toList();
    this.topsclothes2 = topsclothes3;
    notifyListeners();
  }

}


class SellBottomsTotal extends ChangeNotifier {

  List<Clothes>? bottomsclothes2;

  void fetchSellClothesListBottoms() async {
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
      final String id = document.id;
      final String imageURL = data['imageURL'];
      final String selling = data['selling'];



      return Clothes(
        brands,
        price,
        category,
        id,
        imageURL,
        selling,
      );
    }).toList();
    this.bottomsclothes2 = bottomsclothes3;
    notifyListeners();
  }

}

class SellOuterTotal extends ChangeNotifier {

  List<Clothes>? outerclothes2;

  void fetchSellClothesListOuter() async {
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
      final String id = document.id;
      final String imageURL = data['imageURL'];
      final String selling = data['selling'];



      return Clothes(
        brands,
        price,
        category,
        id,
        imageURL,
        selling,
      );
    }).toList();
    this.outerclothes2 = outerclothes3;
    notifyListeners();
  }

}

class SellFootwearTotal extends ChangeNotifier {

  List<Clothes>? footwearclothes2;

  void fetchSellClothesListFootwear() async {
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
      final String id = document.id;
      final String imageURL = data['imageURL'];
      final String selling = data['selling'];



      return Clothes(
        brands,
        price,
        category,
        id,
        imageURL,
        selling,
      );
    }).toList();
    this.footwearclothes2 = footwearclothes3;
    notifyListeners();
  }

}

class SellAccessoriesTotal extends ChangeNotifier {

  List<Clothes>? accessoriesclothes2;

  void fetchSellClothesListAccessories() async {
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
      final String id = document.id;
      final String imageURL = data['imageURL'];
      final String selling = data['selling'];



      return Clothes(
        brands,
        price,
        category,
        id,
        imageURL,
        selling,
      );
    }).toList();
    this.accessoriesclothes2 = accessoriesclothes3;
    notifyListeners();
  }

}