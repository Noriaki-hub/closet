import 'package:closet_app_xxx/controllers/pages/media_add_page_controller.dart';
import 'package:closet_app_xxx/ui/pages/media/add/src/media_add_step1.dart';
import 'package:closet_app_xxx/ui/pages/media/add/src/media_add_step2.dart';
import 'package:closet_app_xxx/ui/pages/media/add/src/media_add_step3.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class MediaAddPage extends StatefulWidget {
  const MediaAddPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MediaAddPage();
  }
}

class _MediaAddPage extends State<MediaAddPage> {
  int currentStep = 0;
  bool hide = true;

  bool itemState = false;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Consumer(builder: (context, ref, _) {
      final items = ref.watch(mediaAddPageProvider);
      if (items.url != '' && items.name != '' && items.imageFile != null) {
        itemState = true;
      } else {
        itemState = false;
      }
      return Scaffold(
          floatingActionButton: itemState
              ? FloatingActionButton(
                  child: Text('追加', style: TextStyle(color: Colors.black45)),
                  backgroundColor: Colors.blueGrey,
                  onPressed: () async {
                    await ref.read(mediaAddPageProvider.notifier).addMedia();
                    // await ref.read(CalendarPageProvider.notifier).();
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
            backgroundColor: Colors.brown.shade50,
            title: Text('メディアを追加', style: TextStyle(color: Colors.black45)),
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
                      isActive: items.imageFile != null,
                      title: Text('画像'),
                      content: MediaAddStep1()),
                  Step(
                      isActive: items.name != '',
                      title: Text('メディア名'),
                      content: MediaAddStep2()),
                  Step(
                      isActive: items.url != '',
                      title: Text('メディアURL'),
                      content: MediaAddStep3()),
                ],
              ),
            ),
          ));
    });
  }
}
