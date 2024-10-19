import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'features/splash_boarding/splash_screen.dart';
import 'firebase_options.dart';

void main() async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Meal - Recommendation',
      home: SplashScreen(),
    );
  }
}


