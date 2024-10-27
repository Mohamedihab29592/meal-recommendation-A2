
import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.menu_open_rounded,
            color: AppColors.c_001A3F,
          ),
        )
      ],
    );
  }
}