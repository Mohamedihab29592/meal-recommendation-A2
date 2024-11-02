import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/features/home/domain/Model/NavModel.dart';
import 'package:meal_recommendations_a2/features/home/persentation/homescreen.dart';

part 'home_state.dart';

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
        screen = OrderScreen();
        break;
      case 2:
        screen = PersonScreen();
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
