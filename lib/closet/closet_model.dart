import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Closet {
  String brands;
  String price;
  String category;
  String id;
  String imageURL;
  String selling;
  String assetURL;
  String description;
  Closet(this.brands,
      this.price,
      this.category,
      this.id,
      this.imageURL,
      this.selling,
      this.assetURL,
      this.description,
      );

}




class ClosetModel extends ChangeNotifier {

  List<Closet>? closet2;

  void fetchClosetList() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes').where(
        'buyGet', isEqualTo : 'yes').get();

    final List<Closet> closet3 = snapshot.docs.map((
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
    this.closet2 = closet3;
    notifyListeners();
  }

  void fetchClosetListT() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes').where(
        'buyGet', isEqualTo : 'yes')
        .where
      ('category', isEqualTo: 'Tops')
        .get();

    final List<Closet> closet3 = snapshot.docs.map((
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
    this.closet2 = closet3;
    notifyListeners();
  }

  void fetchClosetListB() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes').where(
        'buyGet', isEqualTo : 'yes')
        .where
      ('category', isEqualTo: 'Bottoms')
        .get();

    final List<Closet> closet3 = snapshot.docs.map((
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
    this.closet2 = closet3;
    notifyListeners();
  }

  void fetchClosetListO() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes').where(
        'buyGet', isEqualTo : 'yes')
        .where('category', isEqualTo: 'Outer')
        .get();

    final List<Closet> closet3 = snapshot.docs.map((
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
    this.closet2 = closet3;
    notifyListeners();
  }


  void fetchClosetListF() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes').where(
        'buyGet', isEqualTo : 'yes')
        .where('category', isEqualTo: 'Footwear')
        .get();

    final List<Closet> closet3 = snapshot.docs.map((
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
    this.closet2 = closet3;
    notifyListeners();
  }

  void fetchClosetListA() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes').where(
        'buyGet', isEqualTo : 'yes')
        .where('category', isEqualTo: 'Accessories')
        .get();

    final List<Closet> closet3 = snapshot.docs.map((
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
    this.closet2 = closet3;
    notifyListeners();
  }

  void fetchClosetListSell() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes').where(
        'sellGet', isEqualTo : 'yes')
        .get();

    final List<Closet> closet3 = snapshot.docs.map((
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
    this.closet2 = closet3;
    notifyListeners();
  }

  void fetchClosetListSellT() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes').where(
        'sellGet', isEqualTo : 'yes')
        .where('category', isEqualTo: 'Tops')
        .get();

    final List<Closet> closet3 = snapshot.docs.map((
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
    this.closet2 = closet3;
    notifyListeners();
  }

  void fetchClosetListSellB() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes').where(
        'sellGet', isEqualTo : 'yes')
        .where('category', isEqualTo: 'Bottoms')
        .get();

    final List<Closet> closet3 = snapshot.docs.map((
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
    this.closet2 = closet3;
    notifyListeners();
  }

  void fetchClosetListSellO() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes').where(
        'sellGet', isEqualTo : 'yes')
        .where('category', isEqualTo: 'Outer')
        .get();

    final List<Closet> closet3 = snapshot.docs.map((
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
    this.closet2 = closet3;
    notifyListeners();
  }

  void fetchClosetListSellF() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes').where(
        'sellGet', isEqualTo : 'yes')
        .where('category', isEqualTo: 'Footwear')
        .get();

    final List<Closet> closet3 = snapshot.docs.map((
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
    this.closet2 = closet3;
    notifyListeners();
  }

  void fetchClosetListSellA() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes').where(
        'sellGet', isEqualTo: 'yes')
        .where('category', isEqualTo: 'Accessories')
        .get();

    final List<Closet> closet3 = snapshot.docs.map((
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
    this.closet2 = closet3;
    notifyListeners();
  }




}








