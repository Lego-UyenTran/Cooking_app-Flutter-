import 'package:cooking_app/providers/recipe_provider.dart';
import 'package:cooking_app/screens/login_page.dart';
import 'package:cooking_app/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomPage extends StatefulWidget {
  const WelcomPage({super.key});

  @override
  State<WelcomPage> createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
    recipeProvider.init();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/image3.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              // absolute
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 60 / 100,
                child: Column(
                  //-> cha - co the space between
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //item
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: Text(
                            "Hungry?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                fontFamily: "inter"),
                          ),
                        ),
                        Text("Help you when you-re hungry",
                            style: TextStyle(color: Colors.white))
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Get started
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: ElevatedButton(
                            child: Text("Get started",
                                style: TextStyle(
                                    color: Color(0xFFEDE5CC),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'inter')),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              primary: Color(0xFF0B5551),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        //Login button
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            child: OutlinedButton(
                              child: Text(
                                "Login",
                                style: TextStyle(color: Color(0xFFEDE5CC)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: BorderSide(color: Colors.grey, width: 1),
                                primary: Colors.white, // màu hiển thị khi hover
                              ),
                            )),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            "Flutter app",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

//outline btn: https://www.flutterbeads.com/change-outlined-button-color-in-flutter/#:~:text=To%20change%20the%20Outlined%20Button,to%20change%20the%20text%20color.