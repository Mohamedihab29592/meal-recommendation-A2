import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/view/sign_in/login_view.dart';
import 'package:meal_recommendations_a2/features/splash_boarding/splash_screen.dart';

class AppRouter {
  static const String kSplashScreen = '/';
  static const String kHomeScreen = '/home';
  static const String kLoginScreen = '/login';
  static const String kRegisterScreen = '/register';
  static const String kProfileScreen = '/profile';
  static const String kOtpScreen = '/otp';
  static const String kOnBoardingScreen = '/onboarding';
//change here
  static final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const loginView();
      },
    ),
  ],
);
}