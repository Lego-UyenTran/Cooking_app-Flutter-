import 'dart:convert';
import 'package:cooking_app/models/recipe.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FeatureRecipeStorage {
  Future<String> get _localPath async {
    final directory =
        await getApplicationDocumentsDirectory(); //lay duong dan hien tai cua ung dung(web/ dthoai)

    return directory.path;
  }

  //lay path hien tai + ten file json
  Future<File> get _localFile async {
    //get local file
    final path = await _localPath;
    return File('$path/Recipe.json');
  }

  //ghi vao 1 danh sach vao
  Future<File> write(List<Recipe> list) async {
    final file = await _localFile;
    String json = jsonEncode(list);
    return file.writeAsString(json);
  }

  //lay 1 danh sach ra
  Future<List<Recipe>> read() async {
    try {
      List<Recipe> list = [];
      final file = await _localFile;
      // Read the file
      final str = await file.readAsString(); //doc file thanh cuoi string
      if (str.isNotEmpty) {
        var jsonObject =
            jsonDecode(str); //decode: giai ma String thanh jsonbject
        var newListObject =
            jsonObject as List; //jsonObject -> chuyen thanh list
        list = newListObject.map((e) {
          return Recipe.fromJson(e); //chuyen map(e) thanh user(user tu map)
        }).toList(); //chuyen ve thanh list
      }
      return list;
    } catch (e) {
      print(e);
      // If encountering an error, return 0
      return [];
    }
  }
}
