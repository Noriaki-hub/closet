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
  Closet(this.brands,
      this.price,
      this.category,
      this.id,
      this.imageURL,
      this.selling);

}



class ClosetModel extends ChangeNotifier {

  List<Closet>? closet2;

  void fetchClosetList() async {
    final users= FirebaseFirestore.instance.collection('users');
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



      return Closet(
        brands,
        price,
        category,
        id,
        imageURL,
        selling,
      );
    }).toList();
    this.closet2 = closet3;
    notifyListeners();
  }
}