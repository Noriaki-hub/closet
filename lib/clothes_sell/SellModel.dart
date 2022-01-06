import 'package:closet_app_xxx/Screen/closet_screen/closet_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class SellModel extends ChangeNotifier {



  List<Closet>? closet2;


  void fetchSellClothesList() async {
    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await users.doc(user!.uid).collection(
        'clothes').where(
        'sellGet', isEqualTo: 'no').get();

    final List<Closet> closet3 = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      final String category = data['category'];
      final String price = data['price'];
      final String brands = data['brands'];
      final String id = document.id;
      final String imageURL = data['imageURL'];
      final String selling = data['selling'];
      final String assetURL = data['assetURL'];
      final String description = data["description"];


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
