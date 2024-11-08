import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/features/home/domain/Model/NavModel.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/AddYourIngredients.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/MyNavigationBar.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/RecipesBuilder.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/RowTopRecipes.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/SearchAndFilter.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/SideBarAndNotifications.dart';
import 'package:meal_recommendations_a2/features/home/persentation/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, NavState>(
        builder: (context, state) {
          return Scaffold(
            // backgroundColor: AppColors.c_FFFFFF,
            body: Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.05,
                left: screenWidth * 0.02,
                right: screenWidth * 0.02,
                // bottom: screenHeight * 0.02,
              ),
              child: state.currentScreen,
              // Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // children: [
              // Done
              //     SideBarAndNotifications(),
              //     SizedBox(height: screenHeight * 0.015),
              //     //Done
              //     SearchAndFilter(),
              //     SizedBox(height: screenHeight * 0.03),
              //     //Done
              //     AddYourIngredients(),
              //     SizedBox(height: screenHeight * 0.015), RowTopRecipes(),

              //     RecipesBuilder(),
              //     // MyNavigationBar(),
              //   ],
              // ),
            ),
            //Navigation bar
            bottomNavigationBar: const MyNavigationBar(),
          );
        },
      ),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

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

          const RecipesBuilder(),
          // MyNavigationBar(),
        ],
      ),
    );
  }
}

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RecipesBuilder(),
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
