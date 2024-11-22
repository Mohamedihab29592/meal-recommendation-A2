import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/features/meal_details/data/models/meal_details_model.dart';
import 'package:meal_recommendations_a2/features/meal_details/presentation/controllers/meal_details_view_cubit/meal_details_view_cubit.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.mealModel});

  final MealDetailsModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        IconButton(
          onPressed: () async {
            await BlocProvider.of<MealDetailsViewCubit>(context).changeFavourateStatus(mealModel.id);
          },
          icon: Icon(
            mealModel.isFav ? Icons.favorite : Icons.favorite_border,
            color: AppColors.c_001A3F,
          ),
        ),
      ],
    );
  }
}
