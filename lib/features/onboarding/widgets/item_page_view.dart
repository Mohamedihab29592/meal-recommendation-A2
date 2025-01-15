import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/core/utiles/app_text_styles.dart';

import 'package:meal_recommendations_a2/core/utiles/assets.dart';
import 'package:meal_recommendations_a2/features/onboarding/widgets/dot_indicator.dart';

class ItemPageView extends StatelessWidget {
  const ItemPageView(
      {super.key, required this.curcurrentPageIndex, required this.image, required this.title, required this.subtitle, required this.textButton1, required this.textbutton2, this.onTap1, this.onTap2});
  final int curcurrentPageIndex;
  final String image;
  final String title;
  final String subtitle;
  final String textButton1;
  final String textbutton2;
  final void Function()? onTap1;
  final void Function()? onTap2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.5,
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                    color: AppColors.c001A3F,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(227),
                      bottomRight: Radius.circular(227),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Image.asset(
                    Assets.logo,
                    width: MediaQuery.sizeOf(context).width * 0.125,
                    height: MediaQuery.sizeOf(context).height * 0.125,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                top: 260,
                child: Center(
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.c001A3F,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(image),
                        radius: 110,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Text(
            title,
            style: AppTextStyles.styleBold18.copyWith(
              color: AppColors.c001A3F,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              subtitle,
              style: AppTextStyles.styleBold14.copyWith(
                color: AppColors.c001A3F,
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onTap1,
                  child: Text(
                    textButton1,
                    style: AppTextStyles.styleBold14.copyWith(
                      color: AppColors.c001A3F,
                    ),
                  ),
                ),
                DotIndicator(curcurrentPageIndex: curcurrentPageIndex),
                GestureDetector(
                  onTap: onTap2,
                  child: Text(
                    textbutton2,
                    style: AppTextStyles.styleBold14.copyWith(
                      color: AppColors.c001A3F,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
