import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/controller/login_controller.dart';
import 'package:instagram_clone/view/home_screen.dart';
import 'package:instagram_clone/view/loading_screen.dart';
import 'package:instagram_clone/view/sign_up_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isLoading = false;
  void onLogin()  async{
    if( email.text.isNotEmpty && password.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      bool isLoginSucessfull = await LoginController.login(
          email.text, password.text);
      if (isLoginSucessfull) {
        print("Login is successful");
      Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomeScreen(),),
          (route) => false,);
      }
      else {
        print("Some thing wrong");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? LoadingScreen()
        :Scaffold(
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
            Text("New User ?",
              style:TextStyle(
                  fontSize: 15.sp,) ,),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
              },
              child: Text("Sign Up",
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
      onTap: onLogin,
      child: Container(
        height: 40.h,
        width: 315.w,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text("Login",
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
