import 'package:bookia/core/constants/app_constants.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/utils/themes.dart';
import 'package:bookia/feature/intro/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
          fontFamily: AppConstants.fontFamily,
          scaffoldBackgroundColor: AppColors.whiteColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.whiteColor,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            titleTextStyle: TextStyle(
              color: AppColors.darkColor,
              fontSize: 18,
            ),
            iconTheme: IconThemeData(color: AppColors.primaryColor),
          ),
          dividerTheme: const DividerThemeData(
            color: AppColors.borderColor,
            thickness: 1,
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryColor,
            onSurface: AppColors.darkColor,
          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: getSmallTextStyle(),
            fillColor: AppColors.accentColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.borderColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.redColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.redColor),
            ),
          )),
      darkTheme: AppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
