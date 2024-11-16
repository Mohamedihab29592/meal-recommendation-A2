import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/core/services/di.dart';
import 'package:meal_recommendations_a2/features/home/persentation/homescreen.dart';
import 'package:meal_recommendations_a2/features/profile/data/repo_implementation/profile_repo_impl.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/controllers/cubit/profile_view_cubit.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/views/profile_view.dart';
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
  static const String kFavScreen = '/fav';
  static const String kSeeAllScreen = '/seeAll';

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
        path: AppRouter.kHomeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return ControllerScreen();
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
      // GoRoute(
      //   path: AppRouter.kOtpScreen,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const OtpVerificationScreen(
      //       phoneNumber: '+201118175938',
      //     );
      //   },
      // ),

      //OTP SCREEN
      GoRoute(
        path: AppRouter.kOtpScreen,
        builder: (context, state) {
          final phoneNumber = state.extra as String;
          return OtpVerificationScreen(phoneNumber: phoneNumber);
        },
      ),
      GoRoute(
        path: AppRouter.kProfileScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => ProfileViewCubit(s1<ProfileRepoImpl>()),
            child: const ProfileView(),
          );
        },
      ),

      GoRoute(
        path: AppRouter.kSeeAllScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const SeeAll();
        },
      ),
      ),

      GoRoute(
        path: AppRouter.kFavScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => FavCubit()..loadFavorites(),
            child: Scaffold(
              body: FavoriteScreen(),
              bottomNavigationBar: const MyNavigationBar(),
            ),
          );
        },
      ),
    ],
  );
}
