import 'package:bookia/core/extentions/extenstions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/feature/auth/presentation/page/register_screen.dart';
import 'package:bookia/feature/auth/presentation/widgets/back_arrow_widget.dart';
import 'package:bookia/feature/auth/presentation/widgets/social_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            BackArrowWidget(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(children: [
            Text(
              'Welcome back! Glad to see you, Again!',
              style: getHeadLineTextStyle(context),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                } else if (!isEmailValid(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your password',
                suffixIconConstraints: const BoxConstraints(minWidth: 24),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SvgPicture.asset(
                    'assets/icons/eye.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 60),
            CustomButton(text: 'Login', onPressed: () {}),
            const SizedBox(height: 35),
            const SocialLogin(),
          ]),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: getSmallTextStyle(color: AppColors.darkColor),
            ),
            TextButton(
              onPressed: () {
                context.pushReplacement(const RegisterScreen());
              },
              child: Text(
                'Sign Up',
                style: getSmallTextStyle(color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
