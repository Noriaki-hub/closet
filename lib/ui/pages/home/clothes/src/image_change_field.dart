import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../../../controllers/pages/clothes_edit_page_controller.dart';

class ImageChangeField extends HookConsumerWidget{

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(
        ClothesEditPageProvider.select((value) => value.imageFile));
    final imageURL = ref.watch(ClothesEditPageProvider.select((value) => value.clothes?.imageURL));
    return imageURL == null ?Container(): InkWell(
      onTap: () {
        _showPicker(context);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(150),
        child: Container(
            width: 300,
            height: 300,
            color: Colors.white,
            child: imageFile == null ?
            Image.network(
              imageURL,
              fit: BoxFit.cover,
            ) : Image.file(imageFile, fit: BoxFit.cover,)
        ),
      ),
    );
  }
  void _showPicker(context,) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext) {
          return SafeArea(
              child: _pick()
          );
        }
    );
  }
}

class _pick extends HookConsumerWidget {

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
              onTap: () async {
                final pickedFile = await ImagePicker()
                    .pickImage(source: ImageSource.gallery, imageQuality: 0, maxHeight: 1350, maxWidth: 1080);
                await ref.read(ClothesEditPageProvider.notifier).imageFile(pickedFile);
                Navigator.of(context).pop();
              }),
          new ListTile(
            leading: new Icon(Icons.photo_camera),
            title: new Text('カメラ'),
            onTap: () async {
              final pickedFile = await ImagePicker()
                  .pickImage(source: ImageSource.camera, imageQuality: 0, maxHeight: 1350, maxWidth: 1080);
              await ref.read(ClothesEditPageProvider.notifier).imageFile(pickedFile);

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}