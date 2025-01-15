import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/features/home/persentation/cubits/navigation_cubit/navigation_cubit.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.transparent,
      unselectedItemColor: AppColors.c939393,
      onTap: (index) {
        context.read<NavigationCubit>().getNavValue(index);
      },
      currentIndex: context.watch<NavigationCubit>().state.navValue, // Use watch to listen for changes

      // currentIndex: context.read<NavigationCubit>().state.navValue,
      items: [
        BottomNavigationBarItem(
          activeIcon: CircleAvatar(
            backgroundColor: AppColors.c001A3F,
            radius: 35,
            child: Icon(
              Icons.home,
              color: AppColors.cFFFFFF,
              size: 40,
            ),
          ),
          label: "Home",
          icon: const Icon(
            Icons.home,
            color: AppColors.c001A3F,
          ),
        ),
        BottomNavigationBarItem(
          label: "favorite",
          activeIcon: CircleAvatar(
            backgroundColor: AppColors.c001A3F,
            radius: 35,
            child: Icon(
              Icons.favorite_border,
              color: AppColors.cFFFFFF,
              size: 40,
            ),
          ),
          icon: const Icon(
            color: AppColors.c001A3F,
            Icons.favorite_border,
          ),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          activeIcon: CircleAvatar(
            backgroundColor: AppColors.c001A3F,
            radius: 35,
            child: Icon(
              Icons.person,
              color: AppColors.cFFFFFF,
              size: 40,
            ),
          ),
          icon: const Icon(
            color: AppColors.c001A3F,
            Icons.person,
          ),
        ),
      ],
    );
  }
}
