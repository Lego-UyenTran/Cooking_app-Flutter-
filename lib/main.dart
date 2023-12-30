import 'package:cooking_app/app_scroll.dart';
import 'package:cooking_app/common/recipe_detail_page.dart';
import 'package:cooking_app/providers/recipe_provider.dart';
import 'package:cooking_app/providers/user_provider.dart';
import 'package:cooking_app/utils/route_name.dart';
import 'package:flutter/material.dart';
import 'package:cooking_app/screens/welcom_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => RecipeProvider()),
      ],
      child: MaterialApp(
        scrollBehavior: AppScrollBehavior(),
        home: WelcomPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
