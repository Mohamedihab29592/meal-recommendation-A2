import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/core/utiles/app_text_styles.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';
import 'package:meal_recommendations_a2/core/utiles/strings.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.02),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: AppColors.c_999999,
                  blurRadius: 7,
                  spreadRadius: 4,
                  offset: const Offset(4, 5),
                ),
              ],
              color: Colors.white,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: AppColors.c_FFFFFF,
                      context: context,
                      // isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                            20,
                          ),
                        ),
                      ),
                      builder: (context) => const MyBottomSheet(),
                    );
                  },
                  icon: Image.asset(
                    Assets.maskgroup,
                  ),
                ),
                hintText: AppStrings.searchrecipes,
                hintStyle: TextStyle(
                  color: AppColors.c_939393,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.02),
      ],
    );
  }
}

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Text(
                AppStrings.filter,
                style: AppTextStyles.style_bold_24.copyWith(color: AppColors.c_001A3F),
              ),
              const Spacer(),
              Text(
                AppStrings.reset,
                style: AppTextStyles.style_med_18.copyWith(color: AppColors.c_0047FF),
              ),
            ],
          ),
          Text(
            AppStrings.Mael,
            style: AppTextStyles.style_bold_20.copyWith(color: AppColors.c_001A3F),
          ),
          SizedBox(
            height: screenHeight * 0.05,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(5),
                      // color: AppColors.c_00A72F,
                    ),
                    child: const Text("Name of -  "),
                  ),
                );
              },
            ),
          ),
          Text(
            AppStrings.Time,
            style: AppTextStyles.style_bold_20.copyWith(color: AppColors.c_001A3F),
          ),
          SizedBox(
            width: screenWidth,
            height: screenHeight * 0.05,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(5),
                      // color: AppColors.c_00A72F,
                    ),
                    child: const Text('Name of -'),
                  ),
                );
              },
            ),
          ),
          Text(
            AppStrings.diffeculty,
            style: AppTextStyles.style_bold_20.copyWith(color: AppColors.c_001A3F),
          ),
          SizedBox(
            width: screenWidth,
            height: screenHeight * 0.05,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(5),
                      // color: AppColors.c_00A72F,
                    ),
                    child: const Text("Name of -"),
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              Text(
                AppStrings.numofindredients,
                style: AppTextStyles.style_bold_22.copyWith(color: AppColors.c_001A3F),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(5),
                    // color: AppColors.c_00A72F,
                  ),
                  child: const Text("5"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
