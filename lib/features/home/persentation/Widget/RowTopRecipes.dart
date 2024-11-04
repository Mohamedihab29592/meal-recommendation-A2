import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_text_styles.dart';
import 'package:meal_recommendations_a2/core/utiles/strings.dart';

class RowTopRecipes extends StatelessWidget {
  const RowTopRecipes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.toprecipes,
          style: AppTextStyles.style_bold_18,
        ),
        Text(
          AppStrings.seeall,
          style: AppTextStyles.style_med_18,
        ),
      ],
    );
  }
}