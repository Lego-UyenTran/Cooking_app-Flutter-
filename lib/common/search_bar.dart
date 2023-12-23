import 'package:cooking_app/icons/app_icons.dart';
import 'package:cooking_app/icons/fire_icon.dart';
import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/material.dart';

class SearchBarCustom extends StatelessWidget {
  final VoidCallback? routeTo;
  SearchBarCustom({super.key, this.routeTo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: routeTo,
      child: Container(
        margin: EdgeInsets.only(top: 8),
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side - Search Box
            Expanded(
              child: Container(
                height: 42,
                margin: EdgeInsets.only(right: 15),
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.primarySoft),
                child: Row(
                  children: [
                    Icon(
                      FireIcon.search,
                      color: AppColor.secondary,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        'What do you want to eat?',
                        style: TextStyle(color: Colors.white.withOpacity(0.3)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Right side - filter button
            Container(
                width: 40,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.secondary,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(
                      FireIcon.switch_icon,
                      color: Colors.black,
                      size: 20.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
