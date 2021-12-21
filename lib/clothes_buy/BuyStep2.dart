import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'BuyStep3.dart';

void main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class BuyStep2 extends StatefulWidget {

  String? category;
  BuyStep2(this.category);

  @override
  State<StatefulWidget> createState() {
    return _BuyStep2(category);
  }
}

class _BuyStep2 extends State<BuyStep2> {

  String? category;
  _BuyStep2(this.category);



  String brands = "";
  String price = "";
  // String category = "Tops";
  String buyGet = 'yes';
  String sellGet = 'no';

  File? imageFile;
  final picker = ImagePicker();


  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }



  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        getImageFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getImageFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          title: Text("Photos",
              style: TextStyle(color: Colors.black),
          )
        ),
        body: Container(
          height: double.infinity,
          color: Colors.white,

          child:
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: CircleAvatar(
                      radius: 155,
                      backgroundColor: Colors.black54,
                      child: imageFile != null
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.file(
                          imageFile!,
                          width: 300,
                          height: 300,
                          fit: BoxFit.fitHeight,
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
                      ),
                    )
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: OutlinedButton(
                    child: const Text('Next'),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(),
                    ),
                    onPressed: () {
                      imageFile != null
                          ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BuyStep3(imageFile, category),
                          )
                      )
                      : _showDialog();
                    },
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  Future _showDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("エラー"),
          content: Text("画像無しでよろしいですか？"), actions: [

          TextButton(
            child: Text("Yes"),
            onPressed: () async{
              await Navigator.push (
                  context,
                  MaterialPageRoute(
                  builder: (context) => BuyStep3(imageFile, category),
              )
              );
      }
          ),
          TextButton(
            child: Text("No"),
            onPressed: () => Navigator.pop(context)
          ),
          ],
        );
      },
    );
  }



}

