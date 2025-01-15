import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';

class SideBarAndNotifications extends StatelessWidget {
  const SideBarAndNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer(); // Open the drawer
          },
          icon: const Icon(
            Icons.menu,
            color: AppColors.c001A3F,
            size: 30,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            // Add your notification action here
          },
          icon: const Icon(
            Icons.notifications,
            color: AppColors.c001A3F,
            size: 30,
          ),
        ),
      ],
    );
  }
}
