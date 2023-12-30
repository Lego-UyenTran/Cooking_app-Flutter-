import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cooking_app/common/user_info_tile.dart';
import 'package:cooking_app/common/varianble.dart';
import 'package:cooking_app/icons/fire_icon.dart';
import 'package:cooking_app/models/User.dart';
import 'package:cooking_app/providers/recipe_provider.dart';
import 'package:cooking_app/providers/user_provider.dart';
import 'package:cooking_app/screens/edit_profile.dart';
import 'package:cooking_app/screens/home_page.dart';
import 'package:cooking_app/utils/AppColor.dart';
import 'package:cooking_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool editMode = false;
  File _image = File(getUser.image ??
      'D:\\Documents\\Flutter\\App\\cooking_app\\assets\\images\\thumbnail1.jpg');

  void selectImage() async {
    var img = await pickImage(ImageSource.gallery);
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.uploadImage(img.path as String, getUser.id as String);
    getUser = await userProvider.getUser(getUser);
    Timer(Duration(seconds: 1), () {
      setState(() {
        _image = img;
      });
      var snackBar = SnackBar(
          duration: Duration(seconds: 1),
          content: Text("Upload ảnh thành công!"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("image: " + getUser.image.toString());
    if (editMode) {
      return EditProfilePage();
    } else
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          elevation: 0,
          centerTitle: true,
          title: Text(getUser.username as String,
              style: TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w500,
                fontSize: 20,
              )),
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
                'Chỉnh sửa',
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
                onTap: selectImage,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //add image
                    _image != null
                        ? Container(
                            width: 130,
                            height: 130,
                            margin: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100),
                              // Profile Picture
                              image: DecorationImage(
                                  image: FileImage(_image!), fit: BoxFit.cover),
                            ),
                          )
                        : Container(
                            width: 130,
                            height: 130,
                            margin: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100),
                              // Profile Picture
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/thumbnail1.jpg'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Cập nhật ảnh',
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
                    value: DateFormat('dd-MM-yyyy – kk:mm')
                        .format(getUser.date as DateTime),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    // });
  }
}
