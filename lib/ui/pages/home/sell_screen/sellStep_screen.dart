import 'package:closet_app_xxx/controllers/pages/home/sell_page_controller.dart';
import 'package:closet_app_xxx/ui/pages/home/sell_screen/src/sell_step1.dart';
import 'package:closet_app_xxx/ui/pages/home/sell_screen/src/sell_step2.dart';
import 'package:closet_app_xxx/ui/pages/home/sell_screen/src/sell_step3.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class SellStepScreen extends StatefulWidget {
  const SellStepScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SellStepScreen();
  }
}

class _SellStepScreen extends State<SellStepScreen> {
  int currentStep = 0;
  bool hide = true;

  bool itemState = false;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Consumer(builder: (context, ref, _) {
      final items = ref.watch(sellPageProvider);
      if (items.selling != '' &&
          items.selectedClothes != null &&
          items.sellingDay != '') {
        itemState = true;
      } else {
        itemState = false;
      }
      return Scaffold(
          floatingActionButton: itemState
              ? FloatingActionButton(
                  child: Text('売却'),
                  backgroundColor: Colors.blueGrey,
                  onPressed: () async {
                    await ref.read(sellPageProvider.notifier).sellClothes();
                    Navigator.pop(context, true);
                  })
              : FloatingActionButton(
                  child: Icon(LineIcons.angleDown),
                  backgroundColor: Colors.brown.shade50,
                  onPressed: () {
                    if (currentStep < 4) {
                      setState(() {
                        currentStep += 1;
                      });
                    }
                  }),
          appBar: AppBar(
            title: Text('売却したもの', style: TextStyle(color: Colors.black45)),
            backgroundColor: Colors.brown.shade50,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              icon: Icon(Icons.close),
            ),
          ),
          body: Center(
            child: Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(primary: Colors.blueGrey)),
              child: CupertinoStepper(
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
                  return Row(
                    children: <Widget>[
                      TextButton(
                        onPressed: details.onStepContinue,
                        child: Text(hide == true ? '' : 'Confirm'),
                      ),
                      TextButton(
                        onPressed: details.onStepCancel,
                        child: Text(hide == true ? '' : 'Cancel'),
                      ),
                    ],
                  );
                },
                currentStep: currentStep,
                onStepTapped: (index) {
                  setState(() {
                    currentStep = index;
                  });
                },
                steps: <Step>[
                  Step(
                    isActive: items.selectedClothes != null,
                    title: Text('選ぶ'),
                    content: SellStep1(),
                  ),
                  Step(
                    isActive: items.selling != '',
                    title: Text('売却額'),
                    content: SellStep2(),
                  ),
                  Step(
                    isActive: items.sellingDay != '',
                    title: Text('日付'),
                    content: SellStep3(),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
