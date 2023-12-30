import 'dart:async';
import 'dart:io';

import 'package:cooking_app/common/varianble.dart';
import 'package:cooking_app/models/User.dart';
import 'package:cooking_app/providers/user_provider.dart';
import 'package:cooking_app/screens/edit_password.dart';
import 'package:cooking_app/screens/profile_page.dart';
import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerFullname = TextEditingController();

  File _image = File(getUser.image ??
      'D:\\Documents\\Flutter\\App\\cooking_app\\assets\\images\\thumbnail1.jpg');

  Future<void> loadDataFromPreferences() async {
    setState(() {
      controllerEmail.text = getUser.email as String ?? '';
      controllerUsername.text = getUser.username as String ?? '';
      controllerFullname.text = getUser.full_name as String ?? '';
    });
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    getUser = await userProvider.getUser(getUser);
  }

  void initState() {
    super.initState();
    loadDataFromPreferences();
  }

  bool editMode = false;

  @override
  Widget build(BuildContext context) {
    // print("edit: " + getUser.image.toString());
    if (editMode) {
      return ProfilePage();
    } else
      return Consumer<UserProvider>(builder: (context, data, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primary,
            elevation: 0,
            centerTitle: true,
            title: Text(getUser.username.toString(),
                style: TextStyle(
                  fontFamily: 'inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                )),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                setState(() {
                  editMode = true;
                });
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            actions: [],
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
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _image == null
                          ? Container(
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
                                    image: FileImage(_image!),
                                    fit: BoxFit.cover),
                              ),
                            ),
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
                    myEditText("Email", controllerEmail),
                    myEditText("Fullname", controllerFullname),
                    myEditText("Username", controllerUsername),
                  ],
                ),
              ),
              //todo
              // controllerEmail.text == getUser.email &&
              //         controllerFullname.text == getUser.full_name &&
              //         controllerUsername.text == getUser.username
              //     ? Container(
              //         alignment: Alignment.topRight,
              //         padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
              //         margin: EdgeInsets.only(top: 20, bottom: 14),
              //         height: 40,
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             ElevatedButton(
              //               onPressed: null,
              //               child: Text(
              //                 "Cập nhật",
              //                 style: TextStyle(
              //                   fontWeight: FontWeight.w400,
              //                 ),
              //               ),
              //               style: ElevatedButton.styleFrom(
              //                 primary: Color(0xFF0B5551),
              //               ),
              //             ),
              //             TextButton(
              //               //Todo
              //               onPressed: () {
              //                 Navigator.of(context).push(MaterialPageRoute(
              //                     builder: (context) => EditPassword()));
              //               },
              //               child: Text(
              //                 "Đổi mật khẩu",
              //                 style: TextStyle(
              //                     fontSize: 12, fontWeight: FontWeight.w400),
              //               ),
              //               style:
              //                   TextButton.styleFrom(primary: Colors.blueGrey),
              //             ),
              //           ],
              //         )):
              Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                  margin: EdgeInsets.only(top: 20, bottom: 14),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          bool isValid =
                              EmailValidator.validate(controllerEmail.text);
                          if (controllerEmail.text == getUser.email &&
                              controllerFullname.text == getUser.full_name &&
                              controllerUsername.text == getUser.username) {
                            return;
                          }

                          if (controllerEmail.text == '' ||
                              controllerUsername.text == '' ||
                              controllerFullname.text == '') {
                            var snackBar = SnackBar(
                                content:
                                    Text("Vui lòng không để trống thông tin!"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (!isValid) {
                            var snackBar = SnackBar(
                                content: Text(
                                    "Email không hợp lệ vui lòng nhập lại!"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            // todo
                            var user = User(
                                id: getUser.id,
                                email: controllerEmail.text,
                                full_name: controllerFullname.text,
                                username: controllerUsername.text,
                                password: getUser.password,
                                image: getUser.image,
                                date: getUser.date);

                            int num = await data.update(user);

                            if (num == 1) {
                              var snackBar = SnackBar(
                                  content:
                                      Text("Cập nhật thông tin thành công!"));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              Timer(Duration(seconds: 1), () {
                                setState(() {
                                  editMode = true;
                                });
                              });
                              getUser =
                                  await data.getUserById(getUser.id as String);
                            } else {
                              var snackBar = SnackBar(
                                  content: Text(
                                      "Đã xảy ra lỗi! Vui lòng thử lại sau!"));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        },
                        child: Text(
                          "Cập nhật",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF0B5551),
                        ),
                      ),
                      TextButton(
                        //Todo
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditPassword()));
                        },
                        child: Text(
                          "Đổi mật khẩu",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        style: TextButton.styleFrom(primary: Colors.blueGrey),
                      ),
                    ],
                  )),
            ],
          ),
        );
      });
  }

  myEditText(String label, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text('$label',
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 6),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 6, bottom: 6, right: 16, left: 16),
            color: AppColor.primaryExtraSoft,
            child: TextFormField(
                controller: controller,
                autofocus: true,
                style: TextStyle(fontSize: 14, fontFamily: 'inter')),
          )
        ],
      ),
    );
  }
}
