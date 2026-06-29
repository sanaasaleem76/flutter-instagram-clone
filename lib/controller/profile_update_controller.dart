import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:instagram_clone/model/user_model.dart';

class ProfileUpdateController {
    static FirebaseAuth _auth = FirebaseAuth.instance;
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static FirebaseStorage _storage = FirebaseStorage.instance;
  static Future<void>  updateUserProfile (Map<String,dynamic> userDetails) async{

    try{
      await _firestore.collection("users")
          .doc(_auth.currentUser!.uid).
      update(userDetails);
      print('User profile update successfuly');
    }catch(e){
      print(e);
    }
  }
  static Future<String?> uploadImage (File imageFile, String imageNme)async{
    try {
      final reference = _storage.ref().child("images/$imageNme.png");
      final uploadTask = reference.putFile(imageFile);
      await uploadTask.whenComplete((){});
      String downLoadURL = await reference.getDownloadURL();
      return downLoadURL;

    }catch(e){
    print(e);
    return null;
    }
  }
}