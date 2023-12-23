import 'dart:async';

import 'package:cooking_app/models/User.dart';
import 'package:cooking_app/providers/user_provider.dart';
import 'package:cooking_app/screens/login_page.dart';
import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:email_validator/email_validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.init();
  }

  var loginForm = {};
  String email = '';
  String fullname = '';
  String username = '';
  String password = '';
  String password2 = '';

  Widget build(BuildContext context) {
    var uuid = Uuid();
    return Consumer<UserProvider>(builder: (context, data, _) {
      return Scaffold(
        body: Wrap(children: [
          Container(
            // color: Colors.white,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: 100,
                      height: 4,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20))),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'inter'),
                    ),
                  ),
                ),

                //Form
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 10, top: 30),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(bottom: 4),
                          child: Text(
                            "Email",
                            style: TextStyle(
                                color: Colors.grey.shade500,
                                fontFamily: 'inter',
                                fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 44,
                          decoration: BoxDecoration(
                              color: AppColor.primaryExtraSoft,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: TextField(
                            maxLength: 255,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z_0-9@. ]'))
                            ],
                            decoration: InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Enter your email",
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey[400]),
                            ),
                            onChanged: ((value) => {
                                  setState(() {
                                    email = value;
                                  })
                                }),
                          ),
                        ),
                      ],
                    )),

                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(bottom: 4),
                          child: Text(
                            "Fullname",
                            style: TextStyle(
                                color: Colors.grey.shade500,
                                fontFamily: 'inter',
                                fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 44,
                          decoration: BoxDecoration(
                              color: AppColor.primaryExtraSoft,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: TextField(
                            maxLength: 50,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z_ ]'))
                            ],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Enter your fullname",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[400],
                              ),
                              counterText: '',
                            ),
                            onChanged: ((value) => {
                                  setState(() {
                                    fullname = value;
                                  })
                                }),
                          ),
                        ),
                      ],
                    )),

                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(bottom: 4),
                          child: Text(
                            "Username",
                            style: TextStyle(
                                color: Colors.grey.shade500,
                                fontFamily: 'inter',
                                fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 44,
                          decoration: BoxDecoration(
                              color: AppColor.primaryExtraSoft,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: TextField(
                            maxLength: 15,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z_0-9 ]'))
                            ],
                            decoration: InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Enter your username",
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey[400]),
                            ),
                            onChanged: ((value) => {
                                  setState(() {
                                    username = value;
                                  })
                                }),
                          ),
                        ),
                      ],
                    )),

                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 10, top: 6),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(bottom: 4),
                          child: Text(
                            "Password",
                            style: TextStyle(
                                color: Colors.grey.shade500,
                                fontFamily: 'inter',
                                fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 44,
                          decoration: BoxDecoration(
                              color: AppColor.primaryExtraSoft,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: TextField(
                            maxLength: 15,
                            obscureText: true,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z_0-9 ]'))
                            ],
                            decoration: InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: "**********",
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey[400]),
                            ),
                            onChanged: ((value) => {
                                  setState(() {
                                    password = value;
                                  })
                                }),
                          ),
                        ),
                      ],
                    )),

                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 10, top: 6),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(bottom: 4),
                          child: Text(
                            "Retype Password",
                            style: TextStyle(
                                color: Colors.grey.shade500,
                                fontFamily: 'inter',
                                fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 44,
                          decoration: BoxDecoration(
                              color: AppColor.primaryExtraSoft,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: TextField(
                            obscureText: true,
                            maxLength: 15,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z_0-9 ]'))
                            ],
                            decoration: InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "************",
                              hintStyle: TextStyle(
                                  fontSize: 12, color: Colors.grey[400]),
                            ),
                            onChanged: ((value) => {
                                  setState(() {
                                    password2 = value;
                                  })
                                }),
                          ),
                        ),
                      ],
                    )),

                //Register button
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 14),
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      var user = User(
                        id: uuid.v4(),
                        email: email,
                        full_name: fullname,
                        username: username,
                        password: password,
                      );

                      // print(user.id.runtimeType); //type String
                      bool isValid = EmailValidator.validate(email);

                      // if (email == "" ||
                      //     fullname == "" ||
                      //     username == "" ||
                      //     password == "" ||
                      //     password2 == "") {
                      //   var snackBar = SnackBar(
                      //       content: Text("Vui lòng điền đầy đủ thông tin!"));
                      //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // } else if (!isValid) {
                      //   var snackBar = SnackBar(
                      //       content:
                      //           Text("Email không hợp lệ vui lòng nhập lại!"));
                      //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // } else if (password != password2) {
                      //   var snackBar = SnackBar(
                      //       content: Text(
                      //           "Mật khẩu nhập lại không trùng khớp với mật khẩu!"));
                      //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // } else {
                      //   int num = await data.CheckRegister(user);
                      //   if (num == -1) {
                      //     var snackBar = SnackBar(
                      //       content: Text("Đã tồn tại username này!"),
                      //       duration: Duration(seconds: 1),
                      //     );
                      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //   } else if (num == -2) {
                      //     var snackBar = SnackBar(
                      //       content: Text("Email đã dùng để đăng ký trước đó!"),
                      //       duration: Duration(seconds: 1),
                      //     );
                      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //   } else {
                      //     await data.add(user);
                      //     Timer(Duration(seconds: 1), () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => LoginPage()));
                      //     });
                      //   }
                      // }
                    },
                    child: Text("Register"),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0B5551),
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: 'Have an account? ',
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                            style: TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'inter',
                            ),
                            text: 'Login')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      );
    });
  }
}

//https://o2.edu.vn/kieu-xau-string-trong-dart-flutter/