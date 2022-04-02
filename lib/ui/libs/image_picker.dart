import 'package:closet_app_xxx/controllers/pages/buy_page_controller.dart';
import 'package:closet_app_xxx/controllers/pages/clothes_edit_page_controller.dart';
import 'package:closet_app_xxx/controllers/pages/media_add_page_controller.dart';
import 'package:closet_app_xxx/controllers/pages/media_edit_page_controller.dart';
import 'package:closet_app_xxx/controllers/pages/shop_add_page_controller.dart';
import 'package:closet_app_xxx/controllers/pages/shop_edit_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends HookConsumerWidget {
  PickImage({required this.page});
  final picker = ImagePicker();
  final String page;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Wrap(
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.photo_library),
              title: const Text('ライブラリ'),
              onTap: () async {
                final pickedFile = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 0,
                    maxHeight: 1350,
                    maxWidth: 1080);
                await refreshImageFile(ref: ref, pickedFile: pickedFile);
                Navigator.of(context).pop();
              }),
          ListTile(
            leading: const Icon(Icons.photo_camera),
            title: const Text('カメラ'),
            onTap: () async {
              final pickedFile = await ImagePicker().pickImage(
                  source: ImageSource.camera,
                  imageQuality: 0,
                  maxHeight: 1350,
                  maxWidth: 1080);
              await refreshImageFile(ref: ref, pickedFile: pickedFile);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> refreshImageFile(
      {required WidgetRef ref, XFile? pickedFile}) async {
    switch (page) {
      case 'buy':
        ref.read(buyPageProvider.notifier).imageFile(pickedFile);
        break;
      case 'editClothes':
        ref.read(clothesEditPageProvider.notifier).imageFile(pickedFile);
        break;
      case 'addShop':
        ref.read(shopAddPageProvider.notifier).imageFile(pickedFile);
        break;
      case 'addMedia':
        ref.read(mediaAddPageProvider.notifier).imageFile(pickedFile);
        break;
      case 'editMedia':
        ref.read(mediaEditPageProvider.notifier).imageFile(pickedFile);
        break;
      case 'editMedia':
        ref.read(shopEditPageProvider.notifier).imageFile(pickedFile);
        break;
    }
  }
}
