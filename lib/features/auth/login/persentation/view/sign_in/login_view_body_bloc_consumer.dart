
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/core/services/build_error_bar.dart';

import 'package:meal_recommendations_a2/features/auth/login/persentation/manger/cubit/login_cubit.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/view/custome_widgets/custom_progress_hud.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/view/sign_in/login_view_body.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
         print('success');
        }

        if (state is LoginError) {
          buildErrorBar(context, state.errMsg);
        }
      },
      builder: (context, state) {
        // Provide a simple default WeatherModel instance
        return CustomProgressHud(
          isLoading: state is LoginLoading ? true : false,
          child: LoginViewBody()
        );
      },
    );
  }
}
