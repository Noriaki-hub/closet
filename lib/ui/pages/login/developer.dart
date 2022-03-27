
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controllers/admin/admin_login_controller.dart';

class DeveloperLogin extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('管理者ログイン'),
      content: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
                child: TextField(
                  onChanged: (text) {
                    ref.read(adminProvider.notifier).email(email: text);
                  },
                  decoration: InputDecoration(
                      hintText: "email"),
                ),
              ),
              SizedBox(height: 20,),

              SizedBox(height: 30,
                child: TextField(
                  onChanged: (text) {
                    ref.read(adminProvider.notifier).password(password: text);
                  },
                  decoration: InputDecoration(
                      hintText: "password"),
                ),
              ),
            ]
            ,
          )
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Login'),
          onPressed: () {
            ref.read(adminProvider.notifier).login();
          },
        ),
      ],
    );
  }

}