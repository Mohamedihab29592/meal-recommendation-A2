import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/core/helper/meal_helper.dart';
import 'package:meal_recommendations_a2/features/home/data/repo_imp.dart';
import 'package:meal_recommendations_a2/features/home/domain/Model/NavModel.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/AddYourIngredients.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/MyNavigationBar.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/RecipesBuilder.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/RowTopRecipes.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/SearchAndFilter.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/SideBarAndNotifications.dart';
import 'package:meal_recommendations_a2/features/home/persentation/cubits/home_cubit/home_cubit.dart';

class ControllerScreen extends StatelessWidget {
  const ControllerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, NavState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.05,
                left: screenWidth * 0.02,
                right: screenWidth * 0.02,
              ),
              child: state.currentScreen,
            ),
            bottomNavigationBar: const MyNavigationBar(),
          );
        },
      ),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  MyHomeScreen({super.key});
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Done
          const SideBarAndNotifications(),
          SizedBox(height: screenHeight * 0.015),
          //Done
          const SearchAndFilter(),
          SizedBox(height: screenHeight * 0.03),
          //Done
          const AddYourIngredients(),
          SizedBox(height: screenHeight * 0.015), const RowTopRecipes(),
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
                      meal: meals[index],
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  final FirestoreService firestoreService = FirestoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Meal>>(
        stream: firestoreService.getMeals(),
        builder: (context, AsyncSnapshot<List<Meal>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error fetching data"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No favorite meals found"));
          }

          final meals = snapshot.data!;
          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return RecipesBuilder(
                meal: meals[index],
              );
            },
          );
        },
      ),
    );
  }
}

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchAndFilter(),
    );
  }
}



// class MyNavigationBar extends StatelessWidget {
//   const MyNavigationBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SizedBox(
//           width: screenWidth * 0.001,
//         ),
//         CircleAvatar(
//           backgroundColor: AppColors.c_001A3F,
//           radius: 40,
//           child: Icon(
//             Icons.home,
//             color: AppColors.c_FFFFFF,
//             size: 40,
//           ),
//         ),
//         CircleAvatar(
//           backgroundColor: Colors.transparent,
//           radius: 40,
//           child: Icon(
//             Icons.favorite_border,
//             // color: AppColors.c_001A3F,
//             size: 40,
//           ),
//         ),
//         CircleAvatar(
//           backgroundColor: Colors.transparent,
//           radius: 40,
//           child: Icon(
//             Icons.person_3_outlined,
//             // color: AppColors.c_001A3F,
//             size: 40,
//           ),
//         ),
//         SizedBox(
//           width: screenWidth * 0.001,
//         ),
//       ],
//     );
//   }
// }
