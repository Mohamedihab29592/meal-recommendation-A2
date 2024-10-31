// main.dart
import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/features/fav_screen/favorite_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Favorite Screen Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FavoriteScreen(),
    );
  }
}
