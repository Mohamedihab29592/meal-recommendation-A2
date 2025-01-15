import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/core/utiles/app_router.dart';
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
          style: AppTextStyles.styleBold18,
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kSeeAllScreen);
          },
          child: Text(
            AppStrings.seeall,
            style: AppTextStyles.styleMed18,
          ),
        ),
      ],
    );
  }
}
