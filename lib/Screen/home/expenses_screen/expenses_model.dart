
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../datePicker.dart';
import '../closet_screen/closet_model.dart';


class ExpensesModel extends ChangeNotifier {

  PickDate datePicker = PickDate();
  List<Closet>? clothesList;
  List<Closet>? clothesListSell;



  List<Monthly>? clothesListCharts01;
  List<Monthly>? clothesListCharts02;
  List<Monthly>? clothesListCharts03;
  List<Monthly>? clothesListCharts04;
  List<Monthly>? clothesListCharts05;
  List<Monthly>? clothesListCharts06;
  List<Monthly>? clothesListCharts07;
  List<Monthly>? clothesListCharts08;
  List<Monthly>? clothesListCharts09;
  List<Monthly>? clothesListCharts10;
  List<Monthly>? clothesListCharts11;
  List<Monthly>? clothesListCharts12;

  List<Monthly>? clothesListChartsSell01;
  List<Monthly>? clothesListChartsSell02;
  List<Monthly>? clothesListChartsSell03;
  List<Monthly>? clothesListChartsSell04;
  List<Monthly>? clothesListChartsSell05;
  List<Monthly>? clothesListChartsSell06;
  List<Monthly>? clothesListChartsSell07;
  List<Monthly>? clothesListChartsSell08;
  List<Monthly>? clothesListChartsSell09;
  List<Monthly>? clothesListChartsSell10;
  List<Monthly>? clothesListChartsSell11;
  List<Monthly>? clothesListChartsSell12;

  bool isLoading = true;





   getExpenses(String pickedYear, String pickedMonth, bool _isSell,) async {
    if (pickedYear == '') {
      pickedYear = datePicker.yearNowPicker();
    }

    if (pickedMonth == '') {
      pickedMonth = datePicker.monthNowPicker();
    }








    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    QuerySnapshot snapshot = await users.doc(user?.uid).collection(
        'clothes').where('isSell', whereIn: [false, true]).where(
        'year', isEqualTo: pickedYear)
        .where('month', isEqualTo: pickedMonth)
        .get();


    QuerySnapshot snapshotSell = await users.doc(user?.uid).collection(
        'clothes').where('isSell', isEqualTo: true).where(
        'yearSell', isEqualTo: pickedYear)
        .where('monthSell', isEqualTo: pickedMonth)
        .get();

// charts月毎取得buy
    QuerySnapshot snapshotCharts01 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', whereIn: [false, true]).where(
        'year', isEqualTo: pickedYear)
        .where('month', isEqualTo: '01')
        .get();

    QuerySnapshot snapshotCharts02 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', whereIn: [false, true]).where(
        'year', isEqualTo: pickedYear)
        .where('month', isEqualTo: '02')
        .get();

    QuerySnapshot snapshotCharts03 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', whereIn: [false, true]).where(
        'year', isEqualTo: pickedYear)
        .where('month', isEqualTo: '03')
        .get();

    QuerySnapshot snapshotCharts04 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', whereIn: [false, true]).where(
        'year', isEqualTo: pickedYear)
        .where('month', isEqualTo: '04')
        .get();

    QuerySnapshot snapshotCharts05 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', whereIn: [false, true]).where(
        'year', isEqualTo: pickedYear)
        .where('month', isEqualTo: '04')
        .get();

    QuerySnapshot snapshotCharts06 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', whereIn: [false, true]).where(
        'year', isEqualTo: pickedYear)
        .where('month', isEqualTo: '06')
        .get();

    QuerySnapshot snapshotCharts07 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', whereIn: [false, true]).where(
        'year', isEqualTo: pickedYear)
        .where('month', isEqualTo: '07')
        .get();

    QuerySnapshot snapshotCharts08 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', whereIn: [false, true]).where(
        'year', isEqualTo: pickedYear)
        .where('month', isEqualTo: '08')
        .get();

    QuerySnapshot snapshotCharts09 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', whereIn: [false, true]).where(
        'year', isEqualTo: pickedYear)
        .where('month', isEqualTo: '09')
        .get();

    QuerySnapshot snapshotCharts10 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', whereIn: [false, true]).where(
        'year', isEqualTo: pickedYear)
        .where('month', isEqualTo: '10')
        .get();

    QuerySnapshot snapshotCharts11 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', whereIn: [false, true]).where(
        'year', isEqualTo: pickedYear)
        .where('month', isEqualTo: '11')
        .get();

    QuerySnapshot snapshotCharts12 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', whereIn: [false, true]).where(
        'year', isEqualTo: pickedYear)
        .where('month', isEqualTo: '12')
        .get();

