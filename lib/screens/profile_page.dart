import 'package:cooking_app/common/user_info_tile.dart';
import 'package:cooking_app/common/varianble.dart';
import 'package:cooking_app/icons/fire_icon.dart';
import 'package:cooking_app/screens/edit_profile.dart';
import 'package:cooking_app/screens/home_page.dart';
import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool editMode = false;

  @override
  Widget build(BuildContext context) {
    if (editMode) {
      return EditProfilePage();
    } else
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          elevation: 0,
          centerTitle: true,
          title: Text('My Profile',
              style: TextStyle(
                  fontFamily: 'inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  editMode = true;
                });
              },
              child: Text(
                'Edit',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100))),
            ),
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            // Section 1 - Profile Picture Wrapper
            Container(
              color: AppColor.primary,
              padding: EdgeInsets.symmetric(vertical: 24),
              child: GestureDetector(
                onTap: () {
                  //todo
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      margin: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                        // Profile Picture
                        image: DecorationImage(
                            image: AssetImage('assets/images/thumbnail1.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Change Profile Picture',
                            style: TextStyle(
                                fontFamily: 'inter',
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                        SizedBox(width: 8),
                        Icon(
                          FireIcon.camera,
                          size: 16,
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            // Section 2 - User Info Wrapper
            Container(
              margin: EdgeInsets.only(top: 24),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserInfoTile(
                    margin: EdgeInsets.only(bottom: 16),
                    label: 'Email',
                    value: getUser.email as String,
                    // value: "",
                  ),
                  UserInfoTile(
                    margin: EdgeInsets.only(bottom: 16),
                    label: 'Họ và tên',
                    value: getUser.full_name as String,
                    // value: "",
                  ),
                  UserInfoTile(
                    margin: EdgeInsets.only(bottom: 16),
                    label: 'Username',
                    value: getUser.username as String,
                    // value: "",
                  ),
                  UserInfoTile(
                    margin: EdgeInsets.only(bottom: 16),
                    label: 'Thời gian tham gia',
                    // value: getUser.date as String,
                    // value: DateFormat('dd-MM-yyyy – kk:mm')
                    //     .format(getUser.date as DateTime),
                    value: "",
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}
