import 'package:doctor_profile_ui/core/colors.dart';
import 'package:flutter/material.dart';

class TileItem extends StatelessWidget {
  const TileItem({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: AppColors.primaryColor, shape: BoxShape.circle),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            )),
        SizedBox(width: 10),
        Text(text),
      ],
    );
  }
}
