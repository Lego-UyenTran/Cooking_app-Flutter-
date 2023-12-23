import 'package:cooking_app/common/recipe_detail_page.dart';
import 'package:cooking_app/icons/fire_icon.dart';
import 'package:cooking_app/models/recipe.dart';
import 'package:flutter/material.dart';

class RecommendationRecipeCard extends StatelessWidget {
  final Recipe data;

  RecommendationRecipeCard({required this.data});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RecipeDetailPage(data: data)));
      },
      child: Container(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe Photo
            Container(
              height: 120,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
                image: DecorationImage(
                  image: AssetImage(data.photo as String),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Recipe title
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 8),
              padding: EdgeInsets.only(left: 4),
              child: Text(
                data.title as String,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'inter'),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Recipe calories and time
            Container(
              child: Row(
                children: [
                  Icon(FireIcon.fire, size: 12),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      '2100 Cal',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.alarm,
                    size: 12,
                    color: Colors.black,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      '25 min',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
