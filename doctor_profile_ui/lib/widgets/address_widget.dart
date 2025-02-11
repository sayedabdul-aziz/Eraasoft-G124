import 'package:doctor_profile_ui/core/colors.dart';
import 'package:doctor_profile_ui/widgets/tile_item.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
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
            icon: Icons.local_hospital,
            text: 'Cairo Hospital',
          ),
          SizedBox(
            height: 5,
          ),
          TileItem(
            icon: Icons.watch_later_outlined,
            text: '4:00 - 11:00 PM',
          ),
          SizedBox(
            height: 5,
          ),
          TileItem(
            icon: Icons.location_on,
            text: 'Nasr City, Cairo',
          )
        ],
      ),
    );
  }
}
