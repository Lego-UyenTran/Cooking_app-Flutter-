import 'package:cooking_app/common/varianble.dart';
import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/providers/recipe_provider.dart';
import 'package:cooking_app/screens/recipe_tile_for_bk.dart';
import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatefulWidget {
  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  void initState() {
    super.initState();
    var recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
    recipeProvider.init();
  }

  List<Recipe> temp = [];

  @override
  Widget build(BuildContext context) {
    var recipeProvider = Provider.of<RecipeProvider>(context, listen: true);
    temp = recipeProvider.getListBookmark(getUser.id as String);

    // temp = recipeProvider.listBookmark2;
    if (temp.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Bài viết đã lưu",
            style: TextStyle(
                fontFamily: 'inter', fontSize: 16, fontWeight: FontWeight.w700),
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
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return RecipeTile2(data: temp[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 16);
                  },
                  itemCount: temp.length),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Bài viết đã lưu",
          style: TextStyle(
              fontFamily: 'inter', fontSize: 16, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
