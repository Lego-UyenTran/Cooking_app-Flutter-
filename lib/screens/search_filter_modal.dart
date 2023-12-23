import 'package:cooking_app/utils/AppColor.dart';
import 'package:flutter/material.dart';

class SearchFilterModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6),
      child: Wrap(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                ),
                color: AppColor.primaryExtraSoft),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 60,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Reset', style: TextStyle(color: Colors.grey)),
                  ),
                ),
                Text(
                  'Sắp xếp',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'inter'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 60,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Huỷ', style: TextStyle(color: Colors.grey)),
                  ),
                ),
              ],
            ),
          ),

          //Sort by option
          Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.grey.shade300),
            )),
            child: ListTileTheme(
                selectedColor: AppColor.primary,
                textColor: Colors.grey,
                child: ListTile(
                  selected: true,
                  title: TextButton(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      alignment: Alignment.topLeft,
                      child: const Text('Bài viết mới',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16)),
                    ),
                    //todo
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColor.primary,
                    ),
                  ),
                )),
          ),

          // Sort By Option
          Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.grey.shade300),
            )),
            child: ListTileTheme(
                selectedColor: AppColor.primary,
                textColor: Colors.grey,
                child: ListTile(
                  selected: true,
                  title: TextButton(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      alignment: Alignment.topLeft,
                      child: const Text('Bài viết phổ biến',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16)),
                    ),
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: AppColor.primary,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
