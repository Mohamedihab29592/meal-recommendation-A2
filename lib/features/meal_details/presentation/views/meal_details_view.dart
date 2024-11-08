import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/features/meal_details/presentation/views/widgets/page_view_titles.dart';
import 'package:meal_recommendations_a2/features/meal_details/presentation/controllers/meal_details_view_cubit/meal_details_view_cubit.dart';

class MealDetailsView extends StatelessWidget {
  const MealDetailsView({super.key, required this.mealID});

  final int mealID;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await BlocProvider.of<MealDetailsViewCubit>(context).getMealDetailsModel(mealID);
    });

    return BlocBuilder<MealDetailsViewCubit, MealDetailsViewState>(
      builder: (context, state) {
        if (state is MealDetailsModelReceived) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Image.network(
                        state.model.image,
                        height: MediaQuery.sizeOf(context).height * .35,
                        width: MediaQuery.sizeOf(context).width,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 10),
                      Text(state.model.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                      const SizedBox(height: 10),
                      Text("${state.model.subtitle} . ${state.model.duration.inMinutes}min . ${state.model.serving} serving", style: TextStyle(fontSize: 18, color: AppColors.c_8A8A8A)),
                      const SizedBox(height: 15),
                      PageViewTitles(model: state.model),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is MealDetailsViewLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (state is MealDetailsViewFailed) {
          return Scaffold(
            body: Center(
              child: Text(
                state.error.errMsg,
                style: const TextStyle(fontSize: 20, color: AppColors.c_001A3F),
              ),
            ),
          );
        } else {
          return const Scaffold(body: Column());
        }
      },
    );
  }
}
