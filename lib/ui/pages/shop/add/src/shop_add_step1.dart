import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../controllers/pages/shop_add_page_controller.dart';


class ShopAddStep1 extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(ShopAddPageProvider.select((s) => s.imageFile));
    return GestureDetector(
        onTap: () {
          _showPicker(context,);
        },
        child: imageFile != null
            ? ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Colors.white,
            child: Image.file(
              imageFile,
              width: 300,
              height: 400,
              fit: BoxFit.fitHeight,
            ),
          ),
        )
            : Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(300)),
          width: 300,
          height: 300,
          child: Icon(
            Icons.camera_alt,
            color: Colors.grey[800],
          ),
        )
    );
  }

  void _showPicker(context,) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext ) {
          return SafeArea(
              child: pick()
          );
        }
    );
  }
}

class pick extends HookConsumerWidget{

  File? imageFile;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: new Wrap(
        children: <Widget>[
          new ListTile(
              leading: new Icon(Icons.photo_library),
              title: new Text('ライブラリ'),
              onTap: () async{
                final pickedFile = await ImagePicker()
                    .pickImage(source: ImageSource.gallery, imageQuality: 0, maxHeight: 1350, maxWidth: 1080);
                ref.read(ShopAddPageProvider.notifier).imageFile(pickedFile);
                Navigator.of(context).pop();
              }),
          new ListTile(
            leading: new Icon(Icons.photo_camera),
            title: new Text('カメラ'),
            onTap: () async{
              final pickedFile = await ImagePicker()
                  .pickImage(source: ImageSource.camera, imageQuality: 0, maxHeight: 1350, maxWidth: 1080);
              ref.read(ShopAddPageProvider.notifier).imageFile(pickedFile);

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

}