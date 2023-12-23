import 'package:cooking_app/common/ingridient_tile.dart';
import 'package:cooking_app/common/review.dart';
import 'package:cooking_app/common/tutorial_step_tile.dart';
import 'package:cooking_app/common/varianble.dart';
import 'package:cooking_app/icons/fire_icon.dart';
import 'package:cooking_app/common/full_screen_image.dart';
import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/providers/recipe_provider.dart';
import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class RecipeDetailPage extends StatefulWidget {
  final Recipe data;
  RecipeDetailPage({required this.data});

  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage>
    with TickerProviderStateMixin {
  //tab controler: dong hoa du lieu giua tab duoc chon va noi dung
  late TabController _tabController;
  late ScrollController _scrollController;

  //tao 1 tabbar voi 3 phan: cong thuc, huong dan, danh gia
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController(
        initialScrollOffset: 0.0); //thanh cuon - gia tri khoi tao = 0
    _scrollController.addListener(() {
      changeAppBarColor(_scrollController);
    });

    var recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
    recipeProvider.init();
  }

  String comment = "";
  Color appBarColor = Colors.transparent;

  changeAppBarColor(ScrollController scrollController) {
    if (scrollController.position.hasPixels) {
      if (scrollController.position.pixels > 2.0) {
        setState(() {
          appBarColor = AppColor.primary;
        });
      }
      if (scrollController.position.pixels <= 2.0) {
        setState(() {
          appBarColor = Colors.transparent;
        });
      }
    } else {
      setState(() {
        appBarColor = Colors.transparent;
      });
    }
  }

  // viet review
  showFAB(TabController tabController) {
    int reviewTabIndex = 2;
    if (tabController.index == reviewTabIndex) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var uuid = Uuid();
    return Consumer<RecipeProvider>(builder: (context, data2, _) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AnimatedContainer(
            color: appBarColor,
            duration: Duration(milliseconds: 200),
            child: AppBar(
              backgroundColor: Colors.transparent,
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
              elevation: 0,
              centerTitle: true,
              title: Text('Công thức',
                  style: TextStyle(
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 16)),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              actions: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FireIcon.bookmark_empty,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Post Review
        floatingActionButton: Visibility(
          visible: showFAB(_tabController),
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        color: Colors.white,
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          minLines: 6,
                          decoration: InputDecoration(
                            hintText: 'Viết đánh giá...',
                          ),
                          maxLines: null,
                          onChanged: ((value) => {
                                setState(() {
                                  comment = value;
                                })
                              }),
                        ),
                      ),
                      actions: [
                        Row(
                          children: [
                            Container(
                              width: 120,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Huỷ'),
                                style: TextButton.styleFrom(
                                  primary: Colors.grey[600],
                                ),
                              ),
                            ),
                            // Expanded là một widget giúp mở rộng không gian cho một widget con của Row hoặc Column theo trục chính
                            Expanded(
                              child: Container(
                                child: ElevatedButton(
                                  //todo
                                  onPressed: () async {
                                    var review = Review(
                                        foodId: widget.data.title,
                                        type: widget.data.type,
                                        id: uuid.v4(),
                                        username: getUser.username,
                                        userId: getUser.id,
                                        review: comment,
                                        date: DateFormat('dd-MM-yyyy – kk:mm')
                                            .format(DateTime.now()));
                                    int num = await data2.addReview(review);
                                    Navigator.of(context).pop();
                                    setState(() {});
                                  },
                                  child: Text('Đăng'),
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColor.primary,
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
            //Icon edit -> Viet danh gia
            child: Icon(Icons.edit),
            backgroundColor: AppColor.primary,
          ),
        ),
        body: ListView(
          controller: _scrollController,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          children: [
            // Section 1 - Recipe Image
            GestureDetector(
              //todo
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                        image: Image.asset(widget.data.photo as String,
                            fit: BoxFit.cover))));
              },
              child: Container(
                height: 280,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.data.photo as String),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(gradient: AppColor.linearBlackTop),
                  height: 280,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            // Section 2 - Recipe Info
            Container(
              width: MediaQuery.of(context).size.width,
              padding:
                  EdgeInsets.only(top: 20, bottom: 30, left: 16, right: 16),
              color: AppColor.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Recipe Calories and Time
                  Row(
                    children: [
                      Icon(
                        FireIcon.fire,
                        size: 14,
                        color: Colors.white,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          widget.data.calories as String,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.alarm, size: 16, color: Colors.white),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          widget.data.time as String,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  // Recipe Title
                  Container(
                    margin: EdgeInsets.only(bottom: 12, top: 16),
                    child: Text(
                      widget.data.title as String,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter'),
                    ),
                  ),
                  // Recipe Description
                  Text(
                    widget.data.description as String,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                        height: 150 / 100),
                  ),
                ],
              ),
            ),
            // Tabbar ( Ingridients, Tutorial, Reviews )
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: AppColor.secondary,
              child: TabBar(
                controller: _tabController,
                onTap: (index) {
                  setState(() {
                    _tabController.index = index;
                  });
                },
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black.withOpacity(0.6),
                labelStyle:
                    TextStyle(fontFamily: 'inter', fontWeight: FontWeight.w500),
                indicatorColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Thành phần',
                  ),
                  Tab(
                    text: 'Hướng dẫn',
                  ),
                  Tab(
                    text: 'Đánh giá',
                  ),
                ],
              ),
            ),
            // IndexedStack based on TabBar index
            IndexedStack(
              index: _tabController.index,
              children: [
                // Ingridients
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: widget.data.ingridients!.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return IngridientTile(
                      data: widget.data.ingridients![index],
                    );
                  },
                ),
                // Tutorials
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: widget.data.tutorial!.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return StepTile(
                      data: widget.data.tutorial![index],
                    );
                  },
                ),
                // Reviews
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: widget.data.reviews!.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ReviewTile(data: widget.data.reviews![index]);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
