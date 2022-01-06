
import 'package:closet_app_xxx/Screen/expenses_screen/expenses_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../datePicker.dart';
import '../closet_screen/closet_model.dart';


class ExpensesModel extends ChangeNotifier {

PickDate datePicker = PickDate();
List<Closet>? clothesList;

String? month;



void getExpenses(String pickedYear, String pickedMonth) async {

  if(pickedYear == ''){
    pickedYear = datePicker.yearNowPicker();
  }

  if(pickedMonth == ''){
    pickedMonth = datePicker.monthNowPicker();
  }


final users = FirebaseFirestore.instance.collection('users');
User? user = FirebaseAuth.instance.currentUser;
QuerySnapshot snapshot = await users.doc(user?.uid).collection(
    'clothes').where('year', isEqualTo: pickedYear).where('month', isEqualTo: pickedMonth).get();



    final List<Closet> clothesList = snapshot.docs.map((DocumentSnapshot document) {
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

    this.clothesList = clothesList;
    notifyListeners();
  }
}
