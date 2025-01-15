import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/core/services/secure_storage/secure_storage_service.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/core/utiles/app_router.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';
import 'package:meal_recommendations_a2/features/onboarding/data/models/onboarding_view_item_model.dart';
import 'package:meal_recommendations_a2/features/onboarding/presentation/widgets/item_page_view.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController pageController;
  late int currentPageIndex;

  @override
  void initState() {
    currentPageIndex = 0;
    pageController = PageController();
    pageController.addListener(() {
      currentPageIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<OnboardingItemViewModel> onboardingItems = [
      OnboardingItemViewModel(
        currentPageIndex: currentPageIndex,
        image: Assets.homemadeSteak,
        title: 'like in a Restaurant but at home',
        subtitle:
            ', consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea qui officia deserunt mollit anim id est laborum.',
        textButton1: 'skip',
        textbutton2: 'next',
        onTapSkip: () => onTapSkip(),
        onTapNext: () => onTapNext(0),
      ),
      OnboardingItemViewModel(
        currentPageIndex: currentPageIndex,
        image: Assets.pizzaWithTomatos,
        title: 'like in a Restaurant but at home',
        subtitle:
            ', consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea qui officia deserunt mollit anim id est laborum.',
        textButton1: 'skip',
        textbutton2: 'next',
        onTapSkip: () => onTapSkip(),
        onTapNext: () => onTapNext(1),
      ),
      OnboardingItemViewModel(
        currentPageIndex: currentPageIndex,
        image: Assets.homemadeSteak,
        title: 'like in a Restaurant but at home',
        subtitle:
            ', consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea qui officia deserunt mollit anim id est laborum.',
        textButton1: 'skip',
        textbutton2: 'next',
        onTapSkip: () => onTapSkip(),
        onTapNext: () => onTapNext(2),
      ),
      OnboardingItemViewModel(
        currentPageIndex: currentPageIndex,
        image: Assets.pizzaWithTomatos,
        title: 'like in a Restaurant but at home',
        subtitle:
            ', consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea qui officia deserunt mollit anim id est laborum.',
        textButton1: '',
        textbutton2: 'login',
        onTapNext: () {
          GoRouter.of(context).push(AppRouter.kLoginScreen);
          SecureStorageServicee().write('onBoardDone', 'done');
        },
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: PageView(
        controller: pageController,
        children: List.generate(
          onboardingItems.length,
          (index) => ItemPageView(
            model: onboardingItems[index],
          ),
        ),
      ),
    );
  }

  void onTapSkip() {
    pageController.animateToPage(
      3,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }

  void onTapNext(int currentIndex) {
    pageController.animateToPage(
      currentIndex + 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }
}
