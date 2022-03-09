import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../controllers/pages/buy_page_controller.dart';
import '../../../../controllers/pages/media_add_page_controller.dart';
import '../../../../controllers/pages/shop_add_page_controller.dart';

class MediaAddStep1 extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(MediaAddPageProvider.select((s) => s.imageFile));
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
              title: new Text('Photo Library'),
              onTap: () async{
                final pickedFile = await ImagePicker()
                    .pickImage(source: ImageSource.gallery);
                ref.read(MediaAddPageProvider.notifier).imageFile(pickedFile);
                Navigator.of(context).pop();
              }),
          new ListTile(
            leading: new Icon(Icons.photo_camera),
            title: new Text('Camera'),
            onTap: () async{
              final pickedFile = await ImagePicker()
                  .pickImage(source: ImageSource.camera);
              ref.read(MediaAddPageProvider.notifier).imageFile(pickedFile);

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

}