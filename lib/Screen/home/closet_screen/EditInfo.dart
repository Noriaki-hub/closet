import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'closet_model.dart';


class EditPage extends StatefulWidget {

  Closet clothes;

  EditPage(this.clothes);

  @override
  State<StatefulWidget> createState() {
    return _EditPage(clothes);
  }
}

class _EditPage extends State<EditPage> {

  Closet clothes;

  _EditPage(this.clothes);



  final maxLines = 5;

  String assets = '';

  File? imageFile;
  final picker = ImagePicker();

  String _assets() {
    switch (clothes.category) {
      case ('Tops'):
        assets = 'images/Tops.png';
        break;
      case ('Bottoms'):
        assets = 'images/Bottoms.png';
        break;
      case ('Outer'):
        assets = 'images/Outer.png';
        break;
      case ('Footwear'):
        assets = 'images/Footwear.png';
        break;
      case ('Accessories'):
        assets = 'images/Accessories.png';
        break;
    }
    return assets;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: SizedBox(
            height: 50,
            width: 50,
            child: InkWell(
                onTap: (){
                    Navigator.pop(context, true);
                },
                child: Container(

                  child: Center(
                      child: Text("Back",
                        style :TextStyle(color: Colors.black),
                      )
                  ),
                )
            ),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          title: Text("Edit",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.all(12),
                  child: GestureDetector(
                      onTap: ()  {
                        _showPicker(context);
                      },
                      child:
                      CircleAvatar(
                          radius: 155,
                          backgroundColor: Colors.black54,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: imageFile != null ?
                            Image.file(
                              imageFile!,
                              width: 300,
                              height: 300,
                              fit: BoxFit.fitHeight,
                            )
                                :
                            Container(
                                color: Colors.white,
                                child: clothes.imageURL != '' ?
                                Image.network(
                                  clothes.imageURL,
                                  width: 300,
                                  height: 300,
                                  fit: BoxFit.fitHeight,
                                )
                                    :
                                Image.asset(
                                  clothes.assetURL,
                                  width: 300,
                                  height: 300,
                                  fit: BoxFit.fitHeight,
                                )
                            ),
                          )
                      )
                  ),
                ),
                Container(
                  width: 250,
                  child: TextField(
                    controller: TextEditingController(text: clothes.brands),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        )
                    ),
                    onChanged: (text) {
                      clothes.brands = text;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  height: maxLines * 24.0,
                  width: 250,
                  child: TextField(
                    controller: TextEditingController(
                        text: clothes.description),
                    maxLines: maxLines,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        )
                    ),
                    onChanged: (text) {
                      clothes.description = text;
                    },
                  ),
                ),
                Container(
                  width: 250,
                  child: TextField(
                      controller: TextEditingController(text: clothes.price),
                      decoration: InputDecoration(
                        hintText: '¥',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.black45,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.black,
                            )
                        ),
                      ),
                      onChanged: (text) {
                        clothes.price = text;
                      }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: OutlinedButton(
                    child: const Text('Done'),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(),
                    ),
                    onPressed: () {
                      _edit(context);
                    },
                  ),
                ),
              ]
          ),
        )
    );
  }


  Future _edit(context) async {
    await _editFirebase();
   _back();
  }

  _back(){
    Navigator.pop(context, true);
    Navigator.pop(context, true);
  }




  Future _editFirebase() async {

    String? imageURL;
    String? assetURL;

    if (imageFile == null) {
      imageURL = clothes.imageURL;
      assetURL = clothes.assetURL;
    }else{
      imageURL = await _uploadImageFile();
      assetURL = '';
    }



    final users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    users.doc(user!.uid).collection('clothes').doc(clothes.id).update(
      {
        'imageURL': imageURL,
        'assetURL': assetURL,
        'brands': clothes.brands,
        'description': clothes.description,
        'price': clothes.price,
      },
    );
  }


  Future<String> _uploadImageFile() async {
    User? user = FirebaseAuth.instance.currentUser;

    final userEmail = user!.email;
    final storage = FirebaseStorage.instance;
    TaskSnapshot snapshot = await storage
        .ref()
        .child("userinfo/$userEmail/$clothes.brands")
        .putFile(imageFile!);
    final String downloadUrl =
    await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }


  Future _getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  Future _getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  _showPicker(context) {
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
                        _getImageFromGallery();
                        Navigator.of(context).pop();
                      }),

                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _getImageFromCamera();
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

}



