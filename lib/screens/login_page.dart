import 'dart:async';

import 'package:cooking_app/common/varianble.dart';
import 'package:cooking_app/main.dart';
import 'package:cooking_app/models/User.dart';
import 'package:cooking_app/providers/user_provider.dart';
import 'package:cooking_app/screens/home_page.dart';
import 'package:cooking_app/screens/welcom_page.dart';
import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cooking_app/screens/register_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.init();
  }

  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, data, _) {
      return Scaffold(
        body: Wrap(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding:
                  EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
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
                      margin: EdgeInsets.only(top: 100),
                      child: Text(
                        'Login',
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
                              // inputFormatters: <TextInputFormatter>[
                              //   FilteringTextInputFormatter.allow(
                              //       RegExp(r'[a-zA-Z_0-9@. ]'))
                              // ],
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
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(bottom: 10),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6))),
                                    child: TextField(
                                      obscureText: true,
                                      maxLength: 15,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[a-zA-Z_0-9 ]'))
                                      ],
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        hintText: "************",
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[400],
                                        ),
                                        counterText: '',
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
                        ],
                      )),

                  //Login button
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 14),
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        var user = User(username: username, password: password);
                        int num = await data.CheckForLogin(user);
                        if (num == 1) {
                          Timer(Duration(seconds: 1), () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          });
                        } else {
                          var snackBar = SnackBar(
                            content:
                                Text("Username hoặc mật khẩu không chính xác!"),
                            duration: Duration(seconds: 1),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }

                        getUser = await data.getUser(user);
                      },
                      child: Text(
                        "Login",
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0B5551),
                      ),
                    ),
                  ),

                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 6, bottom: 6),
                      child: Text(
                        "OR",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              style: TextStyle(
                                color: AppColor.primary,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'inter',
                              ),
                              text: 'Register')
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 120, left: 0),
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomPage()));
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                style: TextStyle(
                                  color: AppColor.primary,
                                  fontFamily: 'inter',
                                ),
                                text: 'Back')
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
