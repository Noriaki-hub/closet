import 'dart:io';
import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../controllers/pages/account_edit_page_controller.dart';

class AccountEditPage extends HookConsumerWidget {
  AccountEditPage({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(
        AccountEditPageProvider.select((value) => value.imageFile));
    final user = ref.watch(userProvider.select((value) => value.user));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade50,
        leading: IconButton(onPressed: () {
          Navigator.pop(context, true);
        }, icon: Icon(LineIcons.angleLeft),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('変更'),
        backgroundColor: Colors.brown.shade50,
        onPressed: () async {
          await ref.read(AccountEditPageProvider.notifier).updateUser();
          Navigator.pop(context, true);
        },

      ),
      body: Center(
        child: SizedBox(
          height: 500,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              InkWell(
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
                        user.image,
                        fit: BoxFit.cover,
                      ) : Image.file(imageFile, fit: BoxFit.cover,)
                  ),
                ),


              ),

              Container(
                width: 250,
                child: TextField(
                  controller: TextEditingController(text: user.name),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )
                  ),
                  onChanged: (text) {
                    ref.read(AccountEditPageProvider.notifier).name(name: text);
                  },
                ),
              ),
              Container(
                width: 250,
                child: TextField(
                  controller: TextEditingController(text: user.id),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )
                  ),
                  onChanged: (text) {
                    ref.read(AccountEditPageProvider.notifier).id(id: text);
                  },
                ),
              )
            ],
          ),
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
                ref.read(AccountEditPageProvider.notifier).imageFile(
                    pickedFile);
                Navigator.of(context).pop();
              }),
          new ListTile(
            leading: new Icon(Icons.photo_camera),
            title: new Text('Camera'),
            onTap: () async {
              final pickedFile = await ImagePicker()
                  .pickImage(source: ImageSource.camera);
              ref.read(AccountEditPageProvider.notifier).imageFile(pickedFile);

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

}