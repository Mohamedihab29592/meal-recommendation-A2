import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/core/utiles/app_router.dart';
import 'package:meal_recommendations_a2/core/utiles/app_text_styles.dart';
import 'package:meal_recommendations_a2/features/home/domain/Model/see_all_model.dart';
import 'package:meal_recommendations_a2/features/home/persentation/cubits/see_all_cubit/see_all_cubit.dart';

class ItemVerticalSeeAll extends StatefulWidget {
  const ItemVerticalSeeAll({super.key, required this.seeAllModel});

  final SeeAllModel seeAllModel;

  @override
  State<ItemVerticalSeeAll> createState() => _ItemVerticalSeeAllState();
}

class _ItemVerticalSeeAllState extends State<ItemVerticalSeeAll> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await GoRouter.of(context).push(AppRouter.kMealDetailsScreen, extra: widget.seeAllModel.mealID);
        if (context.mounted) {
          await BlocProvider.of<SeeAllCubit>(context).fetchMealData();
        }
      },
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
              border: Border.all(color: AppColors.cD9D9D9),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.13,
                        width: double.infinity,
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            widget.seeAllModel.image,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      right: 15,
                      child: IconButton(
                        onPressed: () async {
                          widget.seeAllModel.isFavorite = !widget.seeAllModel.isFavorite;
                          await BlocProvider.of<SeeAllCubit>(context).changeFavoriteStatus(widget.seeAllModel.mealID);
                        },
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          widget.seeAllModel.isFavorite ? Icons.favorite : Icons.favorite_border,
                          size: 35,
                          color: AppColors.cFFFFFF,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.seeAllModel.mealName,
                  style: AppTextStyles.styleBold20,
                ),
                Row(
                  children: [
                    Text(
                      '${widget.seeAllModel.ingredientsCount} ingrediuanets',
                      style: AppTextStyles.styleMed15.copyWith(
                        color: AppColors.c8A8A8A,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${widget.seeAllModel.time} min',
                      style: AppTextStyles.styleMed15.copyWith(
                        color: AppColors.c001A3F,
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
