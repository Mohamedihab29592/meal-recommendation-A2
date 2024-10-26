import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';
class LogoWidget extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Image.asset(
            fit: BoxFit.contain,
      Assets.logo,
      height: screenHeight * 0.19,
      width: screenHeight * 0.18,
    );
  }
}
