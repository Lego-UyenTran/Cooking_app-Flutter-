import 'dart:async';
import 'dart:io';

import 'package:cooking_app/common/varianble.dart';
import 'package:cooking_app/providers/user_provider.dart';
import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  TextEditingController controllerOldPass = TextEditingController();
  TextEditingController controllerRetryPassword = TextEditingController();
  TextEditingController controllerNewPassword = TextEditingController();

  File _image = File(getUser.image ??
      'D:\\Documents\\Flutter\\App\\cooking_app\\assets\\images\\thumbnail1.jpg');

  Widget build(BuildContext context) {
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
              Navigator.of(context).pop();
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
                                  image: FileImage(_image!), fit: BoxFit.cover),
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
                  myEditText("Nhập mật khẩu", controllerOldPass),
                  myEditText("Nhập mật khẩu mới", controllerNewPassword),
                  myEditText("Nhập lại mật khẩu", controllerRetryPassword),
                ],
              ),
            ),

            Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                margin: EdgeInsets.only(top: 14, bottom: 14),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        String oldPassword = controllerOldPass.text;
                        String newPassword = controllerNewPassword.text;
                        String retryPassword = controllerRetryPassword.text;

                        int checkPassword = await data.CheckPassword(
                            getUser.id as String, oldPassword);

                        if (oldPassword == '' ||
                            newPassword == '' ||
                            retryPassword == '') {
                          var snackBar = SnackBar(
                              content:
                                  Text("Vui lòng không để trống thông tin!"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (checkPassword == 0) {
                          var snackBar = SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text(
                                  "Nhập sai mật khẩu! Vui lòng nhập lại!"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (newPassword == oldPassword) {
                          var snackBar = SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text(
                                  "Mật khẩu mới trùng với mật khẩu cũ. Vui lòng nhập lại!"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (newPassword != retryPassword) {
                          var snackBar = SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text(
                                  "Mật khẩu nhập lại không trùng với mật khẩu đã nhập. Vui lòng nhập lại!"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          int changePassword = await data.ChangePassword(
                              getUser.id as String, newPassword);
                          if (changePassword == 1) {
                            var snackBar = SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text("Đổi mật khẩu thành công!"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Timer(Duration(seconds: 1), () {
                              Navigator.of(context).pop();
                            });
                          } else {
                            var snackBar = SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text(
                                    "Đã xảy ra lỗi! Vui lòng thử lại sau!"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      },
                      child: Text(
                        "Đổi mật khẩu",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0B5551),
                      ),
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
            padding: EdgeInsets.only(right: 16, left: 16),
            color: AppColor.primaryExtraSoft,
            child: TextFormField(
                maxLength: 15,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z_0-9 ]'))
                ],
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "************",
                ),
                controller: controller,
                autofocus: true,
                style: TextStyle(fontSize: 14, fontFamily: 'inter')),
          )
        ],
      ),
    );
  }
}
