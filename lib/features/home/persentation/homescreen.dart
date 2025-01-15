import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/core/helper/meal_helper.dart';
import 'package:meal_recommendations_a2/core/services/secure_storage.dart';
import 'package:meal_recommendations_a2/features/home/data/repo_imp.dart';
import 'package:meal_recommendations_a2/features/home/domain/Model/NavModel.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/AddYourIngredients.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/MyNavigationBar.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/RecipesBuilder.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/RowTopRecipes.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/SearchAndFilter.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/SideBarAndNotifications.dart';
import 'package:meal_recommendations_a2/features/home/persentation/cubits/favourate_cubit/favourate_cubit.dart';
import 'package:meal_recommendations_a2/features/home/persentation/cubits/home_cubit/home_cubit.dart';
import 'package:meal_recommendations_a2/features/home/persentation/cubits/navigation_cubit/navigation_cubit.dart';
import '../../side_bar/side_bar_view_body.dart';

class ControllerScreen extends StatelessWidget {
  const ControllerScreen({super.key});
  final FirestoreService firestoreService = const FirestoreService(SecureStorageService());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(firestoreService),
        ),
        BlocProvider(
          create: (context) => FavourateCubit(firestoreService),
        ),
      ],
      child: BlocBuilder<NavigationCubit, NavState>(
        builder: (context, state) {
          return Scaffold(
            body: state.currentScreen,
            bottomNavigationBar: const MyNavigationBar(),
          );
        },
      ),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  final FirestoreService firestoreService = const FirestoreService(SecureStorageService());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const Sidebar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 10),
            const SideBarAndNotifications(),
            SizedBox(height: screenHeight * 0.015),
            const SearchAndFilter(),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: const AddYourIngredients(),
            ),
            SizedBox(height: screenHeight * 0.015),
            Padding(
              padding: const EdgeInsets.all(10),
              child: const RowTopRecipes(),
            ),
            StreamBuilder<List<Meal>>(
              stream: firestoreService.getMeals(),
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
                return Expanded(
                  child: ListView.builder(
                    itemCount: meals.length,
                    itemBuilder: (context, index) {
                      return RecipesBuilder(
                        onPressed: () async {
                          await BlocProvider.of<HomeCubit>(context).changeFavourateStatus(meals[index].mealID);
                        },
                        meal: meals[index],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
