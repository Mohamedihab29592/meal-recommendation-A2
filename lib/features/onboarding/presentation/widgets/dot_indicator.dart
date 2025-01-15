import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/features/onboarding/presentation/widgets/custom_dot.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.curcurrentPageIndex});
  final int curcurrentPageIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        4,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CustomDot(isActive: index == curcurrentPageIndex),
        ),
      ),
    );
  }
}
