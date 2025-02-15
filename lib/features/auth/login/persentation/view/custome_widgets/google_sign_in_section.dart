import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/manger/cubit/login_cubit.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/view/custome_widgets/or_divider.dart';

class GoogleSignInSection extends StatelessWidget {
  const GoogleSignInSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        const OrDivider(),
        SizedBox(height: screenHeight * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  context.read<LoginCubit>().signinWithGoogle();
                },
                icon: Image.asset(
                  Assets.googleIcon,
                  height: screenHeight * 0.05,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
