import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendations_a2/core/services/secure_storage.dart';
import 'package:meal_recommendations_a2/core/services/secure_storage/secure_storage_service.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/core/utiles/app_router.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String? userId;
  String? onBoardDone;
  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
    );

    _controller.forward();
    navigatoTo();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_001A3F,
      body: Column(
        children: [
          const Expanded(flex: 1, child: SizedBox()),
          Row(
            children: [
              const Expanded(flex: 4, child: SizedBox()),
              Expanded(
                flex: 5,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animation.value,
                      child: Image.asset(Assets.assetsLogo, fit: BoxFit.fill),
                    );
                  },
                ),
              ),
              const Expanded(flex: 4, child: SizedBox()),
            ],
          ),
          const Expanded(flex: 2, child: SizedBox()),
        ],
      ),
    );
  }

  Future<void> navigatoTo() async {
    userId = await SecureStorageService().getUID();
    onBoardDone = await SecureStorageServicee().read('onBoardDone');
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        if (mounted) {
          if (userId != null) {
            GoRouter.of(context).go(AppRouter.kHomeScreen);
          } else {
            if (onBoardDone != null) {
              GoRouter.of(context).go(AppRouter.kLoginScreen);
            } else {
              GoRouter.of(context).go(AppRouter.kOnBoardingScreen);
            }
          }
        }
      },
    );
  }
}
