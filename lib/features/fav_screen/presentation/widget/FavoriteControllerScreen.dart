import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/features/fav_screen/presentation/cubit/fav_cubit.dart';
import 'package:meal_recommendations_a2/features/fav_screen/presentation/widget/FavoriteScreen.dart';
import 'package:meal_recommendations_a2/features/home/persentation/Widget/MyNavigationBar.dart';

class FavoriteControllerScreen extends StatelessWidget {
  const FavoriteControllerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavCubit()..loadFavorites(),
      child: Scaffold(
        body: FavoriteScreen(),
        bottomNavigationBar: const MyNavigationBar(),
      ),
    );
  }
}
