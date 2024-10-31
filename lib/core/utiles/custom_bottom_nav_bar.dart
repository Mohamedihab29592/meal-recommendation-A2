// custom_bottom_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomBottomNavBar({this.currentIndex = 0, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.transparent,
      unselectedItemColor: AppColors.c_939393,
      onTap: (index) {
        // controller.getNavValue(index);
      },
      currentIndex: 1,
      items: [
        BottomNavigationBarItem(
          activeIcon: CircleAvatar(
            backgroundColor: AppColors.c_001A3F,
            radius: 35,
            child: Icon(
              Icons.home,
              color: AppColors.c_FFFFFF,
              size: 40,
            ),
          ),
          label: "Home",
          icon: Icon(
            Icons.home,
            color: AppColors.c_001A3F,
          ),
        ),
        BottomNavigationBarItem(
          label: "favorite",
          activeIcon: CircleAvatar(
            backgroundColor: AppColors.c_001A3F,
            radius: 35,
            child: Icon(
              Icons.favorite_border,
              color: AppColors.c_FFFFFF,
              size: 40,
            ),
          ),
          icon: Icon(
            color: AppColors.c_001A3F,
            Icons.arrow_outward_rounded,
          ),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          activeIcon: CircleAvatar(
            backgroundColor: AppColors.c_001A3F,
            radius: 35,
            child: Icon(
              Icons.person,
              color: AppColors.c_FFFFFF,
              size: 40,
            ),
          ),
          icon: Icon(
            color: AppColors.c_001A3F,
            Icons.person,
          ),
        ),
      ],
    );
  }
}