// charts月毎取得sell
    QuerySnapshot snapshotChartsSell01 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', isEqualTo: true).where(
        'yearSell', isEqualTo: pickedYear)
        .where('monthSell', isEqualTo: '01')
        .get();

    QuerySnapshot snapshotChartsSell02 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', isEqualTo: true).where(
        'yearSell', isEqualTo: pickedYear)
        .where('monthSell', isEqualTo: '02')
        .get();

    QuerySnapshot snapshotChartsSell03 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', isEqualTo: true).where(
        'yearSell', isEqualTo: pickedYear)
        .where('monthSell', isEqualTo: '03')
        .get();

    QuerySnapshot snapshotChartsSell04 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', isEqualTo: true).where(
        'yearSell', isEqualTo: pickedYear)
        .where('monthSell', isEqualTo: '04')
        .get();

    QuerySnapshot snapshotChartsSell05 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', isEqualTo: true).where(
        'yearSell', isEqualTo: pickedYear)
        .where('monthSell', isEqualTo: '04')
        .get();

    QuerySnapshot snapshotChartsSell06 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', isEqualTo: true).where(
        'yearSell', isEqualTo: pickedYear)
        .where('monthSell', isEqualTo: '06')
        .get();

    QuerySnapshot snapshotChartsSell07 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', isEqualTo: true).where(
        'yearSell', isEqualTo: pickedYear)
        .where('monthSell', isEqualTo: '07')
        .get();

    QuerySnapshot snapshotChartsSell08 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', isEqualTo: true).where(
        'yearSell', isEqualTo: pickedYear)
        .where('monthSell', isEqualTo: '08')
        .get();

    QuerySnapshot snapshotChartsSell09 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', isEqualTo: true).where(
        'yearSell', isEqualTo: pickedYear)
        .where('monthSell', isEqualTo: '09')
        .get();

    QuerySnapshot snapshotChartsSell10 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', isEqualTo: true).where(
        'yearSell', isEqualTo: pickedYear)
        .where('monthSell', isEqualTo: '10')
        .get();

    QuerySnapshot snapshotChartsSell11 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', isEqualTo: true).where(
        'yearSell', isEqualTo: pickedYear)
        .where('monthSell', isEqualTo: '11')
        .get();

    QuerySnapshot snapshotChartsSell12 = await users.doc(user?.uid).collection(
        'clothes').where('isSell', isEqualTo: true).where(
        'yearSell', isEqualTo: pickedYear)
        .where('monthSell', isEqualTo: '12')
        .get();





// buy
    final List<Closet> clothesList = snapshot.docs.map((
        DocumentSnapshot document) {
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

// sell
    final List<Closet> clothesListSell = snapshotSell.docs.map((
        DocumentSnapshot document) {
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

// charts月毎取得buy
    final List<Monthly> clothesListCharts01 = snapshotCharts01.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling);}).toList();

    final List<Monthly> clothesListCharts02 = snapshotCharts02.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListCharts03 = snapshotCharts03.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListCharts04 = snapshotCharts04.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListCharts05 = snapshotCharts05.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListCharts06 = snapshotCharts06.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListCharts07 = snapshotCharts07.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListCharts08 = snapshotCharts08.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListCharts09 = snapshotCharts09.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListCharts10 = snapshotCharts10.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListCharts11 = snapshotCharts11.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListCharts12= snapshotCharts12.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    // charts月毎取得sell
    final List<Monthly> clothesListChartsSell01 = snapshotChartsSell01.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling);}).toList();

    final List<Monthly> clothesListChartsSell02 = snapshotChartsSell02.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListChartsSell03 = snapshotChartsSell03.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListChartsSell04 = snapshotChartsSell04.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListChartsSell05 = snapshotChartsSell05.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListChartsSell06 = snapshotChartsSell06.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListChartsSell07 = snapshotChartsSell07.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListChartsSell08 = snapshotChartsSell08.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListChartsSell09 = snapshotChartsSell09.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListChartsSell10 = snapshotChartsSell10.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListChartsSell11 = snapshotChartsSell11.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    final List<Monthly> clothesListChartsSell12= snapshotChartsSell12.docs.map((
        DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String price = data['price'];
      final String selling = data['selling'];
      return Monthly(price, selling,);}).toList();

    this.clothesList = clothesList;
    this.clothesListSell = clothesListSell;
    this.clothesListCharts01 = clothesListCharts01;
    this.clothesListCharts02 = clothesListCharts02;
    this.clothesListCharts03 = clothesListCharts03;
    this.clothesListCharts04 = clothesListCharts04;
    this.clothesListCharts05 = clothesListCharts05;
    this.clothesListCharts06 = clothesListCharts06;
    this.clothesListCharts07 = clothesListCharts07;
    this.clothesListCharts08 = clothesListCharts08;
    this.clothesListCharts09 = clothesListCharts09;
    this.clothesListCharts10 = clothesListCharts10;
    this.clothesListCharts11 = clothesListCharts11;
    this.clothesListCharts12 = clothesListCharts12;

    this.clothesListChartsSell01 = clothesListChartsSell01;
    this.clothesListChartsSell02 = clothesListChartsSell02;
    this.clothesListChartsSell03 = clothesListChartsSell03;
    this.clothesListChartsSell04 = clothesListChartsSell04;
    this.clothesListChartsSell05 = clothesListChartsSell05;
    this.clothesListChartsSell06 = clothesListChartsSell06;
    this.clothesListChartsSell07 = clothesListChartsSell07;
    this.clothesListChartsSell08 = clothesListChartsSell08;
    this.clothesListChartsSell09 = clothesListChartsSell09;
    this.clothesListChartsSell10 = clothesListChartsSell10;
    this.clothesListChartsSell11 = clothesListChartsSell11;
    this.clothesListChartsSell12 = clothesListChartsSell12;
    this.isLoading = true;


    notifyListeners();
  }
}


class Monthly {

  String price;
  String selling;
 Monthly(
      this.price,
      this.selling,
     );
}