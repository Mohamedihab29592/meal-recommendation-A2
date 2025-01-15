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
          style: AppTextStyles.styleMed14.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
        TextButton(
          style: ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
          onPressed: () {
            context.pushReplacement(AppRouter.kLoginScreen);
          },
          child: Text(
            AppStrings.registerLoginNow,
            style: AppTextStyles.styleBold14.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
