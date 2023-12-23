import 'package:cooking_app/icons/fire_icon.dart';
import 'package:cooking_app/screens/login_page.dart';
import 'package:cooking_app/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:cooking_app/utils/AppColor.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool showProfilePhoto;
  final ImageProvider profilePhoto;

  CustomAppBar({
    required this.title,
    required this.showProfilePhoto,
    required this.profilePhoto,
  });

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primary,
      title: title,
      elevation: 0,
      leading: IconButton(
        icon: Icon(FireIcon.logout, color: Colors.white),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Container(
                    width: 80,
                    height: 30,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                      "Đăng xuất?",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  actions: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 20,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Huỷ',
                              ),
                              style: TextButton.styleFrom(
                                primary: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: ElevatedButton(
                              onPressed: () async {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                              },
                              child: Text('Đồng ý'),
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              });
        },
      ),
      actions: [
        Visibility(
          visible: showProfilePhoto,
          child: Container(
            margin: EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: IconButton(
              //-> profile page
              // onPressed: profilePhotoOnPressed,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ));
              },
              icon: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  image:
                      DecorationImage(image: profilePhoto, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
