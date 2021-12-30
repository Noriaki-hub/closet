import 'package:closet_app_xxx/closet/closet_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class HomeModel extends ChangeNotifier {

  List<Closet>? clothes;

  void getNumberAll() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection(
        'clothes')
        .where('sellGet', isEqualTo: 'no').get();

    final List<Closet> clothes = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];
      final String id = document.id;
      final String imageURL = data['imageURL'];
      final String selling = data['selling'];
      final String assetURL = data['assetURL'];
      final String description = data['description'];


      return Closet(
        brands,
        price,
        category,
        id,
        imageURL,
        selling,
        assetURL,
        description,
      );
    }).toList();
    this.clothes = clothes;
    notifyListeners();
  }
}
class HomeModelTops extends ChangeNotifier {

  List<Closet>? clothesTops;

  void getNumberTops() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection(
        'clothes')
        .where('sellGet', isEqualTo: 'no')
        .where('category', isEqualTo: 'Tops')
        .get();

    final List<Closet> _clothes = snapshot.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];
      final String id = document.id;
      final String imageURL = data['imageURL'];
      final String selling = data['selling'];
      final String assetURL = data['assetURL'];
      final String description = data['description'];


      return Closet(
        brands,
        price,
        category,
        id,
        imageURL,
        selling,
        assetURL,
        description,
      );
    }).toList();
    this.clothesTops = _clothes;
    notifyListeners();
  }
}

class HomeModelBottoms extends ChangeNotifier {

  List<Closet>? clothesBottoms;

  void getNumberBottoms() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection(
        'clothes')
        .where('sellGet', isEqualTo: 'no')
        .where('category', isEqualTo: 'Bottoms')
        .get();

    final List<Closet> clothes = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];
      final String id = document.id;
      final String imageURL = data['imageURL'];
      final String selling = data['selling'];
      final String assetURL = data['assetURL'];
      final String description = data['description'];


      return Closet(
        brands,
        price,
        category,
        id,
        imageURL,
        selling,
        assetURL,
        description,
      );
    }).toList();
    this.clothesBottoms = clothes;
    notifyListeners();
  }
}

class HomeModelOuter extends ChangeNotifier {

  List<Closet>? clothesOuter;

  void getNumberOuter() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection(
        'clothes')
        .where('sellGet', isEqualTo: 'no')
        .where('category', isEqualTo: 'Outer')
        .get();

    final List<Closet> clothes = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];
      final String id = document.id;
      final String imageURL = data['imageURL'];
      final String selling = data['selling'];
      final String assetURL = data['assetURL'];
      final String description = data['description'];


      return Closet(
        brands,
        price,
        category,
        id,
        imageURL,
        selling,
        assetURL,
        description,
      );
    }).toList();
    this.clothesOuter = clothes;
    notifyListeners();
  }
}

class HomeModelFootwear extends ChangeNotifier {

  List<Closet>? clothesFootwear;

  void getNumberFootwear() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection(
        'clothes')
        .where('sellGet', isEqualTo: 'no')
        .where('category', isEqualTo: 'Footwear')
        .get();

    final List<Closet> clothes = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];
      final String id = document.id;
      final String imageURL = data['imageURL'];
      final String selling = data['selling'];
      final String assetURL = data['assetURL'];
      final String description = data['description'];


      return Closet(
        brands,
        price,
        category,
        id,
        imageURL,
        selling,
        assetURL,
        description,
      );
    }).toList();
    this.clothesFootwear = clothes;
    notifyListeners();
  }
}
  class HomeModelAccesories extends ChangeNotifier {

    List<Closet>? clothesAccessories;

  void getNumberAccessories() async {
    final users= FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes')
        .where('sellGet', isEqualTo: 'no')
        .where('category', isEqualTo: 'Accessories')
        .get();

    final List<Closet> clothes = snapshot.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];
      final String id = document.id;
      final String imageURL = data['imageURL'];
      final String selling = data['selling'];
      final String assetURL = data['assetURL'];
      final String description = data['description'];



      return Closet(
        brands,
        price,
        category,
        id,
        imageURL,
        selling,
        assetURL,
        description,
      );
    }).toList();
    this.clothesAccessories = clothes;
    notifyListeners();
  }
}
