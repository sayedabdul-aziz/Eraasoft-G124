import 'package:doctor_profile_ui/core/colors.dart';
import 'package:doctor_profile_ui/widgets/tile_item.dart';
import 'package:flutter/material.dart';

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          TileItem(
            icon: Icons.email,
            text: 'jG3Qa@example.com',
          ),
          SizedBox(
            height: 5,
          ),
          TileItem(
            icon: Icons.call,
            text: '01010101010',
          ),
          SizedBox(
            height: 5,
          ),
          TileItem(
            icon: Icons.call,
            text: '01010101010',
          )
        ],
      ),
    );
  }
}
