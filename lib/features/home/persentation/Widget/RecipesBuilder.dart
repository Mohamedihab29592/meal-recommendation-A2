import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/core/utiles/app_text_styles.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';

class RecipesBuilder extends StatelessWidget {
  const RecipesBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Expanded(child: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(7),
          margin: EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: AppColors.c_FFFFFF,
            border: Border.all(
              color: AppColors.c_8D8D8D,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                blurStyle: BlurStyle.inner,
                color: AppColors.c_8D8D8D,
                offset: const Offset(
                  2,
                  3,
                ),
              ),
            ],
    
            //details
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageOfFood(),
              DetailsFood(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite),
                color: AppColors.c_001A3F,
              )
            ],
          ),
        );
      },
      // separatorBuilder: (context, index) {
      //   return SizedBox(
      //     // height: screenHeight * 0.01,
      //     // width: screenWidth * 0.01,
      //   );
      // },
    ));
  }
}

class DetailsFood extends StatelessWidget {
  const DetailsFood({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "vegan",
          style: AppTextStyles.style_bold_16,
        ),
        Text(
          "italian pizza",
          style: AppTextStyles.style_bold_22,
        ),
        Text(
          "12 ingrediantes",
          style:
              AppTextStyles.style_bold_14.copyWith(color: AppColors.c_8D8D8D),
        ),
      ],
    );
  }
}

class ImageOfFood extends StatelessWidget {
  const ImageOfFood({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(Assets.Pizza),
      radius: 50,
    );
  }
}
