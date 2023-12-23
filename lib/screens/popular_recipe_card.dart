import 'dart:ui';

import 'package:cooking_app/common/recipe_detail_page.dart';
import 'package:cooking_app/icons/fire_icon.dart';
import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/material.dart';

//https://vncoder.vn/bai-hoc/gesture-trong-flutter-230
class PopularRecipeCard extends StatelessWidget {
  final Recipe data;
  PopularRecipeCard({required this.data});

  @override
  Widget build(BuildContext context) {
    // GestureDetector: xac dinh va xu ly cac thao tac cua nguoi dung
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RecipeDetailPage(data: data)));
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 160,
          alignment: Alignment.bottomRight, //dich item sang ben duoi - phai
          padding: EdgeInsets.all(16),

          //Image
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(data.photo as String), fit: BoxFit.cover),
          ),
          //Text & Block position
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 4),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(4)),
                child: Text("Phổ biến!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w400)),
              ),
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  child: Container(
                    height: 80,
                    width: 160,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black.withOpacity(0.26),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Recipe Title
                        Text(
                          data.title as String,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              height: 150 / 100,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'inter'),
                        ),
                        // Recipe Calories and Time
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              Icon(FireIcon.fire,
                                  size: 12, color: Colors.white),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  data.calories as String,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.alarm, size: 12, color: Colors.white),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  data.time as String,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
