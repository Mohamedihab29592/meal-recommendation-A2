import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 324,
      height: 57,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          backgroundColor: Colors.white, // Background color
          foregroundColor: Colors.black, // Text color
        ),
        child: Text(text, style: AppTextStyles.styleBold21),
      ),
    );
  }
}
