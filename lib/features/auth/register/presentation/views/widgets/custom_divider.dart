import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_text_styles.dart';
import 'package:meal_recommendations_a2/core/utiles/strings.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 9,
        ),
        Text(
          AppStrings.registerOrLoginWith,
          style: AppTextStyles.styleMed12.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 9,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
