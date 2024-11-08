import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/core/utiles/app_router.dart';
import 'package:meal_recommendations_a2/core/utiles/app_text_styles.dart';
import 'package:meal_recommendations_a2/core/utiles/strings.dart';

class LoginTextButton extends StatelessWidget {
  const LoginTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.registerHaveAnAccount,
          style: AppTextStyles.style_med_14.copyWith(
            color: Colors.white,
          ),
        ),
        TextButton(
          onPressed: () {
            context.go(AppRouter.kLoginScreen);
          },
          child: Text(
            AppStrings.registerLoginNow,
            style: AppTextStyles.style_bold_14.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
