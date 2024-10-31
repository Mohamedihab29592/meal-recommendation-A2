// favorite_screen.dart
import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/core/utiles/app_text_styles.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';
import 'package:meal_recommendations_a2/core/utiles/custom_app_bar.dart';
import 'package:meal_recommendations_a2/core/utiles/custom_bottom_nav_bar.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: FavoriteItemCard(),
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          // Handle navigation here
        },
      ),
    );
  }
}

class FavoriteItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         // Border color and width
        borderRadius: BorderRadius.circular(15),
      ),
      child: Card(
        elevation: 4, // Adjust this value to increase/decrease shadow intensity
        shadowColor: Colors.grey.withOpacity(0.5), // Adjust shadow color and opacity
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(8), // Space inside the border
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(Assets.Pizza),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'vegan',
                      style: AppTextStyles.style_med_15.copyWith(color: AppColors.c_001A3F),
                    ),
                    Text(
                      'italian pizza',
                      style: AppTextStyles.style_bold_20.copyWith(color: AppColors.c_000000),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '12 ingredients',
                          style: AppTextStyles.style_med_15.copyWith(color: AppColors.c_8A8A8A),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '30min',
                          style: AppTextStyles.style_med_15.copyWith(color: AppColors.c_001A3F),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.yellow[700],
                        );
                      }),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.favorite, color: AppColors.c_001A3F),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}


