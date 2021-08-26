import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class BuyPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _BuyPage();
  }
}

class _BuyPage extends State<BuyPage> {
  // TextEditingController sampleData1 = TextEditingController();
  // TextEditingController sampleData2 = TextEditingController();
  // TextEditingController sampleData3 = TextEditingController();
  String brands = "";
  String category ="";
  String price = "";


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

  Future uploadFirebase () async{

    final imageURL = await _uploadImageFile();
    FirebaseFirestore.instance.collection('clothes').add(
      {
        'brands': brands,
        'category': category,
        'price': price,
        'imageURL': imageURL,
        'updateAt': Timestamp.now(),
      },
    );
  }

  Future<String> _uploadImageFile() async {
    final storage = FirebaseStorage.instance;
    TaskSnapshot snapshot = await storage
        .ref()
        .child("clothes/$brands")
        .putFile(imageFile!);
    final String downloadUrl =
    await snapshot.ref.getDownloadURL();
    return downloadUrl;




  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("BUY"),
      ),
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
                      category = text;
                    },
                    decoration: InputDecoration(
                      labelText: "Category",
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


                  FlatButton(
                    onPressed: () async{
                      await uploadFirebase ();
                    },
                    child: Text("submit"),
                    color: Colors.blueAccent,


                  )
                ],
              )
          )
      ),
    );
  }


}





class SellPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("SELL CLOTHES"),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

              ],
            )
        ),
      ),
    );
  }
}
