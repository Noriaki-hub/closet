import 'package:closet_app_xxx/model/home/controllers/datePicker_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:intl/intl.dart';



import '../../../model/CustomExeption.dart';
import '../../../model/home/controllers/calender_controller.dart';
import '../../../model/home/controllers/clothes_controller.dart';

class CalenderScreen extends HookConsumerWidget{

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade50,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown.shade50,
        heroTag:'add',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(date.year!, style: TextStyle(fontSize: 10, color: Colors.black),),
            Text(date.month!, style: TextStyle(fontSize: 20, color: Colors.black),),
          ],
        ),
        onPressed: () async{
          var selectedDate = DateTime.now();
          final pickedDate = await showMonthPicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2018),
            lastDate: DateTime(2030),
          );
          if(pickedDate != null){
           await ref.read(dateProvider.notifier).changeDate(selectedDate: pickedDate);
           await ref.read(calenderProvider.notifier).calenderBuyList();
          }
        },
      ),
      body: Center(
        child: Container(
          height: 1200,
          color: Colors.brown.shade50,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.5),
                      ),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text(date.year!,style: TextStyle(
                               fontSize: 15,
                             ),),
                             Text(date.month!,style: TextStyle(
                               fontSize: 20,
                             ),),
                           ],
                         ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                height: 40,
                                width: 120,
                                child: Column(
                                  children: [
                                    Text('Purchased',style: TextStyle(
                                      fontSize: 10,),),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          _calenderBuy()
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Column(
                                  children: [
                                    Text('Sold',style: TextStyle(
                                      fontSize: 10,),),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          _calenderSell()
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Container(width: 100, decoration : BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10)
                    ),child: Center(child: Text('Purchased'))),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    width: double.infinity,
                    height: 300,
                    child: _calenderBuyList(),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Container(width: 100, decoration : BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10)
                    ),child: Center(child: Text('Sold'))),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    width: double.infinity,
                    height: 300,
                    child: _calenderSellList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}





class _calenderBuyList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(calenderProvider);
    return listState.when(
      data : (items) =>
        items.isEmpty ?
            Text('Empty'):
            ListView.builder(
                itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.white.withOpacity(0.5),
                    leading: Image.network(item.imageURL),
                    title: Text(item.brands),
                    subtitle: Text(item.description),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(item.price),
                        Text(item.month + '/' + item.day, style: TextStyle(fontWeight: FontWeight.w100),),
                      ],
                    ),
                  ),
                );
              }
            ),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, _) =>
          _ItemListError(
            message: error is CustomException
                ? error.message!
                : 'Something went wrong',
          ),
    );
  }
}

class _calenderSellList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(calenderSellProvider);
    return listState.when(
      data : (items) =>
      items.isEmpty ?
      Text('Empty'):
      ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.white.withOpacity(0.5),
                leading: Image.network(item.imageURL),
                title: Text(item.brands),
                subtitle: Text(item.description),
                trailing: Column(
                  children: [
                    Text(item.selling),
                    Text(item.month + '/' + item.day, style: TextStyle(fontWeight: FontWeight.w100),),
                  ],
                ),
              ),
            );
          }
      ),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, _) =>
          _ItemListError(
            message: error is CustomException
                ? error.message!
                : 'Something went wrong',
          ),
    );
  }
}

class _calenderBuy extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(calenderProvider);
    return listState.when(
      data : (items) {
        double sum = 0;
        if(items.isNotEmpty){
          sum = items.map<double>((clothes) => double.parse(clothes.price))
              .reduce((curr, next) => curr + next);
        }
        return Text(sum.floor().toString(), textAlign: TextAlign.right);
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, _) =>
          _ItemListError(
            message: error is CustomException
                ? error.message!
                : 'Something went wrong',
          ),
    );
  }
}


class _calenderSell extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(calenderSellProvider);
    return listState.when(
      data : (items) {
        double sum = 0;
        if(items.isNotEmpty){
          sum = items.map<double>((clothes) => double.parse(clothes.selling))
              .reduce((curr, next) => curr + next);
        }
        return Text(sum.floor().toString(), textAlign: TextAlign.right);
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, _) =>
          _ItemListError(
            message: error is CustomException
                ? error.message!
                : 'Something went wrong',
          ),
    );
  }
}



class _ItemListError extends HookConsumerWidget {
  final String message;

  const _ItemListError({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
              onPressed: () =>
                  ref.read(clothesListProvider),
              child: Text('Retry')
          ),
        ],
      ),
    );
  }
}




