import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/features/meal_details/data/models/meal_details_model.dart';
import 'package:meal_recommendations_a2/features/meal_details/presentation/views/widgets/summary_view.dart';

class PageViewSection extends StatelessWidget {
  const PageViewSection({super.key, required this.model});

  final MealDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: [
        SummaryView(model: model),
        const Scaffold(),
        const Scaffold(),
      ],
    );
  }
}
