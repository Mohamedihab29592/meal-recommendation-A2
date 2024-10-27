import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      backgroundColor: AppColors.c_001A3F,
      color: Colors.white,
    ));
  }
}
