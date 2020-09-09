import 'package:flutter/material.dart';
import 'package:uzotex_blind/service/responsive-height-width.dart';

Row secondaryLogo(context) {
  return Row(
    children: [
      Container(
        height: ResponsiveHeigthAndWidth.getHeigth(0.05, 0.07, context),
        child: Image(
          image: AssetImage(
            'assets/images/uzotex_logo.png',
          ),
        ),
      ),
      SizedBox(
        width: 5,
      ),
      Text(
        'Uzotex',
        style: TextStyle(
          fontSize: ResponsiveHeigthAndWidth.getHeigth(0.028, 0.045, context),
          fontWeight: FontWeight.bold,
          letterSpacing: 5,
        ),
      ),
    ],
  );
}
