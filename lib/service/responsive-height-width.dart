import 'package:flutter/material.dart';

MediaQueryData queryData;

class ResponsiveHeigthAndWidth {
  static double getHeigth(double portraitHeightMultiplier, landScapeHeightMultiplier, context) {
    queryData = MediaQuery.of(context);
    if(queryData.orientation.toString() == 'Orientation.portrait') {
      return queryData.size.height * portraitHeightMultiplier;
    } else {
      return queryData.size.height * landScapeHeightMultiplier;
    }
  }
}
