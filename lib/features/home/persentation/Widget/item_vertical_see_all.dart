import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/core/utiles/app_router.dart';
import 'package:meal_recommendations_a2/core/utiles/app_text_styles.dart';
import 'package:meal_recommendations_a2/features/home/domain/Model/see_all_model.dart';

class ItemVerticalSeeAll extends StatelessWidget {
  const ItemVerticalSeeAll({super.key, required this.seeAllModel});
  final SeeAllModel seeAllModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.kMealDetailsScreen, extra: seeAllModel.mealID),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 10,
          left: 10,
          bottom: 10,
        ),
        child: IntrinsicHeight(
          child: Container(
            //  height: MediaQuery.sizeOf(context).height * 0.29,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.c_D9D9D9),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
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
                  Positioned(
                    top: 15,
                    right: 15,
                    child: Icon(
                      Icons.favorite_border,
                      size: 35,
                      color: AppColors.c_FFFFFF,
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  seeAllModel.mealName,
                  style: AppTextStyles.style_bold_20,
                ),
                Row(
                  children: [
                    Text(
                      '${seeAllModel.ingredientsCount} ingrediuanets',
                      style: AppTextStyles.style_med_15.copyWith(
                        color: AppColors.c_8A8A8A,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${seeAllModel.time} min',
                      style: AppTextStyles.style_med_15.copyWith(
                        color: AppColors.c_001A3F,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
