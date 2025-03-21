import 'dart:developer';

import 'package:bookia/core/constants/assets_manager.dart';
import 'package:bookia/core/extentions/extenstions.dart';
import 'package:bookia/core/services/local_helper.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/intro/welcome_screen.dart';
import 'package:bookia/feature/main/main_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // AppLocalStorage.clearCachedData(AppLocalStorage.tokenKey);
    String? token = AppLocalStorage.getCachedData(AppLocalStorage.tokenKey);
    log(token.toString());
    Future.delayed(const Duration(seconds: 3), () {
      if (token != null) {
        context.pushReplacement(const MainAppScreen());
      } else {
        context.pushReplacement(const WelcomeScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsManager.logoSvg,
              width: 200,
            ),
            const SizedBox(height: 10),
            Text(
              "Order Your Book Now!",
              style: getBodyTextStyle(context),
            ),
          ],
        ),
      ),
    );
  }
}
