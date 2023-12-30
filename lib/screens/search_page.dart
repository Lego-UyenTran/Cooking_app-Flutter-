import 'dart:async';
import 'package:cooking_app/common/recipe_tile.dart';
import 'package:cooking_app/icons/fire_icon.dart';
import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/models/recipe_helper.dart';
import 'package:cooking_app/providers/recipe_provider.dart';
import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchInputController = TextEditingController();
  List<Recipe> searchResult = [];
  // RecipeHelper.searchResultRecipe;

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(builder: (context, data2, _) {
      return Scaffold(
          appBar: AppBar(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
            backgroundColor: AppColor.primary,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Tìm kiếm công thức",
              style: TextStyle(
                  fontFamily: 'inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              //Section1 - Search
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                color: AppColor.primary,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Search bar
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Text field
                            Expanded(
                                child: Container(
                              height: 46,
                              margin: EdgeInsets.only(right: 14),
                              child: TextField(
                                controller: searchInputController,
                                onChanged: (value) {
                                  //todo
                                  String key = searchInputController.text;
                                  if (key.length == 0) {
                                    setState(() {
                                      searchResult = [];
                                    });
                                    return;
                                  }
                                  Timer(Duration(seconds: 1), () async {
                                    List<Recipe> temp =
                                        await data2.searchResult(key);
                                    setState(() {
                                      searchResult = temp;
                                    });
                                  });
                                },
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                maxLines: 1,
                                textInputAction: TextInputAction.search,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColor.secondary),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    hintText: 'Hôm nay bạn muốn ăn gì?',
                                    hintStyle: TextStyle(
                                        color: Colors.white.withOpacity(0.2)),
                                    prefixIcon: Visibility(
                                        visible:
                                            (searchInputController.text.isEmpty)
                                                ? true
                                                : false,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 10, right: 12),
                                          child: Icon(
                                            FireIcon.search,
                                            size: 22,
                                            color: AppColor.secondary,
                                          ),
                                        ))),
                              ),
                            )),

                            //Filter button
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.white,
                                    builder: (context) {
                                      // return SearchFilterModal();
                                      //todo
                                      return Container(
                                        margin: EdgeInsets.only(bottom: 6),
                                        child: Wrap(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                  ),
                                                  color: AppColor
                                                      .primaryExtraSoft),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Container(
                                                      height: 60,
                                                      color: Colors.transparent,
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 16),
                                                      child: Text('Reset',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey)),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Sắp xếp',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily: 'inter'),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Container(
                                                      height: 60,
                                                      color: Colors.transparent,
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 16),
                                                      child: Text('Huỷ',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            //Sort by option
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                bottom: BorderSide(
                                                    color:
                                                        Colors.grey.shade300),
                                              )),
                                              child: ListTileTheme(
                                                  selectedColor:
                                                      AppColor.primary,
                                                  textColor: Colors.grey,
                                                  child: ListTile(
                                                    selected: true,
                                                    title: TextButton(
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 14),
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: const Text(
                                                            'Bài viết mới',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16)),
                                                      ),
                                                      //todo
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();

                                                        Timer(
                                                            Duration(
                                                                seconds: 1),
                                                            () {
                                                          setState(() {
                                                            searchResult = data2
                                                                .listNewPosted;
                                                          });
                                                        });
                                                      },
                                                      style:
                                                          TextButton.styleFrom(
                                                        foregroundColor:
                                                            AppColor.primary,
                                                      ),
                                                    ),
                                                  )),
                                            ),

                                            // Sort By Option
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                bottom: BorderSide(
                                                    color:
                                                        Colors.grey.shade300),
                                              )),
                                              child: ListTileTheme(
                                                  selectedColor:
                                                      AppColor.primary,
                                                  textColor: Colors.grey,
                                                  child: ListTile(
                                                    selected: true,
                                                    title: TextButton(
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 14),
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: const Text(
                                                            'Bài viết phổ biến',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16)),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();

                                                        Timer(
                                                            Duration(
                                                                seconds: 1),
                                                            () {
                                                          setState(() {
                                                            searchResult = data2
                                                                .listPopular;
                                                          });
                                                        });
                                                      },
                                                      style:
                                                          TextButton.styleFrom(
                                                        foregroundColor:
                                                            AppColor.primary,
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                width: 44,
                                height: 46,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.secondary),
                                child: Icon(
                                  FireIcon.filter,
                                  size: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Block; can scroll hoz
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.only(right: 6, left: 6),
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 8,
                            );
                          },
                          itemCount: popularRecipeKeyword.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.topCenter,
                              child: TextButton(
                                onPressed: () => {
                                  //todo
                                  searchInputController.text =
                                      popularRecipeKeyword[index],

                                  Timer(Duration(seconds: 1), () async {
                                    List<Recipe> temp =
                                        await data2.searchResult(
                                            searchInputController.text);
                                    setState(() {
                                      searchResult = temp;
                                    });
                                  })
                                },
                                child: Text(
                                  popularRecipeKeyword[index],
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7)),
                                ),
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: Colors.white.withOpacity(0.2),
                                        width: 1)),
                              ),
                            );
                          },
                        ),
                      ),
                    ]),
              ),
              //Search result
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text(
                        'Kết quả tìm kiếm...',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: searchResult.length,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16);
                      },
                      itemBuilder: (context, index) {
                        return RecipeTile(
                          data: searchResult[index],
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ));
    });
  }
}
