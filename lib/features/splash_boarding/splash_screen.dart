import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';
import 'package:meal_recommendations_a2/core/utiles/app_router.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        //Todo: Configure route to onboarding screen
      },
    );
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
}
