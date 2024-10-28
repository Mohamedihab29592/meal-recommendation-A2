import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/AddYourIngredients.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/MyNavigationBar.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/RecipesBuilder.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/RowTopRecipes.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/SearchAndFilter.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/SideBarAndNotifications.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.c_FFFFFF,
      body: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.05,
          left: screenWidth * 0.02,
          right: screenWidth * 0.02,
          // bottom: screenHeight * 0.02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Done
            SideBarAndNotifications(),
            SizedBox(height: screenHeight * 0.015),
            //Done
            SearchAndFilter(),
            SizedBox(height: screenHeight * 0.03),
            //Done
            AddYourIngredients(),
            SizedBox(height: screenHeight * 0.015), RowTopRecipes(),

            RecipesBuilder(),
            // MyNavigationBar(),
          ],
        ),
      ),
      //Navigation bar
      bottomNavigationBar: MyNavigationBar(),
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
