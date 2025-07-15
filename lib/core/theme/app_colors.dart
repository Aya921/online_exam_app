import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color white = Color(0xffF9F9F9);
  static const Color gray = Color(0xff535353);
  static const Color red = Color(0xffCC1010);
  static const Color green = Color(0xff11CE19);
  static const Color lightBlue = Color(0xffEDEFF3);
  static const Color lightGray = Color(0xffA6A6A6);
  static const Color lightRed = Color(0xffF8D2D2);
  static const Color lightGreen = Color(0xffCAF9CC);

  static const MaterialColor blue = MaterialColor(0xff02369C, {
    50: Color(0xFFCCD7EB),
    100: Color(0xFFABBcDE),
    200: Color(0xFF819BCE),
    300: Color(0xFF5679BD),
    400: Color(0xFF2C58AD),
    500: Color(0xFF02369C), // BASE
    600: Color(0xFF022D82),
    700: Color(0xFF012468),
    800: Color(0xFF011B4E),
    900: Color(0xFF011234),
    1000: Color(0xFF000B1F), // 100%
  });

  static const MaterialColor black = MaterialColor(0xFF0F0F0F, <int, Color>{
    50: Color(0xFFCFCFCF),
    100: Color(0xFFAFAFAF),
    200: Color(0xFF878787),
    300: Color(0xFF5F5F5F),
    400: Color(0xFF373737),
    500: Color(0xFF0F0F0F), // BASE
    600: Color(0xFF0D0D0D),
    700: Color(0xFF0A0A0A),
    800: Color(0xFF080808),
    900: Color(0xFF050505),
    1000: Color(0xFF030303), // 100%
  });
}
