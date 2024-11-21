import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network_impl.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/see_all_screen_view_body.dart';
import 'package:meal_recommendations_a2/features/home/persentation/cubits/see_all_cubit/see_all_cubit.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SeeAllCubit(FirebaseNetworkServiceImpl())..fetchMealData(),
          child: const SeeAllScreenViewBody(),
        ),
      ),
    );
  }
}
