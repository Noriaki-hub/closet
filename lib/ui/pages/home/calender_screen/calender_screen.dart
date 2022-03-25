
import 'package:closet_app_xxx/controllers/pages/calendar_page_controller.dart';
import 'package:closet_app_xxx/controllers/pages/calendar_picker_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';


class CalenderScreen extends HookConsumerWidget{

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(CalendarPageProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade50,
        title: Text('収支', style: TextStyle(color: Colors.black45),),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown.shade50,
        heroTag:'add',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.year, style: TextStyle(fontSize: 10, color: Colors.black),),
            Text(state.month, style: TextStyle(fontSize: 20, color: Colors.black),),
          ],
        ),
        onPressed: () async{
          var selectedDate = DateTime.now();
          final pickedDate = await showMonthPicker(
            locale: const Locale("ja"),
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2018),
            lastDate: DateTime(2030),
          );
          if(pickedDate != null){
           await ref.read(CalendarPickerProvider.notifier).changeDate(selectedDate: pickedDate);
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
                             Text(state.year+'年',style: TextStyle(
                               fontSize: 15,
                             ),),
                             Text(state.month+'月',style: TextStyle(
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
                                height: 50,
                                width: 120,
                                child: Column(
                                  children: [
                                    const Text('購入額',style: TextStyle(fontSize: 10,),),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(state.buying+'円')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                               Container(
                                height: 50,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Column(
                                  children: [
                                    const Text('売却額',style: TextStyle(
                                      fontSize: 10,),),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(state.selling+'円')
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
                    const SizedBox(width: 20,),
                    Container(width: 100, decoration : BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10)
                    ),child: Center(child: Text('購入した物'))),
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
                    const SizedBox(width: 20,),
                    Container(width: 100, decoration : BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10)
                    ),child: const Center(child: const Text('売却した物'))),
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
    final buyClothesList = ref.watch(CalendarPageProvider.select((value) => value.buyClothesList));
    return ListView.builder(
                itemCount: buyClothesList.length,
              itemBuilder: (BuildContext context, int index) {
                final clothes = buyClothesList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.white.withOpacity(0.5),
                    leading: SizedBox(width: 50,child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network(clothes.imageURL, fit: BoxFit.cover,))),
                    title: Text(clothes.brands),
                    subtitle: Text(clothes.description),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(clothes.price+'円'),
                        Text(clothes.month + '/' + clothes.day, style: TextStyle(fontWeight: FontWeight.w100),),
                      ],
                    ),
                  ),
                );
              }
            );
  }
}

class _calenderSellList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellClothesList = ref.watch(CalendarPageProvider.select((value) => value.sellClothesList));
    return ListView.builder(
          itemCount: sellClothesList.length,
          itemBuilder: (BuildContext context, int index) {
            final clothes = sellClothesList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.white.withOpacity(0.5),
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      clothes.imageURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(clothes.brands),
                    ],
                  ),
                ),
                subtitle:  SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(clothes.description),
                    ],
                  ),
                ),
                trailing: Column(
                  children: [
                    Text(clothes.price),
                    Text(clothes.year + '/' +clothes.month + '/' + clothes.day, style: TextStyle(fontWeight: FontWeight.w100),),
                  ],
                ),
              ),
            );
          }
      );
  }
}


