import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/features/fav_screen/domain/model/FavModel.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/core/utiles/app_text_styles.dart';

class FavRecipesBuilder extends StatelessWidget {
  final FavMeal meal;

  const FavRecipesBuilder({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Card(
        elevation: 4,
        shadowColor: Colors.grey.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: meal.imageUrl.isNotEmpty
                    ? NetworkImage(meal.imageUrl)
                    : const AssetImage('assets/placeholder.png') as ImageProvider,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.category.isNotEmpty ? meal.category : 'No category',
                      style: AppTextStyles.style_med_15.copyWith(color: AppColors.c_001A3F),
                    ),
                    Text(
                      meal.title.isNotEmpty ? meal.title : 'No title',
                      style: AppTextStyles.style_bold_20.copyWith(color: AppColors.c_000000),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '${meal.ingredients} ingredients',
                          style: AppTextStyles.style_med_15.copyWith(color: AppColors.c_8A8A8A),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          meal.time,
                          style: AppTextStyles.style_med_15.copyWith(color: AppColors.c_001A3F),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: List.generate(meal.rating.toInt(), (index) {
                        return Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.yellow[700],
                        );
                      }),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.favorite, color: AppColors.c_001A3F),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
