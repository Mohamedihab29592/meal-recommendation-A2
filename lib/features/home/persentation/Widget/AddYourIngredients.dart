import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/core/utiles/app_text_styles.dart';

class AddYourIngredients extends StatelessWidget {
  const AddYourIngredients({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.c_001A3F,
          ),
          onPressed: () {},
          child: Text(
            "Add Your Ingredients",
            style: AppTextStyles.style_bold_14.copyWith(
              color: AppColors.c_FFFFFF,
            ),
          ),
        ),
      ],
    );
  }
}
