import 'package:bookia/core/constants/app_constants.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      fontFamily: AppConstants.fontFamily,
      scaffoldBackgroundColor: AppColors.whiteColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.darkColor,
          fontSize: 18,
        ),
        iconTheme: IconThemeData(color: AppColors.primaryColor),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        onSurface: AppColors.darkColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: getSmallTextStyle(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
      ));

  static ThemeData darkTheme = ThemeData(
      fontFamily: AppConstants.fontFamily,
      scaffoldBackgroundColor: AppColors.darkColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkColor,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 18,
        ),
        iconTheme: IconThemeData(color: AppColors.primaryColor),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        onSurface: AppColors.whiteColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: getSmallTextStyle(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
      ));
}
