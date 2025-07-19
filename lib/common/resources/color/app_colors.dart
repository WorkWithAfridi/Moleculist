import 'package:flutter/material.dart';

import 'models/custom_color_m.dart';

class AppColors {
  // Singleton instance
  static final AppColors _instance = AppColors._internal();

  // Private constructor
  AppColors._internal();

  // Factory constructor
  factory AppColors() => _instance;

  // Core colors
  Color white = const Color(0xFFFFFFFF);
  Color black = const Color(0xFF1A1A1A);

  // New Primary (Lavender)
  Color primary = const Color(0xFFD1C4E9);

  // Accent / Secondary
  Color secondary = const Color(0xFFB39DDB); // Soft violet

  // Supporting Colors
  Color mint = const Color(0xFFC8E6C9);
  Color peach = const Color(0xFFFFECB3);
  Color pastelBackground = const Color(0xFFF5F5F5);
  Color softGrey = const Color(0xFFE0E0E0);

  // Text colors
  Color textHeadingLight = const Color(0xFF000000);
  Color textHeadingDark = const Color(0xFFFFFFFF);

  Color textTitleLight = const Color(0xFF262626);
  Color textTitleDark = const Color(0xFFE4E3E5);

  Color textBodyLight = const Color(0xFF5B5B5C);
  Color textBodyDark = const Color(0xFFA7A7A8);

  Color placeholderLight = const Color(0xFF9E9E9E);
  Color placeholderDark = const Color(0xFFBDBDBD);

  Color textPrimaryButtonLight = const Color(0xFFFFFFFF);
  Color textPrimaryButtonDark = const Color(0xFFFFFFFF);

  // UI Elements
  Color borderLight = const Color(0xFFCCCCCC);
  Color borderDark = const Color(0xFF444444);

  Color cardLight = const Color(0xFFF3E5F5); // Light violet
  Color cardDark = const Color(0xFF262626);

  Color backgroundLight = const Color(0xFFF5F5F5); // Soft background
  Color backgroundDark = const Color(0xFF121212);

  // Status colors (unchanged)
  Color success = const Color(0xFF0CF292);
  Color warning = const Color(0xFFF2920C);
  Color danger = const Color(0xFFF20C0C);

  // Primary Swatch (based on lavender)
  CustomColor primarySwatch = CustomColor(
    c950: 0xFFB39DDB,
    c900: 0xFFBFADE0,
    c800: 0xFFCCBEE5,
    c700: 0xFFD1C4E9,
    c600: 0xFFD8CCED,
    c500: 0xFFDFD5F1,
    c400: 0xFFE5DDF5,
    c300: 0xFFEBE6F8,
    c200: 0xFFF1EEFB,
    c100: 0xFFF7F6FD,
    c50: 0xFFFCFBFF,
  );

  // Add to AppColors
  Color pastelLavender = const Color(0xFFD1C4E9);
  Color pastelViolet = const Color(0xFFB39DDB);
  Color pastelMint = const Color(0xFFC8E6C9);
  Color pastelPeach = const Color(0xFFFFECB3);
  Color cD7DEE4 = const Color(0xFFD7DEE4);
  Color cFEF9F3 = const Color(0xFFFEF9F3);
  Color cCAD0D6 = const Color(0xFFCAD0D6);
  Color c58636E = const Color(0xFF58636E);
  Color cF7F9FA = const Color(0xFFF7F9FA);
  Color cE9ECF0 = const Color(0xFFE9ECF0);
  Color cEEF1F4 = const Color(0xFFEEF1F4);
  Color cF6F7F9 = const Color(0xFFF6F7F9);
  Color cDB0D0D = const Color(0xFFDB0D0D);
  Color c64BE26 = const Color(0xFF64BE26);
  Color c6C7580 = const Color(0xFF6C7580);
  Color cE1E7F0 = const Color(0xFFE1E7F0);
  Color cF0F2F5 = const Color(0xFFF0F2F5);
  Color cDEE3E7 = const Color(0xFFDEE3E7);
  Color cA3ADB8 = const Color(0xFFA3ADB8);
  Color cD8DFE4 = const Color(0xFFD8DFE4);
  Color c788591 = const Color(0xFF788591);
  Color cF82A2A = const Color(0xFFF82A2A);
  Color cDFE2E6 = const Color(0xFFDFE2E6);
  Color cEEF0FE = const Color(0xFFEEF0FE);
  Color cF4E8FC = const Color(0xFFF4E8FC);
  Color cFFF3EA = const Color(0xFFFFF3EA);
  Color cF8802A = const Color(0xFFF8802A);
  Color cA52AF8 = const Color(0xFFA52AF8);
  Color cEDF0FF = const Color(0xFF4253EC);
}
