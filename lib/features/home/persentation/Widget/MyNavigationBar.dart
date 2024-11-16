import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';

import '../cubits/home_cubit/home_cubit.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.transparent,
      unselectedItemColor: AppColors.c_939393,
      onTap: (index) {
        context.read<NavigationCubit>().getNavValue(index);
      },
      currentIndex: context
          .watch<NavigationCubit>()
          .state
          .navValue, // Use watch to listen for changes

      // currentIndex: context.read<NavigationCubit>().state.navValue,
      items: [
        BottomNavigationBarItem(
          activeIcon: CircleAvatar(
            backgroundColor: AppColors.c_001A3F,
            radius: 35,
            child: Icon(
              Icons.home,
              color: AppColors.c_FFFFFF,
              size: 40,
            ),
          ),
          label: "Home",
          icon: Icon(
            Icons.home,
            color: AppColors.c_001A3F,
          ),
        ),
        BottomNavigationBarItem(
          label: "favorite",
          activeIcon: CircleAvatar(
            backgroundColor: AppColors.c_001A3F,
            radius: 35,
            child: Icon(
              Icons.favorite_border,
              color: AppColors.c_FFFFFF,
              size: 40,
            ),
          ),
          icon: Icon(
            color: AppColors.c_001A3F,
            Icons.favorite_border,
          ),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          activeIcon: CircleAvatar(
            backgroundColor: AppColors.c_001A3F,
            radius: 35,
            child: Icon(
              Icons.person,
              color: AppColors.c_FFFFFF,
              size: 40,
            ),
          ),
          icon: Icon(
            color: AppColors.c_001A3F,
            Icons.person,
          ),
        ),
      ],
    );
  }
}
