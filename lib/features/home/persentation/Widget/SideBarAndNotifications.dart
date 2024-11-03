import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';

class SideBarAndNotifications extends StatelessWidget {
  const SideBarAndNotifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: AppColors.c_001A3F,
            size: 30,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
            color: AppColors.c_001A3F,
            size: 30,
          ),
        ),
      ],
    );
  }
}
