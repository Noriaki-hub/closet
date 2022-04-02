import 'package:closet_app_xxx/controllers/pages/calendar_page_controller.dart';
import 'package:closet_app_xxx/controllers/pages/calendar_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import 'src/calendar_buy_list.dart';
import 'src/calendar_sell_list.dart';

class CalenderScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calendarPageProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade50,
        title: Text(
          '収支',
          style: TextStyle(color: Colors.black45),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown.shade50,
        heroTag: 'add',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.year,
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
            Text(
              state.month,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
        onPressed: () async {
          var selectedDate = DateTime.now();
          final pickedDate = await showMonthPicker(
            locale: const Locale("ja"),
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2018),
            lastDate: DateTime(2030),
          );
          if (pickedDate != null) {
            await ref
                .read(calendarPickerProvider.notifier)
                .changeDate(selectedDate: pickedDate);
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.year + '年',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              state.month + '月',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              height: 50,
                              width: 120,
                              child: Column(
                                children: [
                                  const Text(
                                    '購入額',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [Text(state.buying + '円')],
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
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  const Text(
                                    '売却額',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [Text(state.selling + '円')],
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
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(child: Text('購入した物'))),
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
                    child: CalenderBuyList(),
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(child: const Text('売却した物'))),
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
                    child: CalenderSellList(),
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
