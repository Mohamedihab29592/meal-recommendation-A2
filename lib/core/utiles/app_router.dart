import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/features/auth/register/presentation/views/register_view.dart';

class AppRouter {
  static const String kSplashScreen = '/';
  static const String kHomeScreen = '/home';
  static const String kLoginScreen = '/login';
  static const String kRegisterScreen = '/register';
  static const String kProfileScreen = '/profile';
  static const String kOtpScreen = '/otp';
  static const String kOnBoardingScreen = '/onboarding';

  static final GoRouter router = GoRouter(
initialLocation: AppRouter.kSplashScreen,
    routes: <RouteBase>[
      GoRoute(
        path: AppRouter.kSplashScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: AppRouter.kOnBoardingScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const Onboarding();

        },
      ),
       GoRoute(
      path: AppRouter.kLoginScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const loginView();
      },
    ),
      GoRoute(
        path: AppRouter.kRegisterScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterView();
        },
      ),
    ],
  );

  );
}