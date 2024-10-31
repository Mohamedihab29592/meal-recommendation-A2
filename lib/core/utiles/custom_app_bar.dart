// custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.c_001A3F),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
