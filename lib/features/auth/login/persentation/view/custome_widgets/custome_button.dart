import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.radius = 60,
    this.foregroundColor = Colors.black,
    this.backgroundColor = Colors.white,
  });

  final String text;
  final VoidCallback onPressed;
  final double radius;
  final Color foregroundColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 324,
      height: 57,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
          foregroundColor: foregroundColor, // Text color
          backgroundColor: backgroundColor, // Background color
        ),
        child: Text(text, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
