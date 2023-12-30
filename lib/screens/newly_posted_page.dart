import 'package:cooking_app/common/recipe_tile.dart';
import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/models/recipe_helper.dart';
import 'package:cooking_app/providers/recipe_provider.dart';
import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class NewlyPostedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(builder: (context, data2, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Bài đăng mới",
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
                    return RecipeTile(data: data2.listNewPosted[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 16);
                  },
                  itemCount: data2.listNewPosted.length),
            )
          ],
        ),
      );
    });
  }
}
