import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/core/utiles/app_text_styles.dart';
import 'package:meal_recommendations_a2/core/utiles/strings.dart';

class CustomRegisterButton extends StatelessWidget {
  const CustomRegisterButton({
    super.key,
    required this.height,
    required this.onPressed,
  });

  final double height;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height * 0.060,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          AppStrings.register,
          style: AppTextStyles.style_bold_21.copyWith(
            color: AppColors.c_001A3F,
          ),
        ),
      ),
    );
  }
}
