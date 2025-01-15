import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/core/utiles/app_router.dart';
import 'package:meal_recommendations_a2/core/utiles/app_text_styles.dart';
import 'package:meal_recommendations_a2/features/home/domain/Model/see_all_model.dart';

class ItemHorizontalSeeAll extends StatelessWidget {
  const ItemHorizontalSeeAll({super.key, required this.seeAllModel});
  final SeeAllModel seeAllModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.kMealDetailsScreen, extra: seeAllModel.mealID),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SizedBox(
          // height: MediaQuery.sizeOf(context).height * 0.4,
          width: MediaQuery.sizeOf(context).width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.13,
                  width: double.infinity,
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      seeAllModel.image,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                seeAllModel.mealName,
                style: AppTextStyles.styleBold16,
              ),
              Row(
                children: [
                  Text(
                    '${seeAllModel.ingredientsCount} ingrediuanets',
                    style: AppTextStyles.styleMed12.copyWith(
                      color: AppColors.c8A8A8A,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    '${seeAllModel.time} min',
                    style: AppTextStyles.styleMed12.copyWith(
                      color: AppColors.c001A3F,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
