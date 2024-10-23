import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    required this.height,
    required this.onTap,
  });

  final double height;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 0.080,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Image.asset(
          Assets.assetsGoogle,
        ),
      ),
    );
  }
}
