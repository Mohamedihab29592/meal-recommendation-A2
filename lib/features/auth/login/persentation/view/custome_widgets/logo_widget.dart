import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';
class LogoSection extends StatelessWidget {
  const LogoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Image.asset(
      Assets.logo,
      fit: BoxFit.contain,
      height: screenHeight * 0.18,
      width: screenHeight * 0.18,
    );
  }
}
