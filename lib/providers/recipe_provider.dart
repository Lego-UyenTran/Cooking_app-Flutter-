import 'dart:io';
import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/storages/book_mark_storage.dart';
import 'package:cooking_app/storages/feature_recipe_storage.dart';
import 'package:cooking_app/storages/new_posted_storage.dart';
import 'package:cooking_app/storages/popular_storage.dart';
import 'package:cooking_app/storages/recomment_storage.dart';
import 'package:flutter/material.dart';

class RecipeProvider extends ChangeNotifier {
  Recipe review = Recipe(reviews: [], ingridients: [], tutorial: []);

  List<Recipe> list = [];
  List<Recipe> listReview = [];
  List<Recipe> listNewPosted = [];
  List<Recipe> listPopular = [];
  List<Recipe> listBookmark = [];

  //tao bien thu 2
  FeatureRecipeStorage featureRecipeStorage = FeatureRecipeStorage();
  RecommentStorage recommentStorage = RecommentStorage();
  NewPostedStorage newPostedStorage = NewPostedStorage();
  BookmarkStorage bookmarkStorage = BookmarkStorage();
  PopularStorage popularStorage = PopularStorage();

  //recomment - populer is not here

  Future init() async {
    list = await featureRecipeStorage.read();
    listReview = await recommentStorage.read();
    listNewPosted = await newPostedStorage.read();
    listBookmark = await bookmarkStorage.read();
    listPopular = await popularStorage.read();

    notifyListeners();
  }

  Future<File> add(Recipe item) async {
    list.add(item);
    notifyListeners();
    return recommentStorage.write(list);
  }

  Future<List<Recipe>> searchInList(String key, List<Recipe> temp) async {
    List<Recipe> listResult = [];
    for (var i in temp) {
      if (i.title?.toLowerCase().contains(key) == true) {
        // print(i.title);
        listResult.add(i);
      }
    }

    return listResult;
  }

  Future<List<Recipe>> searchResult(String key) async {
    key = key.toLowerCase();
    List<Recipe> listResult = [];
    List<Recipe> listFeature2 = await searchInList(key, list);
    List<Recipe> listRecomment2 = await searchInList(key, listReview);
    List<Recipe> listPopular2 = await searchInList(key, listPopular);
    List<Recipe> listNewPosted2 = await searchInList(key, listNewPosted);

    listResult = [
      ...listFeature2,
      ...listRecomment2,
      ...listPopular2,
      ...listNewPosted2
    ];
    return listResult;
  }

  Future<int> addReview(Review item) async {
    //featuredRecipeCard; newposted
    String title = item.foodId as String; //get foodId
    String type = item.type as String;
    String id = item.id as String;
    String name = item.username as String;
    String cmt = item.review as String;
    String date = item.date as String;
    String userId = item.userId as String;

    Review temp = Review(
        id: id,
        username: name,
        userId: userId,
        review: cmt,
        date: date,
        type: type,
        foodId: title);

    if (type.contains("recomment")) {
      for (var i in listReview) {
        String getTitle = i.title as String;
        if (getTitle.contains(title)) {
          i.reviews.add(temp);
          recommentStorage.write(listReview);
          return 1;
        }
      }
    } else if (type.contains("featuredRecipeCard")) {
      for (var i in list) {
        String getTitle = i.title as String;
        if (getTitle.contains(title)) {
          i.reviews.add(temp);
          featureRecipeStorage.write(list);
          return 1;
        }
      }
    } else if (type.contains("newposted")) {
      for (var i in listNewPosted) {
        String getTitle = i.title as String;
        if (getTitle.contains(title)) {
          i.reviews.add(temp);
          newPostedStorage.write(listNewPosted);
          return 1;
        }
      }
    } else if (type.contains("popular")) {
      for (var i in listPopular) {
        String getTitle = i.title as String;
        if (getTitle.contains(title)) {
          i.reviews.add(temp); //da add vao list review duoc
          popularStorage.write(listPopular);
          return 1;
        }
      }
    }
    // list = await featureRecipeStorage.read();
    notifyListeners();
    return 0;
  }

