import 'package:closet_app_xxx/controllers/pages/home/calendar_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/app_colors.dart';
import 'package:closet_app_xxx/ui/libs/widgets.dart';

import 'package:closet_app_xxx/ui/pages/closet/calender_screen/src/month_year_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/calendar_buy_list.dart';
import 'src/calendar_sell_list.dart';

class CalenderScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calendarPageProvider);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GlassContainer(
              borderRadius: BorderRadius.zero,
              width: double.infinity,
              height: 2000,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120,
                    ),
                    GlassContainer(
                      width: double.infinity,
                      height: 200,
                      borderRadius: BorderRadius.circular(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (() {
                              showDialog<void>(
                                  context: context,
                                  builder: (_) {
                                    return MonthPickDialog();
                                  });
                            }),
                            child: Row(
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
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GlassContainer(
                                borderRadius: BorderRadius.circular(12),
                                height: 55,
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
                              GlassContainer(
                                height: 55,
                                width: 120,
                                borderRadius: BorderRadius.circular(12),
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
                    SizedBox(
                      height: 40,
                    ),
                    GlassContainer(
                        height: 30,
                        width: 120,
                        borderRadius: BorderRadius.circular(12),
                        child: const Center(
                            child: const Text(
                          '購入した物',
                          style: TextStyle(color: AppColors.text),
                        ))),
                    SizedBox(
                      height: 10,
                    ),
                    GlassContainer(
                      borderRadius: BorderRadius.circular(12),
                      width: double.infinity,
                      height: 300,
                      child: CalenderBuyList(),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GlassContainer(
                        height: 30,
                        width: 120,
                        borderRadius: BorderRadius.circular(12),
                        child: const Center(
                            child: const Text(
                          '売却した物',
                          style: TextStyle(color: AppColors.text),
                        ))),
                    SizedBox(
                      height: 10,
                    ),
                    GlassContainer(
                      borderRadius: BorderRadius.circular(12),
                      width: double.infinity,
                      height: 300,
                      child: CalenderSellList(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
