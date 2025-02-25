import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/app_colors.dart';
import 'package:taskati/core/utils/text_style.dart';

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
                style: getTitleTextStyle(color: AppColors.primaryColor),
              ),
              Text(
                "Have a nice day",
                style: getBodyTextStyle(),
              ),
            ],
          ),
        ),
        CircleAvatar(
          radius: 24,
          backgroundImage:
              FileImage(File(AppLocalStorage.getCachedData("image"))),
        )
      ],
    );
  }
}
