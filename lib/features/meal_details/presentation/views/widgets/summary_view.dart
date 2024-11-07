import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/features/meal_details/data/models/meal_details_model.dart';
import 'package:meal_recommendations_a2/features/meal_details/presentation/views/widgets/nutrition_item.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key, required this.model});

  final MealDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(model.summary, style: const TextStyle(color: AppColors.c_001A3F)),
          const SizedBox(height: 10),
          const Row(
            children: [
              Text("nutrations", style: TextStyle(color: AppColors.c_001A3F, fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              NutritionItem(type: "protein", amount: "${model.nutritions.protein.toInt()}g"),
              const Expanded(child: SizedBox()),
              NutritionItem(type: "carp", amount: "${model.nutritions.carp.toInt()}g"),
              const Expanded(child: SizedBox()),
              NutritionItem(type: "fat", amount: "${model.nutritions.fat.toInt()}g"),
              const Expanded(child: SizedBox()),
              NutritionItem(type: "kcal", amount: "${model.nutritions.kcal.toInt()}"),
              const Expanded(child: SizedBox()),
              NutritionItem(type: "vitamenes", amount: "${model.nutritions.vitamenes.toInt()}mg"),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
