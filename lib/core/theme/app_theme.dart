import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppThem {
  static ThemeData getTheme(ColorScheme colorScheme) {
    return ThemeData(
      textTheme: TextTheme(
        bodyLarge: TextStyle(fontSize: 16, color: colorScheme.secondary),
        bodyMedium: TextStyle(fontSize: 14, color: colorScheme.secondary),
        bodySmall: TextStyle(fontSize: 12, color: colorScheme.secondary),
        titleLarge: TextStyle(fontSize: 20, color: colorScheme.secondary),
        titleMedium: TextStyle(fontSize: 18, color: colorScheme.secondary),
        titleSmall: TextStyle(fontSize: 16, color: colorScheme.secondary),
      ),
      appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(fontSize: 30, color: AppColors.black),
      ),
      colorScheme: colorScheme,
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: const TextStyle(fontSize: 12, color: AppColors.lightGray),
        labelStyle: const TextTheme(
          bodyMedium: TextStyle(color: AppColors.gray, fontSize: 14),
        ).bodyMedium,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.gray),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.gray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.gray),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: colorScheme.error),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(AppColors.blue),
          elevation: const WidgetStatePropertyAll(0),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.transparent, width: 1.5),
            ),
          ),
          textStyle: const WidgetStatePropertyAll(
            TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          foregroundColor: const WidgetStatePropertyAll(AppColors.white),
        ),
      ),
    );
  }

  static ThemeData ligtScheme = getTheme(
    const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.blue,
      onPrimary: AppColors.white,
      secondary: AppColors.black,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.blue,
    ),
  );
}
