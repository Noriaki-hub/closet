import 'package:closet_app_xxx/controllers/component/month_picker_dialog_controller.dart';
import 'package:closet_app_xxx/controllers/global/date_now_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class MonthPickDialog extends StatelessWidget {
  const MonthPickDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: buildYearArea(),
      content: buildMonthArea(),
    );
  }

  buildYearArea() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final selectedMonth = ref.watch(
            monthPickerDialogProvider.select((value) => value.selectedYear));
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  ref.read(monthPickerDialogProvider.notifier).backYear();
                },
                child: Icon(LineIcons.angleLeft)),
            Text(selectedMonth ?? ''),
            GestureDetector(
                onTap: () {
                  ref.read(monthPickerDialogProvider.notifier).frontYear();
                },
                child: Icon(LineIcons.angleRight))
          ],
        );
      },
    );
  }

  buildMonthArea() {
    final months = [
      '01',
      '02',
      '03',
      '04',
      '05',
      '06',
      '07',
      '08',
      '09',
      '10',
      '11',
      '12',
    ];
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final selectedMonth = ref.watch(
            monthPickerDialogProvider.select((value) => value.selectedMonth));
        return Container(
            height: 200,
            width: 300,
            child: GridView.builder(
                itemCount: months.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final month = months[index];
                  return GestureDetector(
                    onTap: () {
                      ref
                          .read(monthPickerDialogProvider.notifier)
                          .selectMonth(month: month);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: selectedMonth == month
                                ? Colors.grey.withOpacity(0.2)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(child: Text(month))),
                  );
                }));
      },
    );
  }
}
