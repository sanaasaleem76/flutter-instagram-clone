import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/profile/profile_update_screen.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
           Padding(
             padding:  EdgeInsets.all(10.sp),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("User Name",
                 style: TextStyle(
                   fontSize: 20.sp,
                   fontWeight: FontWeight.w500
                 ),),
                 IconButton(onPressed: () {

                 }, icon: Icon(Icons.add))
               ],
             ),
           ),Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 90.h,
                  height: 90.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey
                  ),
                ),
                showDetails("Post", "0"),
                showDetails("Followers", "0"),
                showDetails("Following", "0"),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            customButton(true),
            SizedBox(
              height: 30.h,
            ),
            Expanded(child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: Image.asset("assets/insta.png",
                     fit: BoxFit.fill,),
                  );
                },))
          ],
        ),
      ),

    );
  }
  Widget customButton ( bool isCurrentUserProfile){
    return InkWell(
      onTap: () {
        if(isCurrentUserProfile){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileUpdateScreen(),));
        }else{
          // Follow Functionality
        }
      },
      child: Container(
        height:  30.h,
        width:  310,
        decoration: BoxDecoration(
          color:  isCurrentUserProfile ? Colors.grey[300] : Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(isCurrentUserProfile ? "Edit Profile": "Follow",
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: isCurrentUserProfile ? Colors.black : Colors.white

          ),),
      ),
    );
  }
  Widget showDetails (String title , value){
    return Column(
      children: [
        Text(value,
        style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w400),),
        Text(title,
          style: TextStyle( fontSize: 17.sp,
              fontWeight: FontWeight.w500),)
      ],
    );
  }
}
