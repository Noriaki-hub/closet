
import 'package:closet_app_xxx/Screen/home/buy_screen/src/buy_step1.dart';
import 'package:closet_app_xxx/Screen/home/buy_screen/src/buy_step2.dart';
import 'package:closet_app_xxx/Screen/home/buy_screen/src/buy_step3.dart';
import 'package:closet_app_xxx/Screen/home/buy_screen/src/buy_step4.dart';
import 'package:closet_app_xxx/Screen/home/buy_screen/src/buy_step5.dart';
import 'package:closet_app_xxx/Screen/home/buy_screen/src/buy_step6.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../../controllers/pages/buy_page_controller.dart';
import '../../../controllers/pages/home_page_controller.dart';


class BuyStepScreen extends StatefulWidget {
  const BuyStepScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BuyStepScreen();
  }



}
class _BuyStepScreen extends State<BuyStepScreen> {
  int currentStep = 0;
  bool hide = true;

  bool itemState = false;

  @override
  Widget build(BuildContext context,) {
    return Consumer(
        builder: (context, ref, _) {
          final items = ref.watch(BuyPageProvider);
          if(items.imageFile != null && items.brands != 'No brand' &&
              items.brands != '' && items.category != '' && items.description != ''&& items.price != '' &&
          items.day != ''

          ){
            itemState = true;
          }else{
            itemState = false;
          }
          return Scaffold(
              floatingActionButton:
                  itemState ?
                  ProviderScope(
                    overrides: [
                      HomePageProvider.overrideWithProvider(
                       HomePageProviderFamily(
                          HomePageProviderArg(userId: null),
                        ),
                      ),
                    ],
                    child: FloatingActionButton(
                        child: Text('OK'),
                        backgroundColor: Colors.blueGrey,
                        onPressed: () async{
                          await ref.read(BuyPageProvider.notifier).addCloset();
                          // await ref.read(CalendarPageProvider.notifier).();
                          Navigator.pop(context, true);
                        }
                    ),
                  ):
                  FloatingActionButton(
                      child: Icon(LineIcons.angleDown),
                      backgroundColor: Colors.brown.shade50,
                      onPressed: () {
                        if(currentStep < 5 ){
                          setState(() {
                            currentStep += 1;
                          });
                        }
                      }
                  ),



              appBar: AppBar(
                backgroundColor: Colors.brown.shade50,
              ),
              body: Center(
                child: Theme(

                  data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                          primary: Colors.blueGrey
                      )

                  ),
                  child: CupertinoStepper(
                    controlsBuilder: (BuildContext context,
                        ControlsDetails details) {
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
                          isActive: items.imageFile != null,
                          title: Text('写真'),
                          content: BuyStep1()
                      ),
                      Step(
                          isActive: items.brands != 'No brand' &&
                              items.brands != '',
                          title: Text('ブランド'),
                          content: BuyStep2()
                      ),
                      Step(
                        isActive: items.category != '',
                        title: Text('カテゴリ'),
                        content: BuyStep3(),
                      ),
                      Step(
                        isActive: items.description != '',
                        title: Text("詳細"),
                        content: BuyStep4(),
                      ),
                      Step(
                        isActive: items.price != '',
                        title: Text('購入額'),
                        content: BuyStep5(),
                      ),
                      Step(
                        isActive: items.day != '',
                        title: Text('日付'),
                        content: BuyStep6(),
                      ),
                    ],
                  ),
                ),
              )
          );
        }
    );
  }

}


