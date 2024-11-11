import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/core/helper/meal_helper.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/core/utiles/app_router.dart';
import 'package:meal_recommendations_a2/core/utiles/app_text_styles.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';

class RecipesBuilder extends StatelessWidget {
  const RecipesBuilder({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.kMealDetailsScreen, extra: meal.mealID),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Card(
          elevation: 4,
          shadowColor: Colors.grey.withOpacity(0.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: meal.image.isNotEmpty ? NetworkImage(meal.image) : const AssetImage('assets/placeholder.png') as ImageProvider,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.subtitle.isNotEmpty ? meal.subtitle : 'No subtitle',
                        style: AppTextStyles.style_med_15.copyWith(color: AppColors.c_001A3F),
                      ),
                      Text(
                        meal.name.isNotEmpty ? meal.name : 'No name',
                        style: AppTextStyles.style_bold_20.copyWith(color: AppColors.c_000000),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            '${meal.ingredients.length} ingredients',
                            style: AppTextStyles.style_med_15.copyWith(color: AppColors.c_8A8A8A),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '${meal.duration} min',
                            style: AppTextStyles.style_med_15.copyWith(color: AppColors.c_001A3F),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: List.generate(5, (index) {
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
      ),
    );
  }
}
// class RecipesBuilder extends StatelessWidget {
//   const RecipesBuilder({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return Expanded(child: ListView.builder(
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return Container(
//           padding: EdgeInsets.all(7),
//           margin: EdgeInsets.all(7),
//           decoration: BoxDecoration(
//             color: AppColors.c_FFFFFF,
//             border: Border.all(
//               color: AppColors.c_8D8D8D,
//               width: 1,
//             ),
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                 blurRadius: 5,
//                 blurStyle: BlurStyle.inner,
//                 color: AppColors.c_8D8D8D,
//                 offset: const Offset(
//                   2,
//                   3,
//                 ),
//               ),
//             ],

//             //details
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ImageOfFood(),
//               DetailsFood(),
//               IconButton(
//                 onPressed: () {},
//                 icon: Icon(Icons.favorite),
//                 color: AppColors.c_001A3F,
//               )
//             ],
//           ),
//         );
//       },

//     ));
//   }
// }

class DetailsFood extends StatelessWidget {
  const DetailsFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "vegan",
          style: AppTextStyles.style_bold_16,
        ),
        Text(
          "italian pizza",
          style: AppTextStyles.style_bold_22,
        ),
        Text(
          "12 ingrediantes",
          style: AppTextStyles.style_bold_14.copyWith(color: AppColors.c_8D8D8D),
        ),
      ],
    );
  }
}

class ImageOfFood extends StatelessWidget {
  const ImageOfFood({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundImage: AssetImage(Assets.Pizza),
      radius: 50,
    );
  }
}
