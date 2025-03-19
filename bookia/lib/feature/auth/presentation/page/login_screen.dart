import 'package:bookia/core/extentions/extenstions.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/feature/auth/data/models/request/auth_params.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_states.dart';
import 'package:bookia/feature/auth/presentation/page/register_screen.dart';
import 'package:bookia/feature/auth/presentation/widgets/back_arrow_widget.dart';
import 'package:bookia/feature/auth/presentation/widgets/social_login.dart';
import 'package:bookia/feature/main/main_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
      body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              context.pushAndRemoveUntil(const MainAppScreen());
            } else if (state is AuthErrorState) {
              Navigator.pop(context);
              showErrorToast(context, state.error);
            } else if (state is AuthLoadingState) {
              showLoadingDialog(context);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(children: [
                  Text(
                    'Welcome back! Glad to see you, Again!',
                    style: getHeadLineTextStyle(context),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: emailController,
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
                    controller: passwordController,
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
                  CustomButton(
                      text: 'Login',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(AuthParams(
                                email: emailController.text,
                                password: passwordController.text,
                              ));
                        }
                      }),
                  const SizedBox(height: 35),
                  const SocialLogin(),
                ]),
              ),
            ),
          )),
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
