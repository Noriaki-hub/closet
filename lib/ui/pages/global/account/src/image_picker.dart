import 'package:closet_app_xxx/controllers/pages/home/account_edit_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends HookConsumerWidget {
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Wrap(
        children: <Widget>[
          ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('ライブラリ'),
              onTap: () async {
                final pickedFile = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 0,
                    maxHeight: 1080,
                    maxWidth: 1080);
                await ref
                    .read(accountEditPageProvider.notifier)
                    .imageFile(pickedFile);
                Navigator.of(context).pop();
              }),
          ListTile(
            leading: const Icon(Icons.photo_camera),
            title: const Text('カメラ'),
            onTap: () async {
              final pickedFile = await ImagePicker().pickImage(
                  source: ImageSource.camera,
                  imageQuality: 0,
                  maxHeight: 1080,
                  maxWidth: 1080);
              await ref
                  .read(accountEditPageProvider.notifier)
                  .imageFile(pickedFile);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
