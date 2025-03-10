import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/extentions/extenstions.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/feature/profile/profile_screen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "hello, ${AppLocalStorage.getCachedData("name")}",
                style:
                    getTitleTextStyle(context, color: AppColors.primaryColor),
              ),
              Text(
                "Have a nice day",
                style: getBodyTextStyle(
                  context,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            context.pushTo(const ProfileScreen());
          },
          child: CircleAvatar(
            radius: 24,
            backgroundImage:
                FileImage(File(AppLocalStorage.getCachedData("image"))),
          ),
        )
      ],
    );
  }
}
