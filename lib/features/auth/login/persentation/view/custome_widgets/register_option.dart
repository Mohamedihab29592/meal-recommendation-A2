import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/core/utiles/app_router.dart';

class RegisterOption extends StatelessWidget {
  const RegisterOption({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kRegisterScreen);
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account? Register now",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
