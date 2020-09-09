import 'package:flutter/material.dart';

import '../service/app-colors.dart';

class PageViewIndicator {
  static indicator(int pageCount, int currentPage) {
    List<Container> indicatorAvater = [];
    for (var i = 0; i < pageCount; i++) {
      indicatorAvater.add(
        Container(
          height: 12,
          width: 12,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: currentPage == i ? Color(AppColor.primaryColor()) : null,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(style: BorderStyle.solid),
          ),
          child: Text('  '),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicatorAvater,
    );
  }
}
