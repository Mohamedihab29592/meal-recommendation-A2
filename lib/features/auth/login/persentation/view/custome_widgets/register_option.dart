import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/core/utiles/app_router.dart';
import 'package:meal_recommendations_a2/core/utiles/strings.dart';

class RegisterOption extends StatelessWidget {
  const RegisterOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.registerOption,
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 10),
        TextButton(
          style: ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRouter.kRegisterScreen);
          },
          child: Text(
            AppStrings.registerNow,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
