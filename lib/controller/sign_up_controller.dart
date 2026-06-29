import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/model/user_model.dart';

class SignUpController {
     static FirebaseAuth _auth = FirebaseAuth.instance;
     static FirebaseFirestore _firestore = FirebaseFirestore.instance;
     static Future<bool> createAccount (String email, password) async {
       try{
       final result = await _auth.createUserWithEmailAndPassword(
           email: email,
           password: password);
       if(result.user != null) {
         _saveUserDetails(email);
         return  true;
       }else{
         return false;
       }
       } catch(e){
             print(e);
             return false;
           }
}
 static Future<void>  _saveUserDetails(String email) async{
       try{
         String uid = _auth.currentUser!.uid;
         UserModel userModel = UserModel(
           uid:  uid,
           email: email,
           addLink: "",
           bio: "",
           name: "",
           profileImage: "",
           username: "",
           followers: 0,
           following: 0,
           post: 0
         );
         await _firestore.collection("user").doc(uid).set(userModel.toJson());
       }catch(e){
         print(e);
       }
 }
}