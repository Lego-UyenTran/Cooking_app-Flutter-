import 'dart:io';
import 'package:cooking_app/models/User.dart';
import 'package:cooking_app/models/recipe.dart';
import 'package:cooking_app/storages/book_mark_storage.dart';
import 'package:cooking_app/storages/feature_recipe_storage.dart';
import 'package:cooking_app/storages/new_posted_storage.dart';
import 'package:cooking_app/storages/popular_storage.dart';
import 'package:cooking_app/storages/recomment_storage.dart';
import 'package:cooking_app/storages/user_storage.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User user = User();

  List<User> list = [];
  List<int> listNotificationsId = [];
  UserStorage userStorage = UserStorage();

  List<Recipe> listFeatureRecipe = [];
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

  Future init() async {
    list = await userStorage.read();
    notifyListeners();
  }

  Future<int> CheckRegister(User item) async {
    list = await userStorage.read();
    int number = 0;
    for (int i = 0; i < list.length; i++) {
      if (item.username == list[i].username) {
        number = -1;
      } else if (item.email == list[i].email) {
        number = -2;
      }
    }

    notifyListeners();
    return number;
  }

  Future<int> CheckForLogin(User item) async {
    list = await userStorage.read();
    int number = 0;
    for (int i = 0; i < list.length; i++) {
      if (item.username == list[i].username &&
          item.password == list[i].password) {
        number = 1;
      }
    }

    notifyListeners();
    return number;
  }

  Future<int> CheckPassword(String id, String password) async {
    list = await userStorage.read();
    int number = 0;
    for (int i = 0; i < list.length; i++) {
      if (id == list[i].id && password == list[i].password) {
        number = 1;
      }
    }

    notifyListeners();
    return number;
  }

  Future<int> ChangePassword(String id, String password) async {
    list = await userStorage.read();
    int number = 0;
    for (int i = 0; i < list.length; i++) {
      if (id == list[i].id) {
        list[i].password = password;
        await userStorage.write(list);
        notifyListeners();
        number = 1;
      }
    }

    return number;
  }

  Future<User> getUser(User item) async {
    list = await userStorage.read();

    User temp = User();
    for (int i = 0; i < list.length; i++) {
      if (item.username == list[i].username &&
          item.password == list[i].password) {
        User temp2 = User(
          id: list[i].id,
          full_name: list[i].full_name,
          email: list[i].email,
          username: list[i].username,
          password: list[i].password,
          image: list[i].image,
          date: list[i].date,
        );
        temp = temp2;
        break;
      }
    }

    notifyListeners();
    return temp;
  }

  Future<User> getUserById(String id) async {
    list = await userStorage.read();
    User temp = User();
    for (int i = 0; i < list.length; i++) {
      if (id == list[i].id) {
        User temp2 = User(
            id: list[i].id,
            full_name: list[i].full_name,
            email: list[i].email,
            username: list[i].username,
            password: list[i].password,
            date: list[i].date,
            image: list[i].image);
        temp = temp2;
        break;
      }
    }

    notifyListeners();
    return temp;
  }

  Future<File> add(User item) async {
    list.add(item);
    notifyListeners();
    return userStorage.write(list);
  }

//update lai username tai nhung noi da cmt
  Future<void> updateForRecipe(
      List<Recipe> listR, String index, String username, String key) async {
    for (int i = 0; i < listR.length; i++) {
      for (int j = 0; j < listR[i].reviews.length; j++) {
        if (listR[i].reviews[j].userId.toString() == index) {
          Review temp = Review(
              id: listR[i].reviews[j].id,
              username: username,
              userId: index,
              review: listR[i].reviews[j].review,
              date: listR[i].reviews[j].date,
              type: listR[i].reviews[j].type,
              foodId: listR[i].reviews[j].foodId);

          listR[i].reviews[j] = temp;
          if (key.contains("featureRecipe")) {
            featureRecipeStorage.write(listR);
          } else if (key.contains("recomment")) {
            recommentStorage.write(listR);
          } else if (key.contains("newposted")) {
            newPostedStorage.write(listR);
          } else if (key.contains("popular")) {
            popularStorage.write(listR);
          }
          notifyListeners();
        }
      }
    }
  }

  Future<int> update(User item) async {
    int temp = 0;
    listFeatureRecipe = await featureRecipeStorage.read();
    listReview = await recommentStorage.read();
    listNewPosted = await newPostedStorage.read();
    listBookmark = await bookmarkStorage.read();
    listPopular = await popularStorage.read();

    for (int i = 0; i < list.length; i++) {
      if (list[i].id == item.id) {
        list[i] = item;
        // print("img nhan vao: " + item.image.toString());
        userStorage.write(list);
        temp = 1;
        updateForRecipe(listFeatureRecipe, item.id.toString(),
            item.username.toString(), "featureRecipe");
        updateForRecipe(listReview, item.id.toString(),
            item.username.toString(), "recomment");
        updateForRecipe(listNewPosted, item.id.toString(),
            item.username.toString(), "newposted");
        updateForRecipe(listPopular, item.id.toString(),
            item.username.toString(), "popular");
      }
    }
    notifyListeners();

    return temp;
  }

  Future<int> uploadImage(String url, String userId) async {
    int num = 0;
    for (var i in list) {
      if (i.id == userId) {
        i.image = url;
        userStorage.write(list);
        notifyListeners();
        return 1;
      }
    }
    return num;
  }

  Future<bool> delete(User item) async {
    bool result = list.remove(item);
    notifyListeners();
    await userStorage.write(list);
    return result;
  }
}
