import 'package:flutter/material.dart';
import 'package:instagram_clone/controller/login_controller.dart';
import 'package:instagram_clone/profile/profile_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text("Home Screen"),
      actions: [
        IconButton(onPressed: () {
        LoginController.logout(context);
      }, icon: Icon(Icons.logout)),
        IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
        }, icon: Icon(Icons.account_box_outlined))
      ],
      ),

    );
  }
}
