import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/features/meal_details/data/models/meal_details_model.dart';

class IngredianteItem extends StatelessWidget {
  const IngredianteItem({super.key, required this.ingred});
  final Ingrediantes ingred;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(color: AppColors.c_D9D9D9, shape: BoxShape.circle),
        ),
        const SizedBox(width: 15),
        SizedBox(
          child: Text(
            ingred.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: AppColors.c_001A3F, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const Expanded(child: SizedBox(width: 5)),
        SizedBox(
          child: Text(
            "${ingred.pieces.toString()} pcs",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: AppColors.c_001A3F, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
