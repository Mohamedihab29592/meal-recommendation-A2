import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/view/custome_widgets/custome_button.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String email;
  final String password;
  final VoidCallback onPressed;

  const LoginButton({
    required this.formKey,
    required this.email,
    required this.password,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Login',
      onPressed: onPressed,
    );
  }
}
