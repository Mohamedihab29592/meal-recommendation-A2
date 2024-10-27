import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/features/auth/otp/presentation/otp_verification_screen.dart';
import 'package:meal_recommendations_a2/features/splash_boarding/splash_screen.dart';

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
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: kOtpScreen,
        builder: (context, state) {
          final phoneNumber = state.uri.queryParameters['phoneNumber'] ?? '';
          final otpCubit = GetIt.I<OTPCubit>()..sendOTP(phoneNumber);

          return BlocProvider.value(
            value: otpCubit,
            child: OtpVerificationScreen(phoneNumber: phoneNumber),
          );
        },
      ),
    ],
  );
}
