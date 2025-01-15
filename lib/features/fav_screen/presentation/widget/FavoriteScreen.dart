import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/core/helper/meal_helper.dart';
import 'package:meal_recommendations_a2/core/services/secure_storage.dart';
import 'package:meal_recommendations_a2/features/home/data/repo_imp.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/RecipesBuilder.dart';
import 'package:meal_recommendations_a2/features/home/persentation/cubits/favourate_cubit/favourate_cubit.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
  final FirestoreService firestoreService = const FirestoreService(SecureStorageService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Meal>>(
        stream: firestoreService.getFavMeals(),
        builder: (context, AsyncSnapshot<List<Meal>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error fetching data"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No favorite meals found"));
          }

          final meals = snapshot.data!;
          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return RecipesBuilder(
                onPressed: () async {
                  await BlocProvider.of<FavourateCubit>(context).changeFavourateStatus(meals[index].mealID);
                },
                meal: meals[index],
              );
            },
          );
        },
      ),
    );
  }
}
