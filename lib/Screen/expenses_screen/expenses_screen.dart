
import 'package:closet_app_xxx/Screen/closet_screen/closet_model.dart';
import 'package:closet_app_xxx/Screen/closet_screen/closet_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../datePicker.dart';
import 'expenses_model.dart';




class ExpensesPage extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {
    return _ExpensesPage();
  }
}

class _ExpensesPage extends State<ExpensesPage> {

  PickDate datePicker = PickDate();

  String pickedYear = '';
  String pickedMonth = '';





  List<int> _list() {
    int year = int.parse(datePicker.yearNowPicker());
    final list = List.generate(5, (i) => year - i);
    return list;
  }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<ExpensesModel>(create: (_) =>
      ExpensesModel()
        ..getExpenses(pickedYear, pickedMonth),

      ),

    ],
      child: Scaffold(
          body: Center(
              child: Consumer<ExpensesModel>(builder: (context, model, child) {

                final List<Closet>? clothesList = model.clothesList;



                if (clothesList == null) {
                  return Container(
                    color: Colors.white,
                    child: Center(
                      child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: Colors.grey,
                          )
                      ),
                    ),
                  );
                }

                final List<Widget> widgets = clothesList
                    .map(
                      (clothes) =>
                        Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(),
                              ),
                            ),
                          child: ListTile(
                            title: Text(clothes.brands),
                            subtitle: Text(clothes.category),
                            leading: Container(width: 50,
                              child: clothes.assetURL != '' ?
                              Image.asset(clothes.assetURL)
                                  : Image.network(clothes.imageURL, fit: BoxFit.cover,),
                            ),
                            trailing: Text(clothes.price),
                          ),
                        ),
                ).toList();

                int? sum;

                if (clothesList.length.toString() == '0') {
                  sum = 0;
                }else{
                  sum = clothesList
                      .map<int>((clothes) => int.parse(clothes.price))
                      .reduce((curr, next) => curr + next);
                }




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
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            pickedYear == ''?
                      datePicker.yearNowPicker()
                            : pickedYear,
                            style: TextStyle(
                              color: Colors.black
                            ),
                          ),
                          Text('/',
                            style: TextStyle(
                                color: Colors.black
                            ),

                          ),
                          Text(
                            pickedMonth == ''?
                            datePicker.monthNowPicker()
                                :pickedMonth,
                            style: TextStyle(
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: InkWell(
                              onTap: () async{
                                final result = await showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: 250,
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            TextButton(
                                                child: const Text('Done'),
                                                onPressed: () {
                                                  Navigator.pop(context, true);
                                                }
                                            ),
                                            const Divider(),
                                            Expanded(
                                              child: CupertinoPicker(
                                                itemExtent: 30,
                                                children: _list().map((years) => Text("$years")).toList(),
                                                onSelectedItemChanged: (years) {
                                                  setState(() {
                                                    pickedYear = _list()[years].toString();
                                                  });
                                                },

                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                                if (result){
                                  pickedMonth = '';
                                  pickedYear = pickedYear;
                                 model.getExpenses(pickedYear, pickedMonth);
                                }
                              },
                              child: Container(

                                child: Center(
                                    child: Text("years",
                                      style :TextStyle(color: Colors.black),
                                    )
                                ),
                              )
                          ),
                        ),
                      ],

                    ),
                    body: Center(
                        child: Column(
                          children: [

                            Container(
                              height: 50,
                              width: 400,
                              color: Colors.grey.withOpacity(0.1),
                             child: SingleChildScrollView(
                               scrollDirection: Axis.horizontal,
                               child: Row(
                                 children: [
                                   SizedBox(width: 5,),
                                   InkWell(
                                       onTap: (){
                                         pickedMonth = '01';
                                         model.getExpenses(pickedYear, pickedMonth);
                                       },
                                     child: Card(
                                       elevation: 5,
                                       child: Container(
                                         height: 40,
                                         width: 100,
                                         color: Colors.grey.withOpacity(0.1),
                                         child: Center(
                                           child: Text("Jan"),
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 5,),
                                   InkWell(

                                     onTap: (){
                                       pickedMonth = '02';
                                       model.getExpenses(pickedYear, pickedMonth);
                                     },
                                     child: Card(
                                       elevation: 5,
                                       child: Container(
                                         height: 40,
                                         width: 100,
                                         color: Colors.grey.withOpacity(0.1),
                                         child: Center(
                                           child: Text("Feb"),
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 5,),
                                   InkWell(
                                     onTap: (){
                                       pickedMonth = '03';
                                       model.getExpenses(pickedYear, pickedMonth);
                                     },
                                     child: Card(
                                       elevation: 5,
                                       child: Container(
                                         height: 40,
                                         width: 100,
                                         color: Colors.grey.withOpacity(0.1),
                                         child: Center(
                                           child: Text("Mar"),
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 5,),
                                   InkWell(
                                     onTap: (){
                                       pickedMonth = '04';
                                       model.getExpenses(pickedYear, pickedMonth);
                                     },

                                     child: Card(
                                       elevation: 5,
                                       child: Container(
                                         height: 40,
                                         width: 100,
                                         color: Colors.grey.withOpacity(0.1),
                                         child: Center(
                                           child: Text("Apl"),
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 5,),
                                   InkWell(
                                     onTap: (){
                                       pickedMonth = '05';
                                       model.getExpenses(pickedYear, pickedMonth);
                                     },
                                     child: Card(
                                       elevation: 5,
                                       child: Container(
                                         height: 40,
                                         width: 100,
                                         color: Colors.grey.withOpacity(0.1),
                                         child: Center(
                                           child: Text("May"),
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 5,),
                                   InkWell(
                                     onTap: (){
                                       pickedMonth = '06';
                                       model.getExpenses(pickedYear, pickedMonth);
                                     },
                                     child: Card(
                                       elevation: 5,
                                       child: Container(
                                         height: 40,
                                         width: 100,
                                         color: Colors.grey.withOpacity(0.1),
                                         child: Center(
                                           child: Text("Jun"),
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 5,),
                                   InkWell(
                                     onTap: (){
                                       pickedMonth = '07';
                                       model.getExpenses(pickedYear, pickedMonth);
                                     },
                                     child: Card(
                                       elevation: 5,
                                       child: Container(
                                         height: 40,
                                         width: 100,
                                         color: Colors.grey.withOpacity(0.1),
                                         child: Center(
                                           child: Text("Jul"),
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 5,),
                                   InkWell(
                                     onTap: (){
                                       pickedMonth = '08';
                                       model.getExpenses(pickedYear, pickedMonth);
                                     },
                                     child: Card(
                                       elevation: 5,
                                       child: Container(
                                         height: 40,
                                         width: 100,
                                         color: Colors.grey.withOpacity(0.1),
                                         child: Center(
                                           child: Text("Aug"),
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 5,),
                                   InkWell(
                                     onTap: (){
                                       pickedMonth = '09';
                                       model.getExpenses(pickedYear, pickedMonth);
                                     },
                                     child: Card(
                                       elevation: 5,
                                       child: Container(
                                         height: 40,
                                         width: 100,
                                         color: Colors.grey.withOpacity(0.1),
                                         child: Center(
                                           child: Text("Sep"),
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 5,),
                                   InkWell(
                                     onTap: (){
                                       pickedMonth = '10';
                                       model.getExpenses(pickedYear, pickedMonth);
                                     },
                                     child: Card(
                                       elevation: 5,
                                       child: Container(
                                         height: 40,
                                         width: 100,
                                         color: Colors.grey.withOpacity(0.1),
                                         child: Center(
                                           child: Text("Oct"),
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 5,),
                                   InkWell(
                                     onTap: (){
                                       pickedMonth = '11';
                                       model.getExpenses(pickedYear, pickedMonth);
                                     },
                                     child: Card(
                                       elevation: 5,
                                       child: Container(

                                         height: 40,
                                         width: 100,
                                         color: Colors.grey.withOpacity(0.1),
                                         child: Center(
                                           child: Text("Nov"),
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 5,),
                                   InkWell(
                                     onTap: (){
                                       pickedMonth = '12';
                                       model.getExpenses(pickedYear, pickedMonth);
                                     },
                                     child: Card(elevation: 5,
                                       child: Container(
                                         height: 40,
                                         width: 100,
                                         color: Colors.grey.withOpacity(0.1),
                                         child: Center(
                                           child: Text("Dec"),
                                         ),
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 5,),

                                 ],

                               ),
                             ),
                            ),
                            
                            Container(
                              height: 200,
                              width: 400,
                              color: Colors.grey.withOpacity(0.1),
                              child: Container(
                                height: 100,
                                width: 100,
                                child: Center(
                                  child: Text(
                                      "¥$sum",
                                    style: TextStyle(
                                      fontSize: 50
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: widgets,
                            )
                          ],
                        ),


                    ),
                  );
              })
          ),
      ),
    );
  }


_showPicker() {
  showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          height: 250,
          color: Colors.white,
          child: Column(
            children: [
              TextButton(
                  child: const Text('Done'),
                  onPressed: () {
                    Navigator.pop(context,);
                  }
              ),
              const Divider(),
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 30,
                  children: _list().map((years) => Text("$years")).toList(),
                  onSelectedItemChanged: (years) {
                    setState(() {
                      pickedYear = _list()[years].toString();
                    });
                  },

                ),
              ),
            ],
          ),
        );
      });
  return true;
}
}