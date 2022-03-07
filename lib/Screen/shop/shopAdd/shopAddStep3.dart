import 'package:closet_app_xxx/Screen/shop/shopAdd/shopAddStep4.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'dart:io';

import '../../../controllers/pages/shop_add_page_controller.dart';




class ShopAddStep3 extends HookConsumerWidget {



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(ShopAddPageProvider.select((s) => s.imageFile));
    return Scaffold(
        backgroundColor:Colors.brown.shade50,
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ShopAddStep4()));

          },
          backgroundColor: Colors.brown.shade50,
          child: Icon(LineIcons.angleRight),
        ),
        appBar: AppBar(
            backgroundColor: Colors.brown.shade50,
            iconTheme: const IconThemeData(
              color: Colors.grey,
            ),
            title: Center(
              child: Column(
                children: [
                  Text('STEP', style: TextStyle(fontSize: 15),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        child: Text('1', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade300,
                        foregroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 15,
                        child: Text('2', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade300,
                        foregroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 18,
                        child: Text('3', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade400,
                        foregroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 15,
                        child: Text('4', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade300,
                        foregroundColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              }, icon: Icon(Icons.close))
            ]
        ),
        body: Center(
          child: GestureDetector(
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
                    width: 200,
                    height: 200,
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
                ref.read(ShopAddPageProvider.notifier).imageFile(pickedFile);
                Navigator.of(context).pop();
              }),
          new ListTile(
            leading: new Icon(Icons.photo_camera),
            title: new Text('Camera'),
            onTap: () async{
              final pickedFile = await ImagePicker()
                  .pickImage(source: ImageSource.camera);
              ref.read(ShopAddPageProvider.notifier).imageFile(pickedFile);

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

}