// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'models/custom_color_m.dart';

class AppColors {
  // Singleton instance
  static final AppColors _instance = AppColors._internal();

  // Private constructor
  AppColors._internal();

  // Factory constructor to return the same instance
  factory AppColors() => _instance;

  // Default colors (these can be updated dynamically)
  Color white = const Color(0xFFFFFFFF);
  Color black = const Color(0xFF1A1A1A);

  Color cD3DAE0 = const Color(0xFFD3DAE0);
  CustomColor primary = CustomColor(
    c950: 0xff101860,
    c900: 0xff131C6E,
    c800: 0xff111B79,
    c700: 0xff232F9E,
    c600: 0xff3241D6,
    c500: 0xff4353ED,
    c400: 0xff6270EF,
    c300: 0xff909AF5,
    c200: 0xffB3BAF8,
    c100: 0xffDEE1FC,
    c50: 0xffEEF0FE,
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
}
