import 'package:flutter/material.dart';

import '../color/app_colors.dart';
import 'app_font.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors().pastelLavender,
    scaffoldBackgroundColor: AppColors().pastelBackground,
    appBarTheme: AppBarTheme(
      color: AppColors().pastelLavender,
      foregroundColor: AppColors().black,
      iconTheme: IconThemeData(color: AppColors().black),
      toolbarTextStyle: TextTheme(titleLarge: TextStyle(color: AppColors().black, fontSize: 20)).bodyMedium,
      titleTextStyle: TextTheme(titleLarge: TextStyle(color: AppColors().black, fontSize: 20)).titleLarge,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    dividerColor: AppColors().cD7DEE4,
    dividerTheme: DividerThemeData(color: AppColors().cD7DEE4),
    drawerTheme: DrawerThemeData(backgroundColor: AppColors().pastelBackground, surfaceTintColor: AppColors().pastelBackground),
    textTheme: _buildTextTheme(lightMode: true),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors().pastelMint, primary: AppColors().pastelLavender),
    iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(foregroundColor: AppColors().black)),
    iconTheme: IconThemeData(color: AppColors().black),
    cardColor: AppColors().pastelViolet,
  );

  static final darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppColors().pastelViolet,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      color: AppColors().pastelViolet,
      iconTheme: IconThemeData(color: Colors.white),
      toolbarTextStyle: TextTheme(titleLarge: TextStyle(color: Colors.white, fontSize: 20)).bodyMedium,
      titleTextStyle: TextTheme(titleLarge: TextStyle(color: Colors.white, fontSize: 20)).titleLarge,
    ),
    dividerColor: Colors.grey[700],
    textTheme: _buildTextTheme(lightMode: false),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors().pastelMint, primary: AppColors().pastelViolet),
    cardColor: Colors.grey[850],
  );

  static TextTheme _buildTextTheme({required bool lightMode}) {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: lightMode ? AppColors().black : Colors.white,
        fontFamily: AppFonts.fontFamilyInter,
      ),
      displayMedium: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: lightMode ? AppColors().black : Colors.white,
        fontFamily: AppFonts.fontFamilyInter,
      ),
      displaySmall: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w400,
        color: lightMode ? AppColors().black : Colors.white,
        fontFamily: AppFonts.fontFamilyInter,
      ),
      headlineMedium: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: lightMode ? AppColors().black : Colors.white,
        fontFamily: AppFonts.fontFamilyInter,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: lightMode ? AppColors().black : Colors.white,
        fontFamily: AppFonts.fontFamilyInter,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: lightMode ? AppColors().black : Colors.white,
        fontFamily: AppFonts.fontFamilyInter,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: lightMode ? AppColors().black : Colors.white,
        fontFamily: AppFonts.fontFamilyInter,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: lightMode ? AppColors().black : Colors.white,
        fontFamily: AppFonts.fontFamilyInter,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: lightMode ? AppColors().black : Colors.white,
        fontFamily: AppFonts.fontFamilyInter,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: lightMode ? AppColors().black : Colors.white,
        fontFamily: AppFonts.fontFamilyInter,
      ),
      labelLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25, color: Colors.white, fontFamily: AppFonts.fontFamilyInter),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: lightMode ? AppColors().black : Colors.white,
        fontFamily: AppFonts.fontFamilyInter,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: lightMode ? AppColors().black : Colors.white,
        fontFamily: AppFonts.fontFamilyInter,
      ),
    );
  }
}
