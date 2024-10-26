import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/core/utiles/app_router.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';
import 'package:meal_recommendations_a2/features/onboarding/widgets/item_page_view.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController pageController;
  int curcurrentPageIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      curcurrentPageIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        ItemPageView(
          curcurrentPageIndex: curcurrentPageIndex,
          image: Assets.WellDoneSteak_2x,
          title: 'like in a Restaurant but at home',
          subtitle:
              ', consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea qui officia deserunt mollit anim id est laborum.',
          textButton1: 'skip',
          textbutton2: 'next',
          onTap1: () {
            pageController.animateToPage(
              3,
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceIn,
            );
          },
          onTap2: () {
            pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceIn,
            );
          },
        ),
        ItemPageView(
          curcurrentPageIndex: curcurrentPageIndex,
          image: Assets.Pizza,
          title: 'like in a Restaurant but at home',
          subtitle:
              ', consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea qui officia deserunt mollit anim id est laborum.',
          textButton1: 'skip',
          textbutton2: 'next',
          onTap1: () {
            pageController.animateToPage(
              3,
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceIn,
            );
          },
          onTap2: () {
            pageController.animateToPage(
              2,
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceIn,
            );
          },
        ),
        ItemPageView(
          curcurrentPageIndex: curcurrentPageIndex,
          image: Assets.WellDoneSteak_2x,
          title: 'like in a Restaurant but at home',
          subtitle:
              ', consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea qui officia deserunt mollit anim id est laborum.',
          textButton1: 'skip',
          textbutton2: 'next',
          onTap1: () {
            pageController.animateToPage(
              3,
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceIn,
            );
          },
          onTap2: () {
            pageController.animateToPage(
              3,
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceIn,
            );
          },
        ),
        ItemPageView(
          curcurrentPageIndex: curcurrentPageIndex,
          image: Assets.Pizza,
          title: 'like in a Restaurant but at home',
          subtitle:
              ', consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea qui officia deserunt mollit anim id est laborum.',
          textButton1: '',
          textbutton2: 'login',
          onTap2: () {
            GoRouter.of(context).push(AppRouter.kLoginScreen);
          },
        )
      ],
    );
  }
}
