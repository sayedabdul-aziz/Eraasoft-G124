import 'package:bookia/core/constants/assets_manager.dart';
import 'package:bookia/core/extentions/extenstions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/feature/auth/presentation/page/login_screen.dart';
import 'package:bookia/feature/auth/presentation/page/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // image
          Image.asset(
            'assets/images/welcome_bg.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 0,
            left: 22,
            right: 22,
            bottom: 0,
            child: Column(
              children: [
                const Spacer(flex: 2),
                SvgPicture.asset(
                  AssetsManager.logoSvg,
                  width: 200,
                ),
                const SizedBox(height: 10),
                Text(
                  "Order Your Book Now!",
                  style: getBodyTextStyle(context),
                ),
                const Spacer(flex: 4),
                CustomButton(
                    text: 'Login',
                    onPressed: () {
                      context.pushTo(const LoginScreen());
                    }),
                const SizedBox(height: 10),
                CustomButton(
                    text: 'Register',
                    hasBorder: true,
                    bgColor: AppColors.whiteColor,
                    fgColor: AppColors.darkColor,
                    onPressed: () {
                      context.pushTo(const RegisterScreen());
                    }),
                const Spacer(flex: 1),
              ],
            ),
          )
        ],
      ),
    );
  }
}
