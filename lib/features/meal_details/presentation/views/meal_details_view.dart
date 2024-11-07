import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/main.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/features/meal_details/presentation/views/widgets/page_view_titles.dart';

class MealDetailsView extends StatelessWidget {
  const MealDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Image.network(
                  meal!.image,
                  height: MediaQuery.sizeOf(context).height * .35,
                  width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 10),
                Text(meal!.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                const SizedBox(height: 10),
                Text("${meal!.subtitle} . ${meal!.duration.inMinutes}min . ${meal!.serving} serving", style: TextStyle(fontSize: 18, color: AppColors.c_8A8A8A)),
                const SizedBox(height: 15),
                const PageViewTitles(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
