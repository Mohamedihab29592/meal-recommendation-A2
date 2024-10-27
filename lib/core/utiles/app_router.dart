import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
<<<<<<< HEAD
import 'package:meal_recommendations_a2/features/auth/otp/presentation/otp_verification_screen.dart';
import 'package:meal_recommendations_a2/features/splash_boarding/splash_screen.dart';
=======
import 'package:meal_recommendations_a2/features/auth/register/presentation/views/register_view.dart';

import '../../features/auth/login/persentation/view/sign_in/login_view.dart';
import '../../features/auth/otp/presentation/otp_verification_screen.dart';
import '../../features/onboarding/onboarding.dart';
import '../../features/splash_boarding/splash_screen.dart';
>>>>>>> 1b4938ddf4d049f27994fd84898070be5699f7d3

import '../../features/auth/otp/presentation/cubit/otp_cubit.dart';

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
<<<<<<< HEAD
      GoRoute(
        path: kOtpScreen,
        builder: (context, state) {
          final phoneNumber = state.uri.queryParameters['phoneNumber'] ?? '';
          final otpCubit = GetIt.I<OTPCubit>()..sendOTP(phoneNumber);

          return BlocProvider.value(
            value: otpCubit,
            child: OtpVerificationScreen(phoneNumber: phoneNumber),
          );
=======

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
      GoRoute(
        path: AppRouter.kOtpScreen,
        builder: (BuildContext context, GoRouterState state) {
          return  const OtpVerificationScreen(phoneNumber: '+201151827070',);
>>>>>>> 1b4938ddf4d049f27994fd84898070be5699f7d3
        },
      ),
    ],
  );


}
