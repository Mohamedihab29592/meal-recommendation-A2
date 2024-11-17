import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/features/meal_details/data/models/meal_details_model.dart';
import 'package:meal_recommendations_a2/features/meal_details/presentation/views/widgets/ingrediante_item.dart';

class IngrediantesView extends StatelessWidget {
  const IngrediantesView({super.key, required this.model});

  final MealDetailsModel model;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      const SizedBox(height: 10),
      Text("total ingrediantes ${model.ingrediantes.length}"),
      const SizedBox(height: 25),
    ];

    children.addAll(
      List.generate(model.ingrediantes.length, (int index) {
        return Column(
          children: [
            IngredianteItem(ingred: model.ingrediantes[index]),
            const SizedBox(height: 10),
            const Divider(color: AppColors.c_001A3F, thickness: .75),
            const SizedBox(height: 10),
          ],
        );
      }),
    );

    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
