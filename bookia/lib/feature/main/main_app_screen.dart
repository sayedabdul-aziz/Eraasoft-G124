import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/feature/home/presentation/page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.accentColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/Home.svg"),
            activeIcon: SvgPicture.asset(
              "assets/icons/Home.svg",
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcIn),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Bookmark.svg"),
              activeIcon: SvgPicture.asset(
                "assets/icons/Bookmark.svg",
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor, BlendMode.srcIn),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Category.svg"),
              activeIcon: SvgPicture.asset(
                "assets/icons/Category.svg",
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor, BlendMode.srcIn),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Profile.svg"),
              activeIcon: SvgPicture.asset(
                "assets/icons/Profile.svg",
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor, BlendMode.srcIn),
              ),
              label: "Home"),
        ],
      ),
    );
  }
}
