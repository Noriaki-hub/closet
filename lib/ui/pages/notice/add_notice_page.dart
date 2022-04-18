import 'package:closet_app_xxx/repositories/admin/config_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddNoticePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddNoticePage();
  }
}

class _AddNoticePage extends State<AddNoticePage> {
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Scaffold(floatingActionButton: FloatingActionButton(
          onPressed: (() async {
            await ref.read(configRepositoryProvider).addNotice(title: text);
            Navigator.pop(context);
          }),
        ), body: Center(
          child: TextFormField(
            onChanged: (s) {
              setState(() {
                text = s;
              });
            },
          ),
        ));
      },
    );
  }
}
