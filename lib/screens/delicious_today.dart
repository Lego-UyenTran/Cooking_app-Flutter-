import 'package:cooking_app/common/recipe_tile.dart';
import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/models/recipe_helper.dart';
import 'package:cooking_app/providers/recipe_provider.dart';
import 'package:cooking_app/screens/popular_recipe_card.dart';
import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliciousTodayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(builder: (context, data2, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          elevation: 0,
          centerTitle: true, //can chinh title
          title: Text(
            "Món ngon mỗi ngày",
            style: TextStyle(
                fontFamily: 'inter', fontSize: 16, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              color: AppColor.primary,
              alignment: Alignment.topCenter,
              height: 210,
              padding: EdgeInsets.all(16),
              // child: PopularRecipeCard(data: popularRecipe),
              child: PopularRecipeCard(data: data2.listPopular[0]),
            ),
            Container(
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return RecipeTile(
                      // data: featuredRecipe[index], //change
                      data: data2.list[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 16);
                  },
                  // itemCount: featuredRecipe.length
                  itemCount: data2.list.length),
            )
          ],
        ),
      );
    });
  }
}
