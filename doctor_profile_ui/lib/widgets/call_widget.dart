import 'package:doctor_profile_ui/core/colors.dart';
import 'package:flutter/material.dart';

class CallWidget extends StatelessWidget {
  const CallWidget({super.key, required this.text, required this.onPressed});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.call, color: Colors.black),
            Text(text),
          ],
        ),
      ),
    );
  }
}

// Person().name;
