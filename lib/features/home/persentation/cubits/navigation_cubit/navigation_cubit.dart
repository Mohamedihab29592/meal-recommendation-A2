import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/core/services/di.dart';
import 'package:meal_recommendations_a2/features/home/domain/Model/NavModel.dart';
import 'package:meal_recommendations_a2/features/home/persentation/homescreen.dart';
import 'package:meal_recommendations_a2/features/profile/data/repo_implementation/profile_repo_impl.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/controllers/cubit/profile_view_cubit.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/views/profile_view.dart';

class NavigationCubit extends Cubit<NavState> {
  NavigationCubit()
      : super(
          NavState(
            navValue: 0,
            currentScreen: MyHomeScreen(),
          ),
        );

  void getNavValue(int selectIndex) {
    Widget screen;
    switch (selectIndex) {
      case 0:
        screen = MyHomeScreen();
        break;
      case 1:
        screen = FavoriteScreen();
        break;
      case 2:
        screen = BlocProvider(
          create: (context) => ProfileViewCubit(s1<ProfileRepoImpl>()),
          child: const ProfileView(),
        );
        break;
      default:
        screen = MyHomeScreen();
    }
    emit(
      NavState(
        navValue: selectIndex,
        currentScreen: screen,
      ),
    );
  }
}
