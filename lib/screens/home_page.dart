import 'package:cooking_app/common/card.dart';
import 'package:cooking_app/common/custom_app_bar.dart';
import 'package:cooking_app/common/recommendation_recipe_card.dart';
import 'package:cooking_app/common/search_bar.dart';
import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/models/recipe_helper.dart';
import 'package:cooking_app/common/recipe_tile.dart';
import 'package:cooking_app/providers/recipe_provider.dart';
import 'package:cooking_app/screens/delicious_today.dart';
import 'package:cooking_app/screens/newly_posted_page.dart';
import 'package:cooking_app/screens/profile_page.dart';
import 'package:cooking_app/screens/search_page.dart';
import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final List<Recipe> featuredRecipe = RecipeHelper.featuredRecipe;
  final List<Recipe> recommendationRecipe = RecipeHelper.recommendationRecipe;
  final List<Recipe> newlyPostedRecipe = RecipeHelper.newlyPostedRecipe;

  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(builder: (context, data2, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
            title: Text(
              "Mỗi ngày một món ăn",
              style:
                  TextStyle(fontFamily: 'inter', fontWeight: FontWeight.w700),
            ),
            showProfilePhoto: true,
            profilePhoto: AssetImage("assets/images/thumbnail1.jpg")),
        body: ListView(
          shrinkWrap: true,
          physics:
              BouncingScrollPhysics(), //hoạt ảnh nẩy lên khi kéo xuống cuối cùng hoặc đầu tiên của ListView
          children: [
            Container(
              height: 350,
              color: Colors.white,
              child: Stack(
                // cho phep xep cong nhieu layer len nhau
                children: [
                  Container(
                    height: 245,
                    color: AppColor.primary,
                  ),
                  //Section 1
                  Column(
                    children: [
                      //search bar
                      SearchBarCustom(
                        routeTo: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SearchPage()));
                        },
                      ),

                      // Delicious Today - Header
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Món ngon mỗi ngày",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'inter'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        DeliciousTodayPage()));
                              },
                              child: Text(
                                "Xem tất cả",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              style:
                                  TextButton.styleFrom(primary: Colors.white),
                            )
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 6),
                        height: 220,
                        // giu khoang cach giua cac item
                        child: ListView.separated(
                          //do dai cua list Recipes
                          itemCount: data2.list.length,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection:
                              Axis.horizontal, //cuon theo chieu ngang
                          separatorBuilder: ((context, index) {
                            return SizedBox(
                              width: 26,
                            );
                          }),
                          //cong thuc; todo
                          itemBuilder: (context, index) {
                            return FeaturedRecipeCard(data: data2.list[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Section 2
            Container(
              padding: EdgeInsets.only(top: 10),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10, left: 16),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Gợi ý",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  //recomment
                  Container(
                    height: 220,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      // itemCount: recommendationRecipe.length,
                      itemCount: data2.listReview.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 16);
                      },
                      //Gioi thieu
                      itemBuilder: (context, index) {
                        return RecommendationRecipeCard(
                            data: data2.listReview[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),

            //Section 3
            Container(
              padding: EdgeInsets.only(right: 16, left: 16),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bài đăng mới",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'inter'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NewlyPostedPage()));
                    },
                    child: Text(
                      "Xem tất cả",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    style: TextButton.styleFrom(primary: Colors.white),
                  )
                ],
              ),
            ),

            Container(
                margin: EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  // scrollDirection: Axis.horizontal,
                  itemCount: data2.listNewPosted.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 16);
                  },
                  itemBuilder: (context, index) {
                    //Bai dang moi
                    return RecipeTile(
                      data: data2.listNewPosted[index],
                    );
                  },
                )),
            // -- end section 3 --
          ],
        ),
      );
    });
  }
}
