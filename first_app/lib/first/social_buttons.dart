import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.facebook_rounded,
            color: Colors.blueAccent,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.camera_alt_rounded,
            color: Colors.redAccent,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.snapchat,
            color: Colors.yellow,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.telegram_rounded,
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
