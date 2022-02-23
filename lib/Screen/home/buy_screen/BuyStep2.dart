import 'dart:io';
import 'package:closet_app_xxx/model/home/controllers/buy_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'BuyStep3.dart';


class BuyStep2 extends HookConsumerWidget {


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(BuyItemsProvider.select((s) => s.imageFile));
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.brown.shade100,
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
                        backgroundColor: Colors.grey.shade400,
                        foregroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 18,
                        child: Text('2', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade200,
                        foregroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 15,
                        child: Text('3', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade400,
                        foregroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 15,
                        child: Text('4', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade400,
                        foregroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 15,
                        child: Text('5', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                        backgroundColor: Colors.grey.shade400,
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
        body: Container(
          height: double.infinity,
          color: Colors.brown.withOpacity(0.2),

          child:
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
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
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: imageFile != null ?
                  OutlinedButton(
                    child: const Text('Next'),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BuyStep3(),
                          ));
                    },
                  ):
                  Container()
                ),
              ],
            ),
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
                 ref.read(BuyItemsProvider.notifier).imageFile(pickedFile);
                 Navigator.of(context).pop();
               }),
           new ListTile(
             leading: new Icon(Icons.photo_camera),
             title: new Text('Camera'),
             onTap: () async{
               final pickedFile = await ImagePicker()
                   .pickImage(source: ImageSource.camera);
               ref.read(BuyItemsProvider.notifier).imageFile(pickedFile);

               Navigator.of(context).pop();
             },
           ),
         ],
       ),
     );
  }
  
}

