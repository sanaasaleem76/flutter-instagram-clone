import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/const.dart';
import 'package:instagram_clone/controller/profile_update_controller.dart';
import 'package:instagram_clone/view/loading_screen.dart';
class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController addLink = TextEditingController();
  bool isLoading = false;

  File? profileImage;
  void pickImage() async {
    final pickedImage = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profileImage = File(pickedImage.path); // This is valid now since pickedImage is resolved
      setState(() {});
    }
  }
  void onSavingDetails () async {
    // setState(() {
    //   isLoading = true;
    // });
    String profileImageURL = "";
    if(name.text.isNotEmpty && userName.text.isNotEmpty){
      if(profileImage!= null){
        String imageID = generateID();
        profileImageURL = await ProfileUpdateController.uploadImage(profileImage!, imageID ) ?? "";

      }
      Map<String,dynamic>  userDetails = {
       "name": name.text,
        "username": userName.text,
        "bio": bio.text,
        "add_link": addLink.text,
        "profile_image": profileImageURL.isNotEmpty ? profileImageURL :null
      };
      await ProfileUpdateController.updateUserProfile(userDetails);
      setState(() {
        isLoading= false;
      });
    }
    else{

    }
  }
  @override
  Widget build(BuildContext context) {
    return isLoading ? LoadingScreen():Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Edit Profile",style: TextStyle(
          color: Colors.black
        ),),
        leading: IconButton(onPressed: () {

        }, icon: Icon(Icons.close,color: Colors.black,)),
        actions: [IconButton(onPressed: onSavingDetails,
            icon: Icon(Icons.done))],
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 90.h,
                width: 90.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: DecorationImage(
                    image: profileImage != null
                        ? FileImage(profileImage!)  // No need for casting
                        : AssetImage("assets/insta.png"),  // No need for casting
                    fit: BoxFit.cover,  // Optionally, you can specify the fit to adjust the image's display
                  ),
                ),
              ),

              TextButton(onPressed: pickImage,
                  child: Text("Change profile photo",
                style: TextStyle(fontSize: 18.sp),)),
              customTextField("Name",name),
              customTextField("User Name",userName),
              customTextField("Bio",bio),
              customTextField("Add Link",addLink),
            ],
          ),
        ),
      ),
    );
  }
  Widget customTextField (String hintText , TextEditingController controller){
    return Padding(
        padding: EdgeInsets.all(10.sp),
      child:  TextField(
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
