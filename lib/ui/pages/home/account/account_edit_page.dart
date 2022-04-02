import 'dart:io';
import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/controllers/pages/account_edit_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';



class AccountEditPage extends HookConsumerWidget {
  AccountEditPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final imageFile = ref.watch(
        AccountEditPageProvider.select((value) => value.imageFile));
    final isEdit = ref.watch(AccountEditPageProvider.select((value) => value.isEdit));
    final user = ref.watch(userProvider.select((value) => value.user));


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade50,
        leading: IconButton(onPressed: () {
          Navigator.pop(context, true);
        }, icon: const Icon(LineIcons.angleLeft),

        ),
      ),
      floatingActionButton: !isEdit? Container(): FloatingActionButton(
        child: const Text('変更'),
        backgroundColor: Colors.brown.shade50,
        onPressed: () async {
          await ref.read(AccountEditPageProvider.notifier).updateUser();
          Navigator.pop(context, true);
        },
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 65, left: 65),
          child: SizedBox(
            height: 500,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Container(
                      width: 250,
                      height: 250,
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          _showPicker(context);
                        },
                        child: imageFile == null ?
                        Image.network(
                          user.image,
                          fit: BoxFit.cover,
                        ) : Image.file(imageFile, fit: BoxFit.cover,),
                      )
                  ),
                ),

                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('名前',style: TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                      // width: 250,
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
                        onChanged: (text) async{
                          await ref.read(AccountEditPageProvider.notifier).name(name: text);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
      child: Wrap(
        children: <Widget>[
          ListTile(
              leading:  const Icon(Icons.photo_library),
              title: const Text('ライブラリ'),
              onTap: () async {
                final pickedFile = await ImagePicker()
                    .pickImage(source: ImageSource.gallery, imageQuality: 0, maxHeight: 1080, maxWidth: 1080);
               await ref.read(AccountEditPageProvider.notifier).imageFile(
                    pickedFile);
                Navigator.of(context).pop();
              }),
          ListTile(
            leading: const Icon(Icons.photo_camera),
            title: const Text('カメラ'),
            onTap: () async {
              final pickedFile = await ImagePicker()
                  .pickImage(source: ImageSource.camera, imageQuality: 0, maxHeight: 1080, maxWidth: 1080);
              await ref.read(AccountEditPageProvider.notifier).imageFile(pickedFile);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

}