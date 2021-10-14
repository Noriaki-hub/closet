import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class Bottoms extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _Bottoms();
  }
}

class _Bottoms extends State<Bottoms> {

  String brands = "";
  String price = "";
  String category = "Bottoms";
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



  Future uploadFirebaseBottoms() async {
    final imageURL = await _uploadImageFile();
    final users= FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    users.doc(user!.uid).collection('clothes').add(
      {
        'brands': brands,
        'price': price,
        'category': category,
        'imageURL': imageURL,
        'updateAt': Timestamp.now(),
        'buyGet': buyGet,
        'sellGet': sellGet,
        'selling' : '0'
      },
    );
  }


  Future<String> _uploadImageFile() async {
    User? user = FirebaseAuth.instance.currentUser;

    final userEmail = user!.email;
    final storage = FirebaseStorage.instance;
    TaskSnapshot snapshot = await storage
        .ref()
        .child("userinfo/$userEmail/$brands")
        .putFile(imageFile!);
    final String downloadUrl =
    await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          color: Colors.white,
          child: Center(


              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child: imageFile != null
                          ? Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(imageFile!),
                            )
                        ),
                      )
                          :Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey
                        ),

                      )
                  ),

                  Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FloatingActionButton(
                              heroTag: "hero1",
                              onPressed: getImageFromCamera, //カメラから画像を取得
                              tooltip: 'Pick Image From Camera',
                              child: Icon(Icons.add_a_photo),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FloatingActionButton(
                              heroTag: "hero2",
                              onPressed: getImageFromGallery, //ギャラリーから画像を取得
                              tooltip: 'Pick Image From Gallery',
                              child: Icon(Icons.photo_library),
                            ),
                          )
                        ]
                    ),
                  ),


                  TextField(
                    onChanged: (text){
                      brands = text;
                    },
                    decoration: InputDecoration(
                      labelText: "Brands",
                    ),
                  ),

                  TextField(
                    onChanged: (text){
                      price = text;
                    },
                    decoration: InputDecoration(
                      labelText: "Price",
                    ),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        onPressed: () async{
                          await uploadFirebaseBottoms ();
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: Text("hang"),
                        color: Colors.blueAccent,
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: Text("cancel"),
                        color: Colors.redAccent,
                      )
                    ],
                  )
                ],
              )
          )
      ),
    );
  }

}

