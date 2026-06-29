import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/view/home_screen.dart';
import 'package:instagram_clone/view/login_screen.dart';
class Authentication extends StatelessWidget {
  Authentication({super.key});
  FirebaseAuth  _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    if( _auth.currentUser != null){
      return HomeScreen();
    }else {
     return  LoginScreen();
    };
  }
}
