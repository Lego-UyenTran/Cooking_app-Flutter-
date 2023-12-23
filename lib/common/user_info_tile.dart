import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/material.dart';

class UserInfoTile extends StatelessWidget {
  final String label, value;
  final EdgeInsetsGeometry? margin, padding;
  final Color? valueBackground;
  UserInfoTile(
      {required this.label,
      required this.value,
      this.padding,
      this.margin,
      this.valueBackground});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text('$label',
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 6),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            // padding: EdgeInsets.only(top: 6, bottom: 6, right: 16, left: 16),
            color: valueBackground ?? AppColor.primaryExtraSoft,
            child: Text('$value',
                style: TextStyle(fontSize: 14, fontFamily: 'inter')),
          )
        ],
      ),
    );
  }
}
