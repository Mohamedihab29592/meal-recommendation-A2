import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/core/utiles/app_text_styles.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/SideBarAndNotifications.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/list_view_horizontal_see_all.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/list_view_vertical_see_all.dart';
import 'package:meal_recommendations_a2/features/home/persentation/cubits/see_all_cubit/see_all_cubit.dart';
import 'package:meal_recommendations_a2/features/home/persentation/cubits/see_all_cubit/see_all_state.dart';

class SeeAllScreenViewBody extends StatelessWidget {
  const SeeAllScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeeAllCubit, SeeAllCubitState>(
      builder: (context, state) {
        if (state is SeeAllLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SeeAllError) {
          return const Center(
              child: Text('There was an error. Please try again later.'));
        } else if (state is SeeAllLoaded) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SideBarAndNotifications(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Trending Recipes',
                    style: AppTextStyles.style_bold_18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListViewHorizontalSeeAll(
                  seeAllModel: state.seeAllModel,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Recommended for you',
                    style: AppTextStyles.style_bold_18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListViewVerticalSeeAll(
                  seeAllModel: state.seeAllModel,
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
