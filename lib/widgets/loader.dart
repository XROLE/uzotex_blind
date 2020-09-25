import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Container loader( dynamic color, double size) {
  return Container(
    child: SpinKitRipple(
      color: color,
      size: size,
    ),
  );
}
