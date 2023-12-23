import 'package:cooking_app/common/recipe_detail_page.dart';
import 'package:cooking_app/icons/fire_icon.dart';
import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/material.dart';

class RecipeTile extends StatelessWidget {
  final Recipe data;
  RecipeTile({required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //todo
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RecipeDetailPage(data: data)));
      },
      child: Container(
        height: 96,
        // width: 400,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.whiteSoft,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(data.photo as String),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(6))),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      data.title as String,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(FireIcon.fire, size: 14),
                        Container(
                          margin: EdgeInsets.only(left: 6),
                          child: Text(
                            data.calories as String,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 6),
                          child: Icon(
                            FireIcon.clock,
                            size: 12,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 6),
                          child: Text(
                            data.time as String,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
