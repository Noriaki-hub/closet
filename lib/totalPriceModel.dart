import 'clothes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class TotalPriceModel extends ChangeNotifier {

  List<Clothes>? clothes2;

  void fetchClothesList() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(
        'clothes').get();

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
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(
        'clothes').where('category', isEqualTo: 'Tops').get();

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
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(
        'clothes').where('category', isEqualTo: 'Bottoms').get();

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