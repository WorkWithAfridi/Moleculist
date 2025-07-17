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

  // Primary
  Color primary = const Color(0xFF00157F);

  // Text colors
  Color textHeadingLight = const Color(0xFF000000);
  Color textHeadingDark = const Color(0xFFFFFFFF);

  Color textTitleLight = const Color(0xFF262626);
  Color textTitleDark = const Color(0xFFE4E3E5);

  Color textBodyLight = const Color(0xFF5B5B5C);
  Color textBodyDark = const Color(0xFFA7A7A8);

  Color placeholderLight = const Color(0xFF7F7E80);
  Color placeholderDark = const Color(0xFF7F7E80);

  Color textPrimaryButtonLight = const Color(0xFFFFFFFF);
  Color textPrimaryButtonDark = const Color(0xFFFFFFFF);

  // UI Elements
  Color borderLight = const Color(0xFFD0CFD1);
  Color borderDark = const Color(0xFF383838);

  Color cardLight = const Color(0xFFEEEDF0);
  Color cardDark = const Color(0xFF262626);

  Color backgroundLight = const Color(0xFFFFFFFF);
  Color backgroundDark = const Color(0xFF000000);

  // Status colors
  Color success = const Color(0xFF0CF292);
  Color warning = const Color(0xFFF2920C);
  Color danger = const Color(0xFFF20C0C);

  // Old preset colors (still retained if used elsewhere)
  Color cD3DAE0 = const Color(0xFFD3DAE0);
  CustomColor primarySwatch = CustomColor(
    c950: 0xFF000A40,
    c900: 0xFF000D4C,
    c800: 0xFF000F59,
    c700: 0xFF001166,
    c600: 0xFF001372,
    c500: 0xFF00157F, // Base
    c400: 0xFF00178C,
    c300: 0xFF001998,
    c200: 0xFF001BA5,
    c100: 0xFF001DB2,
    c50: 0xFF0020BE,
  );
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
  Color cD7DEE4 = const Color(0xFFD7DEE4);
  Color c788591 = const Color(0xFF788591);
  Color cF82A2A = const Color(0xFFF82A2A);
  Color cDFE2E6 = const Color(0xFFDFE2E6);
  Color cEEF0FE = const Color(0xFFEEF0FE);
  Color cF4E8FC = const Color(0xFFF4E8FC);
  Color cFFF3EA = const Color(0xFFFFF3EA);
  Color cF8802A = const Color(0xFFF8802A);
  Color cA52AF8 = const Color(0xFFA52AF8);
  Color cEDF0FF = const Color(0xFF4253EC);
  Color c00157F = const Color(0xFF00157F);
  Color cF8F7FA = const Color(0xFFF8F7FA);
  Color c5B5B5C = const Color(0xFF5B5B5C);
  Color cE0FDB3 = const Color(0xFFE0FDB3);
  Color cC8F681 = const Color(0xFFC8F681);
  Color cFFFAB4 = const Color(0xFFFFFAB4);
  Color cFFF566 = const Color(0xFFFFF566);
  Color cE6EAFF = const Color(0xFFE6EAFF);
  Color cDFFFB2 = const Color(0xFFDFFFB2);
}
