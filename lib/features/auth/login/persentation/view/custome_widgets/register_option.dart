import 'package:flutter/material.dart';

class RegisterOption extends StatelessWidget {
  const RegisterOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Don't have an account? Register now",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
