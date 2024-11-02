import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/features/auth/register/presentation/views/register_view.dart';
import 'package:meal_recommendations_a2/features/home/persentation/homescreen.dart';
import '../../features/auth/login/persentation/view/sign_in/login_view.dart';
import '../../features/auth/otp/presentation/otp_verification_screen.dart';
import '../../features/onboarding/onboarding.dart';
import '../../features/splash_boarding/splash_screen.dart';

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
      ), GoRoute(
        path: AppRouter.kHomeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
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
      // GoRoute(
      //   path: AppRouter.kRegisterScreen,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const RegisterView();
      //   },
      // ),
      GoRoute(
        path: AppRouter.kOtpScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const OtpVerificationScreen(
            phoneNumber: '+201151827070',
          );
        },
      ),
    ],
  );
}
