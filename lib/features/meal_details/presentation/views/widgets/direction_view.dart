import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/features/meal_details/data/models/meal_details_model.dart';

class DirectionView extends StatelessWidget {
  const DirectionView({super.key, required this.model});

  final MealDetailsModel model;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      const SizedBox(height: 10),
      Text("total steps ${model.steps.length}"),
    ];

    children.addAll(
      List.generate(model.steps.length, (int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              "step $index",
              style: const TextStyle(color: AppColors.c_001A3F, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              model.steps[index],
              style: const TextStyle(color: AppColors.c_001A3F, fontSize: 16),
            )
          ],
        );
      }),
    );

    children.add(const SizedBox(height: 10));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
