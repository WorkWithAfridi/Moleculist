import 'package:flutter/material.dart';

class AppSizes {
  static const double paddingLarge = 24.0;
  static const double defaultPadding = 16;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
