import 'package:cooking_app/icons/fire_icon.dart';
import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/common/recipe_detail_page.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class FeaturedRecipeCard extends StatelessWidget {
  final Recipe data;
  FeaturedRecipeCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RecipeDetailPage(data: data)));
      },
      // Card Wrapper
      child: Container(
        width: 160,
        height: 220,
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(data.photo as String),
            fit: BoxFit.cover,
          ),
        ),
        // Recipe Card Info; todo
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 80,
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
                        Icon(FireIcon.fire, size: 12, color: Colors.white),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            data.calories as String,
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.alarm, size: 12, color: Colors.white),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            data.time as String,
                            style: TextStyle(color: Colors.white, fontSize: 10),
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
      ),
    );
  }
}
