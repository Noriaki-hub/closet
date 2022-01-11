
import 'package:closet_app_xxx/Screen/closet_screen/closet_model.dart';
import 'package:closet_app_xxx/clothes_sell/SellModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


class SellPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SellModel>(create: (_) =>
        SellModel()
          ..fetchSellClothesList(),
        ),
      ],
      child: Scaffold(
        body: Center(
            child: Consumer<SellModel>(builder: (context, model, child) {
              final List<Closet>? closet2 = model.closet2;

              if (closet2 == null) {
                return CircularProgressIndicator();
              }
              final List<Widget> widgets = closet2
                  .map(
                    (clothes) =>
                    ListTile(
                      title: Text(clothes.brands),
                      subtitle: Text(clothes.category),
                      leading: clothes.assetURL != '' ?
                      Image.asset(clothes.assetURL)
                          : Image.network(clothes.imageURL, fit: BoxFit.cover,),
                      onTap: () async{
                        var result =
                        await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                SellPage2(clothes, ),
                            )
                        );
                        if(result){
                          model.fetchSellClothesList();
                        }
                      },
                    ),
              )
                  .toList();

              return
                Scaffold(
                  appBar: AppBar(
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: InkWell(
                          onTap: (){
                            Navigator.pop(context, true);
                          },
                          child: Container(

                            child: Center(
                                child: Text("Back",
                                  style :TextStyle(color: Colors.black),
                                )
                            ),
                          )
                      ),
                    ),
                    backgroundColor: Colors.white,
                  iconTheme: IconThemeData(
                  color: Colors.grey,
                  ),

                  ),
                  body: Center(
                      child:
                      ListView(
                        children: widgets,
                      )
                  ),
                );
            })
        ),
      ),
    );
  }
}

class SellPage2 extends StatefulWidget {


  final Closet clothes;

  SellPage2(this.clothes,);


  @override
  State<StatefulWidget> createState() {
    return _SellPage2(clothes);
  }

}

class _SellPage2  extends State<SellPage2>{

  final Closet clothes;

  _SellPage2(this.clothes,);

  String? selling;


 Future sellUpload (context,)async{
   await _uploadFirebase();
   Navigator.pop(context, true);
 }



  Future _uploadFirebase() async{
    final users= await FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;

    users.doc(user!.uid).collection('clothes').doc(clothes.id).update({
     'selling': selling,
      'isSell' : true,
      'yearSell' : yearNowPicker(),
      'daySEll' : dayNowPicker(),
      'monthSell': monthNowPicker(),


    },);
  }

  Future _showDialog(context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("エラー"),
          content: Text("金額を入力してください"),
          actions: [
            TextButton(
            child: Text("OK"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        );
      },
    );
  }

  Future _showDialog2(context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("詳細"),
          content: Text(clothes.description),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  DateTime? selectedDate;

  String yearNowPicker() {
    if (selectedDate == null){
      selectedDate = DateTime.now();
    }
    DateFormat outputFormat = DateFormat('yyyy');
    String date = outputFormat.format(selectedDate!);
    return date;
  }

  String monthNowPicker() {
    if (selectedDate == null){
      selectedDate = DateTime.now();
    }
    DateFormat outputFormat = DateFormat('MM');
    String date = outputFormat.format(selectedDate!);
    return date;
  }

  String dayNowPicker() {
    if (selectedDate == null){
      selectedDate = DateTime.now();
    }
    DateFormat outputFormat = DateFormat('dd');
    String date = outputFormat.format(selectedDate!);
    return date;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: SizedBox(
            height: 50,
            width: 50,
            child: InkWell(
                onTap: (){
                  Navigator.pop(context, false);
                },
                child: Container(

                  child: Center(
                      child: Text("Back",
                        style :TextStyle(color: Colors.black),
                      )
                  ),
                )
            ),
          ),
          title: Text(clothes.brands,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(onPressed: (){
              _showDialog2(context);
            },
                icon:  Icon(Icons.book)
            )
          ],
          iconTheme: IconThemeData(
            color: Colors.grey,
          ),
        ),
        body:Center(
                    child: SingleChildScrollView(
                      child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.all(12),
                          child: GestureDetector(
                              child:
                              CircleAvatar(
                                  radius: 155,
                                  backgroundColor: Colors.black54,
                                  child:  ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: Container(
                                      color: Colors.white,
                                      child: clothes.assetURL != '' ?
                                      Image.asset(clothes.assetURL, width: 300,
                                        height: 300,
                                        fit: BoxFit.fitHeight,)
                                          : Image.network(clothes.imageURL, width: 300,
                                    height: 300,
                                    fit: BoxFit.fitHeight,),
                                    )
                                  )
                              )
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            showDatePicker();
                          },
                          child: Container(
                            child: Center(
                              child: Text(yearNowPicker() + '/' + monthNowPicker() + '/' + dayNowPicker(),
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
                            ),
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius
                                  .circular(10),
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ),

                        SizedBox(height: 20,),


                        Container(
                          width: 250,
                          child: TextField(
                              decoration: InputDecoration(
                                hintText: '¥',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Colors.black45,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )
                                ),
                              ),
                              onChanged: (text){
                                selling = text;
                              }
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: OutlinedButton(
                            child: const Text('Sell'),
                            style: OutlinedButton.styleFrom(
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: const BorderSide(),
                            ),
                            onPressed: () {
                              selling != null ?
                              sellUpload(context,)
                                  : _showDialog(context);
                            },
                          ),
                        ),
                      ]
                ),
                    ),
                ),
              );
            }
  void showDatePicker()
  {  showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height*0.25,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (value) {
              if (value != selectedDate)
                setState(() {
                  selectedDate = value;
                });
            },
            initialDateTime: DateTime.now(),
            minimumYear: 2019,
            maximumYear: 2022,
          ),
        );
      }
  );
  }

  }