  Future<int> updateReview(Review item) async {
    int num = 0;
    String id = item.id as String;
    String type = item.type as String;
    String foodId = item.foodId as String;
    String username = item.username as String;
    String review = item.review as String;
    String date = item.date as String;
    String userId = item.userId as String;

    Review temp = Review(
        id: id,
        username: username,
        userId: userId,
        review: review,
        date: date,
        type: type,
        foodId: foodId);

    if (type.contains("recomment")) {
      for (var i in listReview) {
        String getFoodId = i.title as String;
        if (getFoodId.contains(foodId)) {
          for (int j = 0; j < i.reviews.length; j++) {
            if (i.reviews[j].id.toString() == id) {
              i.reviews[j] = temp;
              recommentStorage.write(listReview);
              return 1;
            }
          }
        }
      }
    } else if (type.contains("featuredRecipeCard")) {
      for (var i in list) {
        String getFoodId = i.title as String;
        if (getFoodId.contains(foodId)) {
          for (int j = 0; j < i.reviews.length; j++) {
            if (i.reviews[j].id.toString() == id) {
              i.reviews[j] = temp;
              featureRecipeStorage.write(list);
              return 1;
            }
          }
        }
      }
    } else if (type.contains("newposted")) {
      for (var i in listNewPosted) {
        String getFoodId = i.title as String;
        if (getFoodId.contains(foodId)) {
          for (int j = 0; j < i.reviews.length; j++) {
            if (i.reviews[j].id.toString() == id) {
              i.reviews[j] = temp;
              newPostedStorage.write(listNewPosted);
              return 1;
            }
          }
        }
      }
    } else if (type.contains("popular")) {
      for (var i in listPopular) {
        String getFoodId = i.title as String;
        if (getFoodId.contains(foodId)) {
          for (int j = 0; j < i.reviews.length; j++) {
            if (i.reviews[j].id.toString() == id) {
              //tim kiem id cua bai viet
              i.reviews[j] = temp;
              popularStorage.write(listPopular);
              return 1;
            }
          }
        }
      }
    }

    notifyListeners();
    return num;
  }

  Future<bool> delete(Review item) async {
    bool result = false;
    String id = item.id as String;
    String type = item.type as String;
    String foodId = item.foodId as String;

    if (type.contains("recomment")) {
      for (var i in listReview) {
        String getFoodId = i.title as String;
        if (getFoodId.contains(foodId)) {
          for (int j = 0; j < i.reviews.length; j++) {
            if (i.reviews[j].id.toString() == id) {
              result = i.reviews.remove(i.reviews[j]);
              if (result == true) recommentStorage.write(listReview);
            }
          }
        }
      }
    } else if (type.contains("featuredRecipeCard")) {
      for (var i in list) {
        String getFoodId = i.title as String;
        if (getFoodId.contains(foodId)) {
          for (int j = 0; j < i.reviews.length; j++) {
            if (i.reviews[j].id.toString() == id) {
              result = i.reviews.remove(i.reviews[j]);
              if (result == true) featureRecipeStorage.write(list);
            }
          }
        }
      }
    } else if (type.contains("newposted")) {
      for (var i in listNewPosted) {
        String getFoodId = i.title as String;
        if (getFoodId.contains(foodId)) {
          for (int j = 0; j < i.reviews.length; j++) {
            if (i.reviews[j].id.toString() == id) {
              result = i.reviews.remove(i.reviews[j]);
              if (result == true) newPostedStorage.write(listNewPosted);
            }
          }
        }
      }
    } else if (type.contains("popular")) {
      for (var i in listPopular) {
        String getFoodId = i.title as String;
        if (getFoodId.contains(foodId)) {
          for (int j = 0; j < i.reviews.length; j++) {
            if (i.reviews[j].id.toString() == id) {
              result = i.reviews.remove(i.reviews[j]);
              if (result == true) popularStorage.write(listPopular);
            }
          }
        }
      }
    }

    notifyListeners();
    return result;
  }
}
