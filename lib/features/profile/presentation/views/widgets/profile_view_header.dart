import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';

class ProfileViewHeader extends StatelessWidget {
  const ProfileViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: AppColors.c_001A3F),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications, color: AppColors.c_001A3F),
        ),
      ],
    );
  }
}
