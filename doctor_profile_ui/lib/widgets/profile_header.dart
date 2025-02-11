import 'package:doctor_profile_ui/core/colors.dart';
import 'package:doctor_profile_ui/widgets/call_widget.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // image
        ClipOval(
          child: Image.network(
            'https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Ahmed Ali',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 18,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500),
              ),
              Text('Dentist'),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.star_rounded, color: Colors.amber),
                  Text('4.5')
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  CallWidget(
                    text: '1',
                    onPressed: () {},
                  ),
                  SizedBox(width: 8),
                  CallWidget(
                    text: '2',
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
