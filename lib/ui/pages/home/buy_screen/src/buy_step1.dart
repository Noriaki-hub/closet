import 'package:closet_app_xxx/controllers/pages/buy_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';



class BuyStep1 extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(BuyPageProvider.select((s) => s.imageFile));
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
      child: Wrap(
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.photo_library),
              title: const Text('Photo Library'),
              onTap: () async{
                final pickedFile = await ImagePicker()
                    .pickImage(source: ImageSource.gallery, imageQuality: 25);
                ref.read(BuyPageProvider.notifier).imageFile(pickedFile);
                Navigator.of(context).pop();
              }),
          ListTile(
            leading: const Icon(Icons.photo_camera),
            title: const Text('Camera'),
            onTap: () async{
              final pickedFile = await ImagePicker()
                  .pickImage(source: ImageSource.camera, imageQuality: 25);
              ref.read(BuyPageProvider.notifier).imageFile(pickedFile);

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

}