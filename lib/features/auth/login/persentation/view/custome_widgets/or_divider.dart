import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/strings.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            endIndent: 5,
            indent: 35,
            color: Color(0xFFDCDEDE),
          ),
        ),
        SizedBox(
          width: 0,
        ),
        Text(
          AppStrings.orLoginWith,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          width: 3,
        ),
        Expanded(
          child: Divider(
            endIndent: 35,
            color: Color(0xFFDCDEDE),
          ),
        ),
      ],
    );
  }
}
