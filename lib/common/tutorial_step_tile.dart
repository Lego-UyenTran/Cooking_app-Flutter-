//Cac buoc nau an

import 'package:cooking_app/models/recipe.dart';
import 'package:flutter/material.dart';

class StepTile extends StatelessWidget {
  final TutorialStep data;
  StepTile({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Colors.grey.shade300, width: 0.7)),
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
                    data.step as String,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Text(data.description as String),
          ]),
    );
  }
}
