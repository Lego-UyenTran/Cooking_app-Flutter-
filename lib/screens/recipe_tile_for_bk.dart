import 'package:cooking_app/common/recipe_detail_page.dart';
import 'package:cooking_app/common/recipe_tile.dart';
import 'package:cooking_app/common/varianble.dart';
import 'package:cooking_app/icons/fire_icon.dart';
import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/providers/recipe_provider.dart';
import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeTile2 extends StatefulWidget {
  final Recipe data;
  RecipeTile2({required this.data});

  @override
  State<RecipeTile2> createState() => _RecipeTile2State();
}

class _RecipeTile2State extends State<RecipeTile2> {
  @override
  void initState() {
    super.initState();
    var recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
    recipeProvider.init();
  }

  Widget build(BuildContext context) {
    var recipeProvider = Provider.of<RecipeProvider>(context, listen: true);
    // ignore: dead_code
    for (int i = 0; i < recipeProvider.listBookmark.length; i++) {
      if (widget.data.listBookmark[i].bookmark == true) {
        return Consumer<RecipeProvider>(builder: (context, data2, _) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RecipeDetailPage(data: widget.data)));
            },
            child: Container(
              height: 106,
              width: MediaQuery.of(context).size.width,
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
                        image: AssetImage(widget.data.photo as String),
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
                          width: 244,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.data.title as String,
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                              Container(
                                child: IconButton(
                                  icon: Icon(
                                    FireIcon.bookmark_1,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    recipeProvider.removeBookmark(
                                        widget.data, getUser.id.toString());
                                    // setState(() {
                                    //   widget.data.bookmark = false;
                                    // });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(FireIcon.fire, size: 14),
                              Container(
                                margin: EdgeInsets.only(left: 6),
                                child: Text(
                                  widget.data.calories as String,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
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
                                  widget.data.time as String,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
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
        });
      } else {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RecipeDetailPage(data: widget.data)));
          },
          child: Container(
            height: 96,
            width: MediaQuery.of(context).size.width,
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
                      image: AssetImage(widget.data.photo as String),
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
                        width: 244,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //todo
                            Text(
                              widget.data.title as String,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                          ],
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
                                widget.data.calories as String,
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
                                widget.data.time as String,
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
    return Container();
  }
}
