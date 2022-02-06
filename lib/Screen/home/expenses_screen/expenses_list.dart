
import 'package:closet_app_xxx/Screen/home/closet_screen/closet_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../datePicker.dart';
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

  bool _isSell = false;

  bool isLoading = false;


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
        ..getExpenses(pickedYear, pickedMonth, _isSell,),

      ),

    ],
      child: Scaffold(
        body: Center(
            child: Consumer<ExpensesModel>(builder: (context, model, child,) {
              // list



              final List<Closet>? clothesList = model.clothesList;
              final List<Closet>? clothesListSell = model.clothesListSell;
              // chartsBuy

              final List<Monthly>? clothesListCharts01 = model
                  .clothesListCharts01;
              final List<Monthly>? clothesListCharts02 = model
                  .clothesListCharts02;
              final List<Monthly>? clothesListCharts03 = model
                  .clothesListCharts03;
              final List<Monthly>? clothesListCharts04 = model
                  .clothesListCharts04;
              final List<Monthly>? clothesListCharts05 = model
                  .clothesListCharts05;
              final List<Monthly>? clothesListCharts06 = model
                  .clothesListCharts06;
              final List<Monthly>? clothesListCharts07 = model
                  .clothesListCharts07;
              final List<Monthly>? clothesListCharts08 = model
                  .clothesListCharts08;
              final List<Monthly>? clothesListCharts09 = model
                  .clothesListCharts09;
              final List<Monthly>? clothesListCharts10 = model
                  .clothesListCharts10;
              final List<Monthly>? clothesListCharts11 = model
                  .clothesListCharts11;
              final List<Monthly>? clothesListCharts12 = model
                  .clothesListCharts12;

              // chartsSell
              final List<Monthly>? clothesListChartsSell01 = model
                  .clothesListChartsSell01;
              final List<Monthly>? clothesListChartsSell02 = model
                  .clothesListChartsSell02;
              final List<Monthly>? clothesListChartsSell03 = model
                  .clothesListChartsSell03;
              final List<Monthly>? clothesListChartsSell04 = model
                  .clothesListChartsSell04;
              final List<Monthly>? clothesListChartsSell05 = model
                  .clothesListChartsSell05;
              final List<Monthly>? clothesListChartsSell06 = model
                  .clothesListChartsSell06;
              final List<Monthly>? clothesListChartsSell07 = model
                  .clothesListChartsSell07;
              final List<Monthly>? clothesListChartsSell08 = model
                  .clothesListChartsSell08;
              final List<Monthly>? clothesListChartsSell09 = model
                  .clothesListChartsSell09;
              final List<Monthly>? clothesListChartsSell10 = model
                  .clothesListChartsSell10;
              final List<Monthly>? clothesListChartsSell11 = model
                  .clothesListChartsSell11;
              final List<Monthly>? clothesListChartsSell12 = model
                  .clothesListChartsSell12;

              // chartsBuy
              if (clothesListCharts01 == null) {
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
              if (clothesListCharts02 == null) {
                return Container();
              }
              if (clothesListCharts03 == null) {
                return Container();
              }
              if (clothesListCharts04 == null) {
                return Container();
              }
              if (clothesListCharts05 == null) {
                return Container();
              }
              if (clothesListCharts06 == null) {
                return Container();
              }
              if (clothesListCharts07 == null) {
                return Container();
              }
              if (clothesListCharts08 == null) {
                return Container();
              }
              if (clothesListCharts09 == null) {
                return Container();
              }
              if (clothesListCharts10 == null) {
                return Container();
              }
              if (clothesListCharts11 == null) {
                return Container();
              }
              if (clothesListCharts12 == null) {
                return Container();
              }

              // chartsSell

              if (clothesListChartsSell01 == null) {
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
              if (clothesListChartsSell02 == null) {
                return Container();
              }
              if (clothesListChartsSell03 == null) {
                return Container();
              }
              if (clothesListChartsSell04 == null) {
                return Container();
              }
              if (clothesListChartsSell05 == null) {
                return Container();
              }
              if (clothesListChartsSell06 == null) {
                return Container();
              }
              if (clothesListChartsSell07 == null) {
                return Container();
              }
              if (clothesListChartsSell08 == null) {
                return Container();
              }
              if (clothesListChartsSell09 == null) {
                return Container();
              }
              if (clothesListChartsSell10 == null) {
                return Container();
              }
              if (clothesListChartsSell11 == null) {
                return Container();
              }
              if (clothesListChartsSell12 == null) {
                return Container();
              }

              if (pickedMonth == '') {
                pickedMonth = datePicker.monthNowPicker();
              }


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

              if (clothesListSell == null) {
                return  Container(
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
                              : Image.network(
                            clothes.imageURL, fit: BoxFit.cover,),
                        ),
                        trailing: Text(clothes.price),
                      ),
                    ),
              ).toList();

              final List<Widget> widgetsSell = clothesListSell
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
                              : Image.network(
                            clothes.imageURL, fit: BoxFit.cover,),
                        ),
                        trailing: Column(
                          children: [
                            Text(clothes.selling),

                          ],
                        ),
                      ),
                    ),
              ).toList();


              int? sum;
              int? sumSelling;

              if (clothesList.length.toString() == '0') {
                sum = 0;
              } else {
                sum = clothesList
                    .map<int>((clothes) => int.parse(clothes.price))
                    .reduce((curr, next) => curr + next);
              }

              if (clothesListSell.length.toString() == '0') {
                sumSelling = 0;
              } else {
                sumSelling = clothesListSell
                    .map<int>((clothes) => int.parse(clothes.selling))
                    .reduce((curr, next) => curr + next);
              }


              double? sum01;

              if (clothesListCharts01.length.toString() == '0') {
                sum01 = 0;
              } else {
                sum01 = clothesListCharts01
                    .map<double>((clothes) => double.parse(clothes.price))
                    .reduce((curr, next) => curr + next);
              }

              double? sum02;

              if (clothesListCharts02.length.toString() == '0') {
                sum02 = 0;
              } else {
                sum02 = clothesListCharts02
                    .map<double>((clothes) => double.parse(clothes.price))
                    .reduce((curr, next) => curr + next);
              }

              double? sum03;

              if (clothesListCharts03.length.toString() == '0') {
                sum03 = 0;
              } else {
                sum03 = clothesListCharts03
                    .map<double>((clothes) => double.parse(clothes.price))
                    .reduce((curr, next) => curr + next);
              }

              double? sum04;

              if (clothesListCharts04.length.toString() == '0') {
                sum04 = 0;
              } else {
                sum04 = clothesListCharts04
                    .map<double>((clothes) => double.parse(clothes.price))
                    .reduce((curr, next) => curr + next);
              }

              double? sum05;

              if (clothesListCharts05.length.toString() == '0') {
                sum05 = 0;
              } else {
                sum05 = clothesListCharts05
                    .map<double>((clothes) => double.parse(clothes.price))
                    .reduce((curr, next) => curr + next);
              }

              double? sum06;

              if (clothesListCharts06.length.toString() == '0') {
                sum06 = 0;
              } else {
                sum06 = clothesListCharts06
                    .map<double>((clothes) => double.parse(clothes.price))
                    .reduce((curr, next) => curr + next);
              }

              double? sum07;

              if (clothesListCharts07.length.toString() == '0') {
                sum07 = 0;
              } else {
                sum07 = clothesListCharts07
                    .map<double>((clothes) => double.parse(clothes.price))
                    .reduce((curr, next) => curr + next);
              }

              double? sum08;

              if (clothesListCharts08.length.toString() == '0') {
                sum08 = 0;
              } else {
                sum08 = clothesListCharts08
                    .map<double>((clothes) => double.parse(clothes.price))
                    .reduce((curr, next) => curr + next);
              }

              double? sum09;

              if (clothesListCharts09.length.toString() == '0') {
                sum09 = 0;
              } else {
                sum09 = clothesListCharts09
                    .map<double>((clothes) => double.parse(clothes.price))
                    .reduce((curr, next) => curr + next);
              }

              double? sum10;

              if (clothesListCharts10.length.toString() == '0') {
                sum10 = 0;
              } else {
                sum10 = clothesListCharts10
                    .map<double>((clothes) => double.parse(clothes.price))
                    .reduce((curr, next) => curr + next);
              }

              double? sum11;

              if (clothesListCharts11.length.toString() == '0') {
                sum11 = 0;
              } else {
                sum11 = clothesListCharts11
                    .map<double>((clothes) => double.parse(clothes.price))
                    .reduce((curr, next) => curr + next);
              }

              double? sum12;

              if (clothesListCharts12.length.toString() == '0') {
                sum12 = 0;
              } else {
                sum12 = clothesListCharts12
                    .map<double>((clothes) => double.parse(clothes.price))
                    .reduce((curr, next) => curr + next);
              }


              double? sumSelling01;

              if (clothesListChartsSell01.length.toString() == '0') {
                sumSelling01 = 0;
              } else {
                sumSelling01 = clothesListChartsSell01
                    .map<double>((clothes) => double.parse(clothes.selling))
                    .reduce((curr, next) => curr + next);
              }

              double? sumSelling02;

              if (clothesListChartsSell02.length.toString() == '0') {
                sumSelling02 = 0;
              } else {
                sumSelling02 = clothesListChartsSell02
                    .map<double>((clothes) => double.parse(clothes.selling))
                    .reduce((curr, next) => curr + next);
              }

              double? sumSelling03;

              if (clothesListChartsSell03.length.toString() == '0') {
                sumSelling03 = 0;
              } else {
                sumSelling03 = clothesListChartsSell03
                    .map<double>((clothes) => double.parse(clothes.selling))
                    .reduce((curr, next) => curr + next);
              }

              double? sumSelling04;

              if (clothesListChartsSell04.length.toString() == '0') {
                sumSelling04 = 0;
              } else {
                sumSelling04 = clothesListChartsSell04
                    .map<double>((clothes) => double.parse(clothes.selling))
                    .reduce((curr, next) => curr + next);
              }

              double? sumSelling05;

              if (clothesListChartsSell05.length.toString() == '0') {
                sumSelling05 = 0;
              } else {
                sumSelling05 = clothesListChartsSell05
                    .map<double>((clothes) => double.parse(clothes.selling))
                    .reduce((curr, next) => curr + next);
              }

              double? sumSelling06;

              if (clothesListChartsSell06.length.toString() == '0') {
                sumSelling06 = 0;
              } else {
                sumSelling06 = clothesListChartsSell06
                    .map<double>((clothes) => double.parse(clothes.selling))
                    .reduce((curr, next) => curr + next);
              }

              double? sumSelling07;

              if (clothesListChartsSell07.length.toString() == '0') {
                sumSelling07 = 0;
              } else {
                sumSelling07 = clothesListChartsSell07
                    .map<double>((clothes) => double.parse(clothes.selling))
                    .reduce((curr, next) => curr + next);
              }

              double? sumSelling08;

              if (clothesListChartsSell08.length.toString() == '0') {
                sumSelling08 = 0;
              } else {
                sumSelling08 = clothesListChartsSell08
                    .map<double>((clothes) => double.parse(clothes.selling))
                    .reduce((curr, next) => curr + next);
              }

              double? sumSelling09;

              if (clothesListChartsSell09.length.toString() == '0') {
                sumSelling09 = 0;
              } else {
                sumSelling09 = clothesListChartsSell09
                    .map<double>((clothes) => double.parse(clothes.selling))
                    .reduce((curr, next) => curr + next);
              }

              double? sumSelling10;

              if (clothesListChartsSell10.length.toString() == '0') {
                sumSelling10 = 0;
              } else {
                sumSelling10 = clothesListChartsSell10
                    .map<double>((clothes) => double.parse(clothes.selling))
                    .reduce((curr, next) => curr + next);
              }

              double? sumSelling11;

              if (clothesListChartsSell11.length.toString() == '0') {
                sumSelling11 = 0;
              } else {
                sumSelling11 = clothesListChartsSell11
                    .map<double>((clothes) => double.parse(clothes.selling))
                    .reduce((curr, next) => curr + next);
              }

              double? sumSelling12;

              if (clothesListChartsSell12.length.toString() == '0') {
                sumSelling12 = 0;
              } else {
                sumSelling12 = clothesListChartsSell12
                    .map<double>((clothes) => double.parse(clothes.selling))
                    .reduce((curr, next) => curr + next);
              }





              return
                Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context, true);
                          },
                          child: Container(

                            child: Center(
                                child: Text("Back",
                                  style: TextStyle(color: Colors.black),
                                )
                            ),
                          )
                      ),
                    ),


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
                                    onTap: () async {
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
                                                        Navigator.pop(
                                                            context, true);
                                                      }
                                                  ),
                                                  const Divider(),
                                                  Expanded(
                                                    child: CupertinoPicker(
                                                      itemExtent: 30,
                                                      children: _list().map((
                                                          years) =>
                                                          Text("$years"))
                                                          .toList(),
                                                      onSelectedItemChanged: (
                                                          years) {
                                                        setState(() {
                                                          pickedYear =
                                                              _list()[years]
                                                                  .toString();
                                                        });
                                                      },

                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                      if (result) {
                                        pickedYear = pickedYear;
                                        pickedMonth = '';
                                        model.getExpenses(
                                          pickedYear, pickedMonth, _isSell,);
                                      }
                                    },
                                    child: Card(
                                      elevation: 5,
                                      child: Container(
                                        width: 100,
                                        color: Colors.grey.withOpacity(0.1),
                                        child: Center(
                                          child: Text(
                                            pickedYear == '' ?
                                            datePicker.yearNowPicker()
                                                : pickedYear,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                                SizedBox(width: 5,),
                                InkWell(
                                  onTap: () async{
                                    pickedMonth = '01';
                                    isLoading = true;
                                    setState(() {});
                                    await model.getExpenses(
                                      pickedYear, pickedMonth, _isSell,);
                                     isLoading = false;
                                     setState(() {});
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      height: 40,
                                      width: 50,
                                      color:
                                      pickedMonth == '01' ?
                                      Colors.grey.withOpacity(0.5)
                                          :
                                      Colors.grey.withOpacity(0.1),
                                      child: Center(
                                        child: Text("Jan"),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                InkWell(

                                  onTap: () async{
                                    pickedMonth = '02';
                                    isLoading = true;
                                    setState(() {});
                                    await model.getExpenses(
                                      pickedYear, pickedMonth, _isSell,);
                                    isLoading = false;
                                    setState(() {});
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      height: 40,
                                      width: 50,
                                      color: pickedMonth == '02' ?
                                      Colors.grey.withOpacity(0.5)
                                          :
                                      Colors.grey.withOpacity(0.1),
                                      child: Center(
                                        child: Text("Feb"),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                InkWell(
                                  onTap: () async{
                                    pickedMonth = '03';
                                    isLoading = true;
                                    setState(() {});
                                    await model.getExpenses(
                                      pickedYear, pickedMonth, _isSell,);
                                    isLoading = false;
                                    setState(() {});
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      height: 40,
                                      width: 50,
                                      color: pickedMonth == '03' ?
                                      Colors.grey.withOpacity(0.5)
                                          :
                                      Colors.grey.withOpacity(0.1),
                                      child: Center(
                                        child: Text("Mar"),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                InkWell(
                                  onTap: () async{
                                    pickedMonth = '04';
                                    isLoading = true;
                                    setState(() {});
                                    await model.getExpenses(
                                      pickedYear, pickedMonth, _isSell,);
                                    isLoading = false;
                                    setState(() {});
                                  },

                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      height: 40,
                                      width: 50,
                                      color: pickedMonth == '04' ?
                                      Colors.grey.withOpacity(0.5)
                                          :
                                      Colors.grey.withOpacity(0.1),
                                      child: Center(
                                        child: Text("Apl"),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                InkWell(
                                  onTap: () async{
                                    pickedMonth = '05';
                                    isLoading = true;
                                    setState(() {});
                                    await model.getExpenses(
                                      pickedYear, pickedMonth, _isSell,);
                                    isLoading = false;
                                    setState(() {});
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      height: 40,
                                      width: 50,
                                      color: pickedMonth == '05' ?
                                      Colors.grey.withOpacity(0.5)
                                          :
                                      Colors.grey.withOpacity(0.1),
                                      child: Center(
                                        child: Text("May"),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                InkWell(
                                  onTap: () async{
                                    pickedMonth = '06';
                                    isLoading = true;
                                    setState(() {});
                                    await model.getExpenses(
                                      pickedYear, pickedMonth, _isSell,);
                                    isLoading = false;
                                    setState(() {});
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      height: 40,
                                      width: 50,
                                      color: pickedMonth == '06' ?
                                      Colors.grey.withOpacity(0.5)
                                          :
                                      Colors.grey.withOpacity(0.1),
                                      child: Center(
                                        child: Text("Jun"),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                InkWell(
                                  onTap: () async{
                                    pickedMonth = '07';
                                    isLoading = true;
                                    setState(() {});
                                    await model.getExpenses(
                                      pickedYear, pickedMonth, _isSell,);
                                    isLoading = false;
                                    setState(() {});
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      height: 40,
                                      width: 50,
                                      color: pickedMonth == '07' ?
                                      Colors.grey.withOpacity(0.5)
                                          :
                                      Colors.grey.withOpacity(0.1),
                                      child: Center(
                                        child: Text("Jul"),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                InkWell(
                                  onTap: () async{
                                    pickedMonth = '08';
                                    isLoading = true;
                                    setState(() {});
                                    await model.getExpenses(
                                      pickedYear, pickedMonth, _isSell,);
                                    isLoading = false;
                                    setState(() {});
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      height: 40,
                                      width: 50,
                                      color: pickedMonth == '08' ?
                                      Colors.grey.withOpacity(0.5)
                                          :
                                      Colors.grey.withOpacity(0.1),
                                      child: Center(
                                        child: Text("Aug"),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                InkWell(
                                  onTap: () async{
                                    pickedMonth = '09';
                                    isLoading = true;
                                    setState(() {});
                                    await model.getExpenses(
                                      pickedYear, pickedMonth, _isSell,);
                                    isLoading = false;
                                    setState(() {});
                                  },

                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      height: 40,
                                      width: 50,
                                      color: pickedMonth == '09' ?
                                      Colors.grey.withOpacity(0.5)
                                          :
                                      Colors.grey.withOpacity(0.1),
                                      child: Center(
                                        child: Text("Sep"),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                InkWell(
                                  onTap: () async{
                                    pickedMonth = '10';
                                    isLoading = true;
                                    setState(() {});
                                    await model.getExpenses(
                                      pickedYear, pickedMonth, _isSell,);
                                    isLoading = false;
                                    setState(() {});
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      height: 40,
                                      width: 50,
                                      color: pickedMonth == '10' ?
                                      Colors.grey.withOpacity(0.5)
                                          :
                                      Colors.grey.withOpacity(0.1),
                                      child: Center(
                                        child: Text("Oct"),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                InkWell(
                                  onTap: () async{
                                    pickedMonth = '11';
                                    isLoading = true;
                                    setState(() {});
                                    await model.getExpenses(
                                      pickedYear, pickedMonth, _isSell,);
                                    isLoading = false;
                                    setState(() {});
                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: Container(

                                      height: 40,
                                      width: 50,
                                      color: pickedMonth == '11' ?
                                      Colors.grey.withOpacity(0.5)
                                          :
                                      Colors.grey.withOpacity(0.1),
                                      child: Center(
                                        child: Text("Nov"),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                InkWell(
                                  onTap: () async{
                                    pickedMonth = '12';
                                    isLoading = true;
                                    setState(() {});
                                    await model.getExpenses(
                                      pickedYear, pickedMonth, _isSell,);
                                    isLoading = false;
                                    setState(() {});
                                  },
                                  child: Card(elevation: 5,
                                    child: Container(
                                      height: 40,
                                      width: 50,
                                      color: pickedMonth == '12' ?
                                      Colors.grey.withOpacity(0.5)
                                          :
                                      Colors.grey.withOpacity(0.1),
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
                            color:
                            Colors.grey.withOpacity(0.1),
                            child: Column(
                              children: [
                                SizedBox(height: 50,),
                                Container(
                                  height: 100,
                                  width: 400,
                                  child: Center(
                                    child: Text(
                                      _isSell != true ?
                                      "¥$sum"
                                          :
                                      "¥$sumSelling",
                                      style: TextStyle(
                                          fontSize: 50
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40,),
                                isLoading == true ?
                                    LinearProgressIndicator(
                                      color: Colors.grey,
                                      backgroundColor: Colors.grey.shade100,
                                    )
                                    :
                                    Container()
                              ],
                            )
                        ),
                        Container(
                          height: 400,
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children:
                            _isSell != true ?
                            widgets
                                :
                            widgetsSell,
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Row(
                            children: [
                              ElevatedButton(

                                style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    primary:
                                    _isSell != true ?
                                    Colors.redAccent.shade100
                                        :
                                    Colors.blueAccent.shade100
                                ),
                                onPressed: () {
                                  if (_isSell == true) {
                                    _isSell = false;
                                  } else if (_isSell == false) {
                                    _isSell = true;
                                  }

                                  setState(() {
                                    _isSell = _isSell;
                                  });
                                },
                                child: Icon(Icons.dashboard),
                              ),
                              SizedBox(width: 260,),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    primary: Colors.grey.withOpacity(0.5)
                                ),
                                onPressed: () {
                                  showBottomSheet(context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                            height: 300,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 10,
                                                  )
                                                ]),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                          height: 20,
                                                          width: 20,
                                                          child: Icon(
                                                              Icons.close)
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                SingleChildScrollView(
                                                  scrollDirection: Axis
                                                      .horizontal,
                                                  child: Container(
                                                    height: 250,
                                                    width: 1000,
                                                    child: SfCartesianChart(
                                                        title: ChartTitle(
                                                            text: pickedYear),
                                                        // Initialize category axis
                                                        primaryXAxis: CategoryAxis(),
                                                        series: <ChartSeries>[
                                                          // Initialize line series
                                                          LineSeries<
                                                              SalesData,
                                                              String>(
                                                              dataSource: [
                                                                // Bind data source
                                                                SalesData('Jan',
                                                                    _isSell !=
                                                                        true ?
                                                                    sum01
                                                                        :
                                                                    sumSelling01
                                                                ),
                                                                SalesData('Feb',
                                                                    _isSell !=
                                                                        true ?
                                                                    sum02
                                                                        :
                                                                    sumSelling02
                                                                ),
                                                                SalesData('Mar',
                                                                    _isSell !=
                                                                        true ?
                                                                    sum03
                                                                        :
                                                                    sumSelling03
                                                                ),
                                                                SalesData('Apr',
                                                                    _isSell !=
                                                                        true ?
                                                                    sum04
                                                                        :
                                                                    sumSelling04
                                                                ),
                                                                SalesData('May',
                                                                    _isSell !=
                                                                        true ?
                                                                    sum05
                                                                        :
                                                                    sumSelling05
                                                                ),
                                                                SalesData('Jun',
                                                                    _isSell !=
                                                                        true ?
                                                                    sum06
                                                                        :
                                                                    sumSelling06
                                                                ),
                                                                SalesData('Jul',

                                                                    _isSell !=
                                                                        true ?
                                                                    sum07
                                                                        :
                                                                    sumSelling07
                                                                ),
                                                                SalesData('Aug',
                                                                    _isSell !=
                                                                        true ?
                                                                    sum08
                                                                        :
                                                                    sumSelling08
                                                                ),
                                                                SalesData('Sep',
                                                                    _isSell !=
                                                                        true ?
                                                                    sum09
                                                                        :
                                                                    sumSelling09
                                                                ),
                                                                SalesData('Oct',
                                                                    _isSell !=
                                                                        true ?
                                                                    sum10
                                                                        :
                                                                    sumSelling10
                                                                ),
                                                                SalesData('Nov',
                                                                    _isSell !=
                                                                        true ?
                                                                    sum11
                                                                        :
                                                                    sumSelling11
                                                                ),
                                                                SalesData('Dec',
                                                                    _isSell !=
                                                                        true ?
                                                                    sum12
                                                                        :
                                                                    sumSelling12
                                                                ),

                                                              ],
                                                              xValueMapper: (
                                                                  SalesData sales,
                                                                  _) =>
                                                              sales.year,
                                                              yValueMapper: (
                                                                  SalesData sales,
                                                                  _) =>
                                                              sales.sales,
                                                              // Render the data label
                                                              dataLabelSettings: DataLabelSettings(
                                                                  isVisible: true)
                                                          )
                                                        ]
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                        );
                                      }
                                  );
                                },
                                child: Icon(Icons.insert_chart_sharp),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                  ,
                );
            })
        ),
      ),
    );
  }
  loading() {
    if (isLoading == true) {
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          transitionDuration: Duration(milliseconds: 300),
          barrierColor: Colors.black.withOpacity(0.5),
          pageBuilder: (BuildContext context, Animation animation,
              Animation secondaryAnimation) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
      );
    }
  }

}



class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double? sales;
}


