import 'package:flutter/material.dart';
import 'package:uzotex_blind/service/app-colors.dart';

InputDecoration decorateInpute(String text) {
  return InputDecoration(
    hintText: text,
    helperText: text,
    contentPadding: EdgeInsets.symmetric(vertical: 1.0),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(
          AppColor.secondaryColor(),
        ),
      ),
    ),
  );
}
