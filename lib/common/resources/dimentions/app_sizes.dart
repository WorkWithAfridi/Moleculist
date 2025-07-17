import 'package:flutter/material.dart';

class AppSizes {
  // Radius values
  static const double radiusNone = 0;
  static const double radiusXxs = 2;
  static const double radiusXs = 4;
  static const double radiusSm = 6;
  static const double radiusMd = 8;
  static const double radiusLg = 10;
  static const double radiusXl = 12;
  static const double radius2xl = 16;
  static const double radius3xl = 20;
  static const double radius4xl = 24;
  static const double radius5xl = 32;
  static const double radiusFull = 9999;

  // Padding
  static const double paddingLarge = 24.0;
  static const double paddingDefault = 16;
}

// Utility functions
double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
