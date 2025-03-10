import 'package:flutter/material.dart';
import 'package:taskati/core/services/local_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

// theme in martial (dark, light),
// icon to change the theme (cache the theme bool),
// listen in martial 3la el theme in your box

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              bool isDarkTheme =
                  AppLocalStorage.getCachedData(AppLocalStorage.isDarkTheme) ??
                      false;
              AppLocalStorage.cacheData(
                  AppLocalStorage.isDarkTheme, !isDarkTheme);
            },
            icon: const Icon(Icons.dark_mode),
          )
        ],
      ),
    );
  }
}
