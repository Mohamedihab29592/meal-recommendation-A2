
import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_text_styles.dart';

class RowTopRecipes extends StatelessWidget {
  const RowTopRecipes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Top Recipes",
          style: AppTextStyles.style_bold_18,
        ),
        Text(
          "See All",
          style: AppTextStyles.style_med_18,
        ),
      ],
    );
  }
}
