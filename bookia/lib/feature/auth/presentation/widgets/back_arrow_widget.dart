import 'package:bookia/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BackArrowWidget extends StatelessWidget {
  const BackArrowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 40,
        height: 40,
        padding: const EdgeInsets.only(left: 6),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor, width: 1),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white),
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
}
