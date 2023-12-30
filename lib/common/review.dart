import 'package:cooking_app/common/varianble.dart';
import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/providers/recipe_provider.dart';
import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ReviewTile extends StatefulWidget {
  final Review data;
  ReviewTile({required this.data});

  @override
  State<ReviewTile> createState() => _ReviewTileState();
}

class _ReviewTileState extends State<ReviewTile> {
  TextEditingController _controller = TextEditingController();

  Future<void> loadDataFromPreferences() async {
    setState(() {
      _controller.text = widget.data.review as String ?? '';
    });
  }

  void initState() {
    super.initState();
    loadDataFromPreferences();

    var recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
    recipeProvider.init();
  }

  @override
  Widget build(BuildContext context) {
    var recipeProvider = Provider.of<RecipeProvider>(context, listen: true);
    _controller.text = widget.data.review as String;
    String temp = "";
    if (widget.data.userId == null) {
      temp = "";
    } else {
      temp = widget.data.userId as String;
    }

    if (temp != getUser.id.toString()) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade300, width: 0.7)),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    Text(
                      widget.data.username as String,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Text(widget.data.review as String),
              Container(
                margin: EdgeInsets.only(top: 6, bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.data.date as String,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ]),
      );
    } else {
      return Consumer<RecipeProvider>(builder: (context, data2, _) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.grey.shade300, width: 0.7)),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      Text(
                        widget.data.username as String,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Text(widget.data.review as String),
                Container(
                  margin: EdgeInsets.only(top: 6, bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.data.date as String,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),

                      //Edit / Delete
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: TextButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 150,
                                            color: Colors.white,
                                            child: TextField(
                                              autofocus: true,
                                              controller: _controller,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              minLines: 6,
                                              maxLines: null,
                                            ),
                                          ),
                                          actions: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 120,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Huỷ'),
                                                    style: TextButton.styleFrom(
                                                      primary: Colors.grey[600],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    child: ElevatedButton(
                                                      //todo;
                                                      onPressed: () async {
                                                        var review = Review(
                                                            id: widget.data.id
                                                                as String, //id nguoi cmt
                                                            foodId: widget
                                                                .data.foodId,
                                                            type: widget
                                                                .data.type,
                                                            username: getUser
                                                                .username,
                                                            userId: getUser
                                                                .id, //id nguoi cmt
                                                            review: _controller
                                                                .text,
                                                            date: DateFormat(
                                                                    'dd-MM-yyyy – kk:mm')
                                                                .format(DateTime
                                                                    .now()));
                                                        //tim toi binh luan da dang voi id
                                                        int num =
                                                            await recipeProvider
                                                                .updateReview(
                                                                    review);
                                                        recipeProvider.init;
                                                        if (num == 1) {
                                                          var snackBar = SnackBar(
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          1),
                                                              content: Text(
                                                                  "Chỉnh sửa bình luận thành công!"));
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  snackBar);
                                                        } else {
                                                          var snackBar = SnackBar(
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          1),
                                                              content: Text(
                                                                  "Đã xảy ra lỗi! Vui lòng thử lại!"));
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  snackBar);
                                                        }
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('Chỉnh sửa'),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            AppColor.primary,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        );
                                      });
                                },
                                child: Text(
                                  "Chỉnh sửa",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                style:
                                    TextButton.styleFrom(primary: Colors.black),
                              ),
                            ),
                            Container(
                              child: TextButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 60,
                                            color: Colors.white,
                                            alignment: Alignment.center,
                                            child: Text(
                                                "Bạn muốn xoá bình luận này?"),
                                          ),
                                          actions: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('Huỷ'),
                                                      style:
                                                          TextButton.styleFrom(
                                                        primary:
                                                            Colors.grey[600],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    child: ElevatedButton(
                                                      onPressed: () async {
                                                        var review = Review(
                                                            id: widget.data.id
                                                                as String,
                                                            foodId: widget
                                                                .data.foodId,
                                                            type: widget
                                                                .data.type,
                                                            username: getUser
                                                                .username,
                                                            review: _controller
                                                                .text,
                                                            date: DateFormat(
                                                                    'dd-MM-yyyy – kk:mm')
                                                                .format(DateTime
                                                                    .now()));
                                                        bool num =
                                                            await recipeProvider
                                                                .delete(review);
                                                        // await recipeProvider
                                                        //     .init();
                                                        if (num == true) {
                                                          var snackBar = SnackBar(
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          1),
                                                              content: Text(
                                                                  "Đã xoá bình luận!"));
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  snackBar);
                                                          Navigator.of(context)
                                                              .pop();
                                                        } else {
                                                          var snackBar = SnackBar(
                                                              content: Text(
                                                                  "Đã xảy ra lỗi! Vui lòng thử lại!"),
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          1));
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  snackBar);
                                                        }
                                                      },
                                                      child: Text('Đồng ý'),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            AppColor.primary,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        );
                                      });
                                },
                                child: Text(
                                  "Xoá",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                style:
                                    TextButton.styleFrom(primary: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ]),
        );
      });
    }
  }
}
