import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/core/utiles/app_text_styles.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';
import 'package:meal_recommendations_a2/features/onboarding/data/models/onboarding_view_item_model.dart';
import 'package:meal_recommendations_a2/features/onboarding/presentation/widgets/dot_indicator.dart';

class ItemPageView extends StatelessWidget {
  const ItemPageView({super.key, required this.model});

  final OnboardingItemViewModel model;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height / 2,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(Assets.rectangle687),
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox.expand(
                      child: Column(
                        children: [
                          const Expanded(child: SizedBox()),
                          Image.asset(Assets.logo),
                          const Expanded(flex: 3, child: SizedBox()),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: -50,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.c001A3F, width: 1),
                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(model.image),
                            radius: 70,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(flex: 3, child: SizedBox(height: 70)),
              Text(
                model.title,
                textAlign: TextAlign.center,
                style: AppTextStyles.styleBold18.copyWith(
                  color: AppColors.c001A3F,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  model.subtitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.styleReg14.copyWith(
                    color: AppColors.c001A3F,
                  ),
                ),
              ),
              const Expanded(child: SizedBox(height: 10)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: model.onTapSkip,
                      child: Text(
                        model.textButton1,
                        style: AppTextStyles.styleBold14.copyWith(
                          color: AppColors.c001A3F,
                        ),
                      ),
                    ),
                    DotIndicator(curcurrentPageIndex: model.currentPageIndex),
                    GestureDetector(
                      onTap: model.onTapNext,
                      child: Text(
                        model.textbutton2,
                        style: AppTextStyles.styleBold14.copyWith(
                          color: AppColors.c001A3F,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}
