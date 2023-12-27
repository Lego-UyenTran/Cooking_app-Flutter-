import 'dart:convert';
import 'package:cooking_app/models/recipe.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FeatureRecipeStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    // print("path: " + path.toString());
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
      final str = await file.readAsString();
      if (str.isNotEmpty) {
        var jsonObject = jsonDecode(str);
        var newListObject = jsonObject as List;
        list = newListObject.map((e) {
          return Recipe.fromJson(e);
        }).toList();
      }
      return list;
    } catch (e) {
      print(e);
      // If encountering an error, return 0
      return [];
    }
  }
}
