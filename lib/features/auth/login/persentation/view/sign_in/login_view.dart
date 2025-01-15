import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network.dart';
import 'package:meal_recommendations_a2/core/services/di.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/manger/cubit/login_cubit.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/view/sign_in/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(s1.get<AuthLogin>()),
      child: const Scaffold(
        body: LoginViewBodyBlocConsumer(),
      ),
    );
  }
}
