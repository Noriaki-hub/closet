import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../../../controllers/pages/clothes_edit_page_controller.dart';

class ImageChangeField extends HookConsumerWidget{
  ImageChangeField(this.image);
  String image;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(
        ClothesEditPageProvider.select((value) => value.imageFile));
    return InkWell(
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
              image,
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
              title: new Text('Photo Library'),
              onTap: () async {
                final pickedFile = await ImagePicker()
                    .pickImage(source: ImageSource.gallery);
                ref.read(ClothesEditPageProvider.notifier).imageFile(pickedFile);
                Navigator.of(context).pop();
              }),
          new ListTile(
            leading: new Icon(Icons.photo_camera),
            title: new Text('Camera'),
            onTap: () async {
              final pickedFile = await ImagePicker()
                  .pickImage(source: ImageSource.camera);
              ref.read(ClothesEditPageProvider.notifier).imageFile(pickedFile);

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}