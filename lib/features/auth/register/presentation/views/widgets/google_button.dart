import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.080,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Image.asset(
        Assets.assetsGoogle,
      ),
    );
  }
}
