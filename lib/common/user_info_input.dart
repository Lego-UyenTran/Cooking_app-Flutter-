import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/material.dart';

class UserInfoInput extends StatelessWidget {
  final String label, value;
  final EdgeInsetsGeometry? margin, padding;
  final Color? valueBackground;
  UserInfoInput(
      {required this.label,
      required this.value,
      this.padding,
      this.margin,
      this.valueBackground});
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = value;
    String content = "";
    return Container(
      margin: margin,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('$label',
                style: TextStyle(color: AppColor.primary, fontSize: 12)),
          ),
          Container(
            margin: EdgeInsets.only(top: 6),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            color: valueBackground ?? AppColor.primaryExtraSoft,
            child: TextFormField(
                controller: _controller,
                // value:
                // controller: content as TextEditingController,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'inter')),
          ),
        ],
      ),
    );
  }
}
