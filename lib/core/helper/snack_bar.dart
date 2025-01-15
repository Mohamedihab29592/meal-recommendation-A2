import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';

void showSnackBar(BuildContext context, String message, [int seconds = 2]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      duration: Duration(seconds: seconds),
      backgroundColor: AppColors.c001A3F,
    ),
  );
}
