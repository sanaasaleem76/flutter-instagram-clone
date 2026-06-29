import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/controller/sign_up_controller.dart';
import 'package:instagram_clone/view/home_screen.dart';
import 'package:instagram_clone/view/loading_screen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isLoading = false;
  void onCreateAccount () async {
  if ( email.text.isNotEmpty && password.text.isNotEmpty){
    setState(() {
      isLoading = true;
    });
   bool isAccountCreatedSucessfylly = await SignUpController.createAccount(email.text, password.text);
    if(isAccountCreatedSucessfylly){
      Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomeScreen(),),
            (route) => false,);
      print("Account is created");
    } else {
      print("Some thing wrong");
    }
    setState(() {
      isLoading = false;
    });
  }
  }
  @override
  Widget build(BuildContext context) {
    return
      isLoading ? LoadingScreen()
          :
      Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Instagram",
              style:TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 40.sp
              ) ,),
            SizedBox(
                height: 10.h
            ),
            customTextField("Email", email),
            customTextField("Password", password),
            SizedBox(
              height: 10.h,
            ),
            customButton()
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account",
              style:TextStyle(
                fontSize: 15.sp,) ,),
            InkWell(
              onTap: () {
               Navigator.pop(context);
              },
              child: Text("Login",
                style:TextStyle(
                    fontSize: 15.sp,
                    color: Colors.blue) ,),
            )
          ],
        ),
      ),
    );
  }
  Widget  customButton(){
    return InkWell(
      onTap: onCreateAccount,
      child: Container(
        height: 40.h,
        width: 315.w,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text("Create Account",
          style: TextStyle(
              color: Colors.white,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500
          ),),
      ),
    );
  }
  Widget customTextField (String  hintText , TextEditingController controller){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder()
        ),
      ),
    ) ;
  }
}
