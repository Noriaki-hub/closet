import 'package:closet_app_xxx/controllers/pages/shop_edit_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'dart:io';
import '../../../../controllers/pages/media_edit_page_controller.dart';
import '../../../../models/media.dart';



class MediaEditPage extends HookConsumerWidget {
  MediaEditPage({
    Key? key,
    required this.media,
  }) : super(key: key);

  final Media media;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(
        MediaEditPageProvider.select((value) => value.imageFile));
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
          await ref.read(MediaEditPageProvider.notifier).updateMedia(media: media);
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
                        media.image,
                        fit: BoxFit.cover,
                      ) : Image.file(imageFile, fit: BoxFit.cover,)
                  ),
                ),


              ),

              Container(
                width: 250,
                child: TextField(
                  controller: TextEditingController(text: media.name),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )
                  ),
                  onChanged: (text) {
                    ref.read(MediaEditPageProvider.notifier).name(name: text);
                  },
                ),
              ),
              Container(
                width: 250,
                child: TextField(
                  controller: TextEditingController(text: media.url),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )
                  ),
                  onChanged: (text) {
                    ref.read(MediaEditPageProvider.notifier).url(url: text);
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

class _pick extends HookConsumerWidget{

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
                ref.read(MediaEditPageProvider.notifier).imageFile(pickedFile);
                Navigator.of(context).pop();
              }),
          new ListTile(
            leading: new Icon(Icons.photo_camera),
            title: new Text('カメラ'),
            onTap: () async{
              final pickedFile = await ImagePicker()
                  .pickImage(source: ImageSource.camera, imageQuality: 0, maxHeight: 1350, maxWidth: 1080);
              ref.read(MediaEditPageProvider.notifier).imageFile(pickedFile);

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

}