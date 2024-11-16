import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/features/fav_screen/presentation/widget/FavRecipesBuilder.dart';
import 'package:meal_recommendations_a2/features/fav_screen/presentation/cubit/fav_cubit.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/RowTopRecipes.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/SearchAndFilter.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/SideBarAndNotifications.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SideBarAndNotifications(),
          SizedBox(height: screenHeight * 0.015),
          const SearchAndFilter(),
          SizedBox(height: screenHeight * 0.03),
          const RowTopRecipes(),
          BlocBuilder<FavCubit, FavState>(
            builder: (context, state) {
              if (state is FavLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FavLoaded) {
                if (state.meals.isEmpty) {
                  return const Center(child: Text("No favorite meals found"));
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.meals.length,
                    itemBuilder: (context, index) {
                      return FavRecipesBuilder(meal: state.meals[index]);
                    },
                  ),
                );
              } else if (state is FavError) {
                return Center(child: Text(state.message));
              }
              return const Center(child: Text("Unexpected error"));
            },
          ),
        ],
      ),
    );
  }
}
