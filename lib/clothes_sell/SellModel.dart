import 'package:closet_app_xxx/clothes_buy/clothes_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class SellModel extends ChangeNotifier {

  List<Clothes>? clothes2;

  void fetchSellClothesList() async {
    final users= FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection('clothes').where('closetGet', isEqualTo: 'ok').where(
        'selling', isEqualTo: '0').get();

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