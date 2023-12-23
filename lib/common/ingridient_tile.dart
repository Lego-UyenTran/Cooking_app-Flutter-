import 'package:cooking_app/models/recipe.dart';
import 'package:flutter/material.dart';

//Nguyen lieu - hien thi thong tin nguyen lieu
class IngridientTile extends StatelessWidget {
  final Ingridient data;
  IngridientTile({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade300, width: 0.7))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 9,
              child: Text(
                data.name as String,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              )),
          Flexible(
              flex: 3,
              child: Text(
                data.size as String,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ))
        ],
      ),
    );
  }
}
