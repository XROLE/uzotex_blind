import 'package:flutter/material.dart';
import 'package:uzotex_blind/service/app-colors.dart';

Widget backButton(context) {
  return Container(
    child: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Color(
            AppColor.secondaryColor(),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        }),
  );
}
