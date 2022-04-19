import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeshop/services/firebase/fire_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CoffeeUploadPRovider extends ChangeNotifier {
  Future uploadCoffeeToDb(BuildContext context,String name, String price) async {
    await FireService.store.collection('coffee').doc(name).set({
      "name": name,
      "proce": price,
      "image_url": "",
      "create_at": FieldValue.serverTimestamp(),
    });
    Navigator.pop(context);
    notifyListeners();
  }

  Future uploadImageToStorage(XFile file, String name)async{
    var image = await FireService.storage.ref().child('coffee').child('images').child(name).putFile(File(file.path));

    String downloadUrl = await image.ref.getDownloadURL();
    var data = await FireService.store.collection('coffee').doc(name).set(
      {"image_url": downloadUrl},
      SetOptions(merge: true),
    );
    notifyListeners();
  }
}
