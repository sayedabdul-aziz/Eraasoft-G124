import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/extentions/extenstions.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/feature/upload/upload_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      context.pushReplacement(const UploadScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/images/logo.json",
              width: 200,
            ),
            const SizedBox(height: 10),
            Text(
              "Taskati",
              style: getTitleTextStyle(),
            ),
            const SizedBox(height: 10),
            Text(
              "Organize your tasks with ease",
              style: getSmallTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